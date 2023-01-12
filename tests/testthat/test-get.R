test_that("argument 'endpoint' errors", {
  expect_error(get_pokeapi(endpoint = 1))
  expect_error(get_pokeapi(endpoint = NULL))
  expect_error(get_pokeapi(endpoint = NA_character_))
})

test_that("argument 'resource' errors", {

  expect_error(get_pokeapi(endpoint = "pokemon", resource = 1))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = NULL))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = NA_character_))

  expect_error(get_pokeapi(endpoint = "contest-effect", resource = NULL))
  expect_error(get_pokeapi(endpoint = "contest-effect", resource = "x"))

})

test_that("argument 'ext' errors", {
  expect_error(get_pokeapi(endpoint = "pokemon", resource = "ditto", ext = 1))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = "ditto", ext = NA_character_))
  expect_error(get_pokeapi(endpoint = "berry",   resource = "ditto", ext = "encounters"))
})

test_that("argument 'verbose' errors", {
  expect_error(get_pokeapi(endpoint = "pokemon", resource = "ditto", verbose = 1))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = "ditto", verbose = "x"))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = "ditto", verbose = NULL))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = "ditto", verbose = NA_character_))
})
