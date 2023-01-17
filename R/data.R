
#' All Resources and Endpoints
#'
#' IDs, names and URLs for all the resources for each endpoint that can be
#' requested from the PokéAPI.
#'
#' @source API by PokéAPI <https://pokeapi.co/>. Data from The Pokémon Company.
#'
#' @format A list of dataframes of length 48, which is one per endpoint
#'     available from PokéAPI. Each dataframe has columns \code{id} (integer),
#'     \code{name} (character) (possibly) and \code{url} (character), and a
#'     number of rows equal to the total number of resources available for the
#'     given endpoint.
"resource_lookups"
