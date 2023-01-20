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

test_that("argument 'verbose' errors", {

  expect_error(get_pokeapi(endpoint = "pokemon", resource = "mew", verbose = 1))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = "mew", verbose = "x"))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = "mew", verbose = NULL))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = "mew", verbose = NA_character_))

})
