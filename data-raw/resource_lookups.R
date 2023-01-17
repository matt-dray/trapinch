# Create lookup of endpoints and resources

library(httr2)
library(tidyverse)
library(usethis)

base <- "https://pokeapi.co/api/v2/"
agent <- "trapinch (http://github.com/matt-dray/trapinch)"

# Request all endpoints
endpoints <- request(base) |>
  req_user_agent(agent) |>
  req_perform() |>
  resp_body_json()

# Request for all endpoints so we can get the count of resources in each
resources <- map(
  endpoints,
  \(endpoint) request(endpoint) |>
    req_user_agent(agent) |>
    req_url_query(limit = 1) |>  # we don't care about the body for now
    req_perform() |>
    resp_body_json()
)

# Prepare the resource count for each endpoint
endpoint_counts <-
  map(resources, \(resource) pluck(resource, "count")) |>
  enframe(name = "endpoint", value = "count") |>
  unnest(count)

# Request all endpoint resources
resources <- map2(
  endpoint_counts[["endpoint"]],
  endpoint_counts[["count"]],
  \(resource, count) request(base) |>
    req_user_agent(agent) |>
    req_url_path_append(resource) |>
    req_url_query(limit = count) |>
    req_perform() |>
    resp_body_json()
) |>
  set_names(endpoint_counts[["endpoint"]])

# Simplify to a list of dataframes
resource_lookups <- map(
  resources,
  \(resource) {

    table <- resource[["results"]] |>
      enframe(name = "order") |>
      unnest_wider(value) |>
      mutate(id = as.integer(str_extract(url, "(?<=/)(-)?\\d+(?=/$)")))

    if ("name" %in% names(table)) {
      table <- select(table, id, name, url)
    } else {
      table <- select(table, id, url)
    }

    return(table)

  }
)

use_data(resource_lookups, overwrite = TRUE)
