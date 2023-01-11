
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {trapinch}

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

Functions are all prefaced `get_*()` and return a list.

For example, retrieve a named Pokémon’s details:

``` r
bulba <- trapinch::get_pokemon("bulbasaur")
bulba$moves[[1]]$move$name
#> [1] "razor-wind"
```

Another is example is to retrieve an item’s details:

``` r
ball <- trapinch::get_item("poke-ball")
ball$flavor_text_entries[[1]]$text
#> [1] "A tool used for\ncatching wild\nPOKéMON."
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
