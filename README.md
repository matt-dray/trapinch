
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {trapinch} <img src="man/figures/logo.png" align="right" height="138" />

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![R-CMD-check](https://github.com/matt-dray/trapinch/workflows/R-CMD-check/badge.svg)](https://github.com/matt-dray/trapinch/actions)
[![Codecov test
coverage](https://codecov.io/gh/matt-dray/trapinch/branch/main/graph/badge.svg)](https://app.codecov.io/gh/matt-dray/trapinch?branch=main)
<!-- badges: end -->

An R package to interface with [the PokéAPI
service](https://pokeapi.co/), based on
[{httr2}](https://httr2.r-lib.org/).

Why ‘Trapinch’? Because [it’s a
Pokémon](https://bulbapedia.bulbagarden.net/wiki/Trapinch_(Pok%C3%A9mon))
whose name contains ‘R API’ and it wasn’t claimed on
[Repokemon](https://cheeaun.github.io/repokemon/) yet, lol.

## Installation

You can install {trapinch} from GitHub with help from
[{remotes}](https://remotes.r-lib.org/):

``` r
if (!require(remotes)) install.packages("remotes")
remotes::install_github("matt-dray/trapinch")
```

## Example

Functions are all prefaced `get_*()` and return a list. The generic
request function is `get_pokeapi()`, to which you can provide an
`endpoint` and `resource` of interest. Each endpoint also has its own
function to which you need only supply the resource of interest.

For example, retrieve a named Pokémon’s details:

``` r
bulba <- trapinch::get_pokemon("bulbasaur")
bulba$moves[[1]]$move$name
#> [1] "razor-wind"
```

Or retrieve an item’s details:

``` r
ball <- trapinch::get_item("poke-ball")
ball$flavor_text_entries[[1]]$text
#> [1] "A tool used for\ncatching wild\nPOKéMON."
```

If you’re wondering what endpoints and resources exist, you can find
them in the `resource_lookups` list object. The endpoints:

``` r
names(trapinch::resource_lookups)
#>  [1] "berry"                     "berry-firmness"           
#>  [3] "berry-flavor"              "contest-type"             
#>  [5] "contest-effect"            "super-contest-effect"     
#>  [7] "encounter-method"          "encounter-condition"      
#>  [9] "encounter-condition-value" "evolution-chain"          
#> [11] "evolution-trigger"         "generation"               
#> [13] "pokedex"                   "version"                  
#> [15] "version-group"             "item"                     
#> [17] "item-attribute"            "item-category"            
#> [19] "item-fling-effect"         "item-pocket"              
#> [21] "location"                  "location-area"            
#> [23] "pal-park-area"             "region"                   
#> [25] "machine"                   "item-pocket"              
#> [27] "move-ailment"              "move-battle-style"        
#> [29] "move-category"             "move-damage-class"        
#> [31] "move-learn-method"         "move-target"              
#> [33] "ability"                   "characteristic"           
#> [35] "egg-group"                 "gender"                   
#> [37] "growth-rate"               "nature"                   
#> [39] "pokeathlon-stat"           "pokemon"                  
#> [41] "pokemon-color"             "pokemon-form"             
#> [43] "pokemon-habitat"           "pokemon-shape"            
#> [45] "pokemon-species"           "stat"                     
#> [47] "type"                      "language"
```

And an example resource table for Pokémon types:

``` r
trapinch::resource_lookups[["type"]]
#>    id     name                                   url
#> 1   1   normal     https://pokeapi.co/api/v2/type/1/
#> 2   2 fighting     https://pokeapi.co/api/v2/type/2/
#> 3   3   flying     https://pokeapi.co/api/v2/type/3/
#> 4   4   poison     https://pokeapi.co/api/v2/type/4/
#> 5   5   ground     https://pokeapi.co/api/v2/type/5/
#> 6   6     rock     https://pokeapi.co/api/v2/type/6/
#> 7   7      bug     https://pokeapi.co/api/v2/type/7/
#> 8   8    ghost     https://pokeapi.co/api/v2/type/8/
#> 9   9    steel     https://pokeapi.co/api/v2/type/9/
#> 10 10     fire    https://pokeapi.co/api/v2/type/10/
#> 11 11    water    https://pokeapi.co/api/v2/type/11/
#> 12 12    grass    https://pokeapi.co/api/v2/type/12/
#> 13 13 electric    https://pokeapi.co/api/v2/type/13/
#> 14 14  psychic    https://pokeapi.co/api/v2/type/14/
#> 15 15      ice    https://pokeapi.co/api/v2/type/15/
#> 16 16   dragon    https://pokeapi.co/api/v2/type/16/
#> 17 17     dark    https://pokeapi.co/api/v2/type/17/
#> 18 18    fairy    https://pokeapi.co/api/v2/type/18/
#> 19 19  unknown https://pokeapi.co/api/v2/type/10001/
#> 20 20   shadow https://pokeapi.co/api/v2/type/10002/
```

# Expectations

I’m developing {trapinch} to familiarise myself with {httr2}, API
handling and unit testing of functions that talk to the internet. Expect
a lot of change, but it might not get updated much or often.

# Similar projects

Wrappers in several languages are named on [the PokéAPI
website](https://pokeapi.co/docs/v2#wrap). None of these are for R,
although I’m aware of [{pokedex} from
UBC-MDS](https://github.com/UBC-MDS/pokedex) (not on CRAN).

# Thanks

This package was made easier with help from [the PokéAPI
documentation](https://pokeapi.co/docs/v2), [the {httr2}
documentation](https://httr2.r-lib.org/index.html) and [Colin Fay’s
post](https://colinfay.me/build-api-wrapper-package-r/).
