
#' Get Data from the PokéAPI Service
#'
#' @param endpoint Character. The name of the endpoint to query. This includes
#'     categories such as \code{"pokemon"}, \code{"locations"} or
#'     \code{"berries"}. See details.
#' @param resource Character or numeric. The name or ID of the resource to
#'     return from the named endpoint. Most 'get' functions can accept either,
#'     but some only accept an ID. Defaults to \code{NULL}, in which case all
#'     possible resources are returned for the provided \code{endpoint}. See
#'     details.
#' @param ext Character. Further extension to the provided endpoint and
#'     resource. Defaults to \code{NULL}. Only used for the 'pokemon' endpoint
#'     to find Pokémon encounters.
#' @param verbose Logical. Show extra API-related output when request is
#'     performed? Defaults to \code{FALSE}.
#'
#' @details Note that the 'trapinch' package uses version 2 of the API. See
#'     \href{https://pokeapi.co/docs/v2}{the PokéAPI documentation} for more
#'     information and a full list of endpoints and resources. You can also view
#'     the built-in \code{\link{resource_lookups}} data for this information.
#'     Results are cached.
#'
#' @return A list. The exact contents depend on the endpoint and resource being
#'     requested
#'
#' @source API by PokéAPI <https://pokeapi.co/>. Data from The Pokémon Company.
#'
#' @export
#'
#' @examples \dontrun{get_pokeapi("pokemon", "bulbasaur")}
get_pokeapi <- function(
    endpoint,
    resource = NULL,
    ext = NULL,
    verbose = FALSE
) {

  # .check_internet()
  .check_args(endpoint, resource, ext, verbose)
  .check_endpoint_exists(endpoint, resource)

  base <- "https://pokeapi.co/api/v2/"
  agent <- "trapinch (http://github.com/matt-dray/trapinch)"
  resource_count <- nrow(trapinch::resource_lookups[[endpoint]])

  request <- httr2::request(base) |>
    httr2::req_url_path_append(endpoint, resource, ext) |>
    httr2::req_url_query(limit = resource_count) |>
    httr2::req_cache(tools::R_user_dir("trapinch", which = "cache"))

  if (verbose) {
    request <- httr2::req_verbose(request)
  }

  request |>
    httr2::req_user_agent(agent) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

}


# Berries -----------------------------------------------------------------


#' Get Data from PokeAPI: Berries
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_berry("cheri")}
get_berry <- function(resource = NULL) {
  get_pokeapi("berry", resource)
}

#' Get Data from PokeAPI: Berry Firmnesses
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_berry_firmness("very-soft")}
get_berry_firmness <- function(resource = NULL) {
  get_pokeapi("berry-firmness", resource)
}

#' Get Data from PokeAPI: Berry Flavors
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_berry_flavor("spicy")}
get_berry_flavor <- function(resource = NULL) {
  get_pokeapi("berry-flavor", resource)
}


# Contests ----------------------------------------------------------------


#' Get Data from PokeAPI: Contest Types
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_contest_type("cool")}
get_contest_type <- function(resource = NULL) {
  get_pokeapi("contest-type", resource)
}

#' Get Data from PokeAPI: Contest Effects
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_contest_effect(1)}
get_contest_effect <- function(resource = NULL) {
  get_pokeapi("contest-effect", resource)
}

#' Get Data from PokeAPI: Super Contest Effects
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_super_contest_effect(1)}
get_super_contest_effect <- function(resource = NULL) {
  get_pokeapi("super-contest-effect", resource)
}


# Encounters --------------------------------------------------------------


#' Get Data from PokeAPI: Encounter Methods
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_encounter_method("walk")}
get_encounter_method <- function(resource = NULL) {
  get_pokeapi("encounter-method", resource)
}

#' Get Data from PokeAPI: Encounter Conditions
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_encounter_condition("swarm")}
get_encounter_condition <- function(resource = NULL) {
  get_pokeapi("encounter-condition", resource)
}

#' Get Data from PokeAPI: Encounter Condition Values
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_encounter_condition_value("swarm-yes")}
get_encounter_condition_value <- function(resource = NULL) {
  get_pokeapi("encounter-condition-value", resource)
}


# Evolution ---------------------------------------------------------------


#' Get Data from PokeAPI: Evolution Chains
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_evolution_chain(1)}
get_evolution_chain <- function(resource = NULL) {
  get_pokeapi("evolution-chain", resource)
}

#' Get Data from PokeAPI: Evolution Triggers
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_evolution_trigger("level-up")}
get_evolution_trigger <- function(resource = NULL) {
  get_pokeapi("evolution-trigger", resource)
}


# Games -------------------------------------------------------------------


#' Get Data from PokeAPI: Generations
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_generation("generation-i")}
get_generation  <- function(resource = NULL) {
  get_pokeapi("generation", resource)
}


# Pokedexes ---------------------------------------------------------------


#' Get Data from PokeAPI: Pokedexes
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_pokedex("kanto")}
get_pokedex  <- function(resource = NULL) {
  get_pokeapi("pokedex", resource)
}


# Version -----------------------------------------------------------------


#' Get Data from PokeAPI: Version
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_version("red")}
get_version <- function(resource = NULL) {
  get_pokeapi("version", resource)
}

#' Get Data from PokeAPI: Version Groups
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_version_group("red-blue")}
get_version_group <- function(resource = NULL) {
  get_pokeapi("version-group", resource)
}


# Items -------------------------------------------------------------------


#' Get Data from PokeAPI: Items
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_item("master-ball")}
get_item <- function(resource = NULL) {
  get_pokeapi("item", resource)
}

#' Get Data from PokeAPI: Item Attributes
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_item_attribute("countable")}
get_item_attribute <- function(resource = NULL) {
  get_pokeapi("item-attribute", resource)
}

#' Get Data from PokeAPI: Item Categories
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_item_category("stat-boosts")}
get_item_category <- function(resource = NULL) {
  get_pokeapi("item-category", resource)
}

#' Get Data from PokeAPI: Item Fling Effects
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_item_fling_effect("badly-poison")}
get_item_fling_effect <- function(resource = NULL) {
  get_pokeapi("item-fling-effect", resource)
}

#' Get Data from PokeAPI: Item Pockets
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_item_pocket("misc")}
get_item_pocket <- function(resource = NULL) {
  get_pokeapi("item-pocket", resource)
}


# Locations ---------------------------------------------------------------


#' Get Data from PokeAPI: Locations
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_location("canalave-city")}
get_location <- function(resource = NULL) {
  get_pokeapi("location", resource)
}

#' Get Data from PokeAPI: Location Areas
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_location_area("canalave-city-area")}
get_location_area <- function(resource = NULL) {
  get_pokeapi("location-area", resource)
}

#' Get Data from PokeAPI: Pal Park Areas
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_pal_park_area("forest")}
get_pal_park_area <- function(resource = NULL) {
  get_pokeapi("pal-park-area", resource)
}

#' Get Data from PokeAPI: Regions
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_region("kanto")}
get_region <- function(resource = NULL) {
  get_pokeapi("region", resource)
}


# Machines ----------------------------------------------------------------


#' Get Data from PokeAPI: Machines
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_machine(1)}
get_machine <- function(resource = NULL) {
  get_pokeapi("machine", resource)
}


# Moves -------------------------------------------------------------------


#' Get Data from PokeAPI: Moves
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_move("pound")}
get_move <- function(resource = NULL) {
  get_pokeapi("item-pocket", resource)
}

#' Get Data from PokeAPI: Move Ailments
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_move_ailment("paralysis")}
get_move_ailment <- function(resource = NULL) {
  get_pokeapi("move-ailment", resource)
}

#' Get Data from PokeAPI: Move Battle Styles
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_move_battle_style("attack")}
get_move_battle_style <- function(resource = NULL) {
  get_pokeapi("move-battle-style", resource)
}

#' Get Data from PokeAPI: Move Categories
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_move_category("ailment")}
get_move_category <- function(resource = NULL) {
  get_pokeapi("move-category", resource)
}

#' Get Data from PokeAPI: Move Damage Classes
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_move_damage_class("status")}
get_move_damage_class <- function(resource = NULL) {
  get_pokeapi("move-damage-class", resource)
}

#' Get Data from PokeAPI: Move Learn Methods
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_move_learn_method("level-up")}
get_move_learn_method <- function(resource = NULL) {
  get_pokeapi("move-learn-method", resource)
}

#' Get Data from PokeAPI: Move Targets
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_move_target("specific-move")}
get_move_target <- function(resource = NULL) {
  get_pokeapi("move-target", resource)
}


# Pokemon -----------------------------------------------------------------


#' Get Data from PokeAPI: Abilities
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_ability("stench")}
get_ability <- function(resource = NULL) {
  get_pokeapi("ability", resource)
}

#' Get Data from PokeAPI: Characteristics
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_characteristic(1)}
get_characteristic <- function(resource = NULL) {
  get_pokeapi("characteristic", resource)
}

#' Get Data from PokeAPI: Egg Groups
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_egg_group("monster")}
get_egg_group <- function(resource = NULL) {
  get_pokeapi("egg-group", resource)
}

#' Get Data from PokeAPI: Genders
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_gender("female")}
get_gender <- function(resource = NULL) {
  get_pokeapi("gender", resource)
}

#' Get Data from PokeAPI: Growth rates
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_growth_rate("slow")}
get_growth_rate <- function(resource = NULL) {
  get_pokeapi("growth-rate", resource)
}

#' Get Data from PokeAPI: Natures
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_nature("bold")}
get_nature <- function(resource = NULL) {
  get_pokeapi("nature", resource)
}

#' Get Data from PokeAPI: Pokeathlon Stats
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_pokeathlon_stat("speed")}
get_pokeathlon_stat <- function(resource = NULL) {
  get_pokeapi("pokeathlon-stat", resource)
}

#' Get Data from PokeAPI: Pokemon
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_pokemon("clefairy")}
get_pokemon <- function(resource = NULL) {
  get_pokeapi("pokemon", resource)
}

#' Get Data from PokeAPI: Pokemon Location Areas
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_pokemon_encounters("bulbasaur")}
get_pokemon_location_areas  <- function(resource) {
  get_pokeapi("pokemon", resource, "encounters")
}

#' Get Data from PokeAPI: Pokemon Colors
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_pokemon_color("black")}
get_pokemon_color <- function(resource = NULL) {
  get_pokeapi("pokemon-color", resource)
}

#' Get Data from PokeAPI: Pokemon Forms
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_pokemon_form("arceus-bug")}
get_pokemon_form <- function(resource = NULL) {
  get_pokeapi("pokemon-form", resource)
}

#' Get Data from PokeAPI: Pokemon Habitats
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_pokemon_habitat("cave")}
get_pokemon_habitat <- function(resource = NULL) {
  get_pokeapi("pokemon-habitat", resource)
}

#' Get Data from PokeAPI: Pokemon Shapes
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_pokemon_shape("ball")}
get_pokemon_shape <- function(resource = NULL) {
  get_pokeapi("pokemon-shape", resource)
}

#' Get Data from PokeAPI: Pokemon Species
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_pokemon_species("wormadam")}
get_pokemon_species <- function(resource = NULL) {
  get_pokeapi("pokemon-species", resource)
}

#' Get Data from PokeAPI: Stats
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_stat("attack")}
get_stat <- function(resource = NULL) {
  get_pokeapi("stat", resource)
}

#' Get Data from PokeAPI: Types
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_type("ground")}
get_type <- function(resource = NULL) {
  get_pokeapi("type", resource)
}


# Utility -----------------------------------------------------------------


#' Get Data from PokeAPI: Languages
#' @inherit get_pokeapi
#' @export
#' @examples \dontrun{get_language("ja")}
get_language <- function(resource = NULL) {
  get_pokeapi("language", resource)
}
