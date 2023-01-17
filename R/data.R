
#' PokéAPI Endpoints and Resources Lookup
#'
#' IDs, names and URLs for each resource from each endpoint available from the
#' PokéAPI. These can be passed used in each of the package's \code{get_*()}
#' functions.
#'
#' @source API by PokéAPI <https://pokeapi.co/>. Data from The Pokémon Company.
#'
#' @format A list of length 48. Each element is a dataframe that represents the
#'     possible resources for each PokéAPI endpoint. The  dataframes have
#'     columns \code{id} (integer), \code{name} (character) where relevant and
#'     corresponding \code{url} (character). The number of rows in each
#'     dataframe is equal to the total number of resources  available for the
#'     given endpoint.
"resource_lookups"
