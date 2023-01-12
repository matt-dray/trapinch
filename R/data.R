
#' All Endpoint Resources
#'
#' IDs, names and URLs for all the resources for each endpoint that can be
#' requested from the PokéAPI.
#'
#' @source PokéAPI <https://pokeapi.co/>.
#'
#' @format A list of dataframes of length 48, which is the number of endpoints
#'     available from PokéAPI. Each dataframe has columns \code{id}, \code{name}
#'     (possibly) and \code{url}, and a number of rows equal to the total number
#'     of resources for the given endpoint.
"resource_lookups"
