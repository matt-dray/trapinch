test_that("endpoint errors", {
  expect_error(get_pokeapi(endpoint = 1))
  expect_error(get_pokeapi(endpoint = NULL))
  expect_error(get_pokeapi(endpoint = NA_character_))
})

test_that("resource errors", {

  expect_error(get_pokeapi(endpoint = "pokemon", resource = 1))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = NULL))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = NA_character_))

  expect_error(get_pokeapi(endpoint = "contest-effect", resource = NULL))
  expect_error(get_pokeapi(endpoint = "contest-effect", resource = "x"))

})

test_that("ext errors", {
  expect_error(get_pokeapi(endpoint = "pokemon", resource = "ditto", ext = 1))
  expect_error(get_pokeapi(endpoint = "pokemon", resource = "ditto", ext = NA_character_))
  expect_error(get_pokeapi(endpoint = "berry",   resource = "ditto", ext = "encounters"))
})
