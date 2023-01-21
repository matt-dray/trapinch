with_mock_dir("endpoint", {
  test_that("argument 'endpoint' works correctly", {

    expect_type(get_pokeapi(endpoint = "move-battle-style"), "list")
    expect_length(get_pokeapi(endpoint = "move-battle-style"), 4)

    expect_error(get_pokeapi(endpoint = "x"))
    expect_error(get_pokeapi(endpoint = 1))
    expect_error(get_pokeapi(endpoint = Inf))
    expect_error(get_pokeapi(endpoint = pi))
    expect_error(get_pokeapi(endpoint = NULL))
    expect_error(get_pokeapi(endpoint = NA_character_))

  })
})

with_mock_dir("resource", {
  test_that("argument 'resource' works correctly", {

    expect_type(get_pokeapi(endpoint = "move-battle-style", resource = "attack"), "list")
    expect_length(get_pokeapi(endpoint = "move-battle-style", resource = "attack"), 3)

    expect_error(get_pokeapi(endpoint = "pokemon", resource = "x"))
    expect_error(get_pokeapi(endpoint = "pokemon", resource = Inf))
    expect_error(get_pokeapi(endpoint = "pokemon", resource = 999999))
    expect_error(get_pokeapi(endpoint = "pokemon", resource = pi))
    expect_error(get_pokeapi(endpoint = "pokemon", resource = NA_character_))
    expect_error(get_pokeapi(endpoint = "pokemon", resource = NA_real_))

    expect_error(get_pokeapi(endpoint = "contest-effect", resource = "x"))
    expect_error(get_pokeapi(endpoint = "contest-effect", resource = Inf))
    expect_error(get_pokeapi(endpoint = "contest-effect", resource = 999999))
    expect_error(get_pokeapi(endpoint = "contest-effect", resource = pi))
    expect_error(get_pokeapi(endpoint = "contest-effect", resource = NA_character_))
    expect_error(get_pokeapi(endpoint = "contest-effect", resource = NA_real_))

  })
})

with_mock_dir("ext", {
  test_that("argument 'ext' works correctly", {

    expect_type(
      get_pokeapi(endpoint = "pokemon", resource = "mew", ext = "encounters"),
      "list"
    )

    expect_length(
      get_pokeapi(endpoint = "pokemon", resource = "mew", ext = "encounters"),
      1
    )

    expect_error(get_pokeapi(endpoint = "pokemon", resource = "mew", ext = 1))
    expect_error(get_pokeapi(endpoint = "pokemon", resource = "mew", ext = NA_character_))
    expect_error(get_pokeapi(endpoint = "berry",   resource = "mew", ext = "encounters"))

  })
})

with_mock_dir("verbose", {
  test_that("argument 'verbose' works correctly", {

    expect_type(get_pokeapi(endpoint = "move-battle-style", verbose = TRUE), "list")
    expect_length(get_pokeapi(endpoint = "move-battle-style", verbose = TRUE), 4)

    expect_error(get_pokeapi(endpoint = "pokemon", resource = "mew", verbose = 1))
    expect_error(get_pokeapi(endpoint = "pokemon", resource = "mew", verbose = "x"))
    expect_error(get_pokeapi(endpoint = "pokemon", resource = "mew", verbose = NULL))
    expect_error(get_pokeapi(endpoint = "pokemon", resource = "mew", verbose = NA_character_))

  })
})

with_mock_dir("get-variants", {
  test_that("each `get_` works correctly", {
    expect_type(get_ability(), "list")
    expect_type(get_berry(), "list")
    expect_type(get_berry_firmness(), "list")
    expect_type(get_berry_flavor(), "list")
    expect_type(get_characteristic(), "list")
    expect_type(get_contest_effect(), "list")
    expect_type(get_contest_type(), "list")
    expect_type(get_egg_group(), "list")
    expect_type(get_encounter_condition(), "list")
    expect_type(get_encounter_condition_value(), "list")
    expect_type(get_encounter_method(), "list")
    expect_type(get_evolution_chain(), "list")
    expect_type(get_evolution_trigger(), "list")
    expect_type(get_gender(), "list")
    expect_type(get_generation(), "list")
    expect_type(get_growth_rate(), "list")
    expect_type(get_item(), "list")
    expect_type(get_item_attribute(), "list")
    expect_type(get_item_category(), "list")
    expect_type(get_item_fling_effect(), "list")
    expect_type(get_item_pocket(), "list")
    expect_type(get_language(), "list")
    expect_type(get_location(), "list")
    expect_type(get_location_area(), "list")
    expect_type(get_machine(), "list")
    expect_type(get_move(), "list")
    expect_type(get_move_ailment(), "list")
    expect_type(get_move_battle_style(), "list")
    expect_type(get_move_category(), "list")
    expect_type(get_move_damage_class(), "list")
    expect_type(get_move_learn_method(), "list")
    expect_type(get_move_target(), "list")
    expect_type(get_nature(), "list")
    expect_type(get_pal_park_area(), "list")
    expect_type(get_pokeathlon_stat(), "list")
    expect_type(get_pokedex(), "list")
    expect_type(get_pokemon(), "list")
    expect_type(get_pokemon_color(), "list")
    expect_type(get_pokemon_form(), "list")
    expect_type(get_pokemon_habitat(), "list")
    expect_type(get_pokemon_location_areas("mew"), "list")
    expect_type(get_pokemon_shape(), "list")
    expect_type(get_pokemon_species(), "list")
    expect_type(get_region(), "list")
    expect_type(get_stat(), "list")
    expect_type(get_super_contest_effect(), "list")
    expect_type(get_type(), "list")
    expect_type(get_version(), "list")
    expect_type(get_version_group(), "list")
  })
})


test_that("cache clear returns message", {

  expect_message(clear_cache())

  test <- "x"
  save(test, file = file.path(tools::R_user_dir("trapinch", "cache"), "test.rds"))
  expect_message(clear_cache())

})
