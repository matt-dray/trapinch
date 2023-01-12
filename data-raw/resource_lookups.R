library(tidyverse)
library(httr2)

resources <- c(
  "berry",
  "berry-firmness",
  "berry-flavor",
  "contest-type",
  "contest-effect",
  "super-contest-effect",
  "encounter-method",
  "encounter-condition",
  "encounter-condition-value",
  "evolution-chain",
  "evolution-trigger",
  "generation",
  "pokedex",
  "version",
  "version-group",
  "item",
  "item-attribute",
  "item-category",
  "item-fling-effect",
  "item-pocket",
  "location",
  "location-area",
  "pal-park-area",
  "region",
  "machine",
  "item-pocket",
  "move-ailment",
  "move-battle-style",
  "move-category",
  "move-damage-class",
  "move-learn-method",
  "move-target",
  "ability",
  "characteristic",
  "egg-group",
  "gender",
  "growth-rate",
  "nature",
  "pokeathlon-stat",
  "pokemon",
  "pokemon-color",
  "pokemon-form",
  "pokemon-habitat",
  "pokemon-shape",
  "pokemon-species",
  "stat",
  "type",
  "language"
  )

resources_request <- map(
  resources,
  \(x) {
    request(paste0("https://pokeapi.co/api/v2/", x)) |>
      req_user_agent("trapinch (http://github.com/matt-dray/trapinch)") |>
      req_perform() |>
      resp_body_json()
  }
) %>%
  set_names(resources)

resource_lookups <- map(
  resources_request,
  \(x) {
    x[["results"]] |>
      enframe(name = "id") |>
      unnest_wider(value)
  }
)

usethis::use_data(resource_lookups, overwrite = TRUE)
