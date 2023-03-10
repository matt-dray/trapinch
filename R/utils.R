.is_internet_down <- function() {

  # See Maëlle's post:
  # https://blog.r-hub.io/2023/01/23/code-switch-escape-hatch-test/

  if (nzchar(Sys.getenv("TRAPINCH.NOINTERNET"))) {
    return(TRUE)
  }

  !curl::has_internet()

}

.check_args <- function(endpoint, resource, ext) {

  if (is.null(endpoint) || !is.character(endpoint) || is.na(endpoint)) {
    stop(
      "Argument 'endpoint' must be a valid string. ",
      "See names(trapinch::resource_lookups) for all available endpoints.",
      call. = FALSE)
  }

  if (
    !is.null(resource) &&
    (is.na(resource) ||
     (!(is.character(resource) | is.numeric(resource))) ||
     (is.character(resource) &
      endpoint %in% c("contest-effect", "evolution-chain", "machine", "characteristic")))
  ) {
    stop(
      "Argument 'resource' must be a valid numeric or character value ",
      "for the endpoint '", endpoint, "'. See ",
      "trapinch::resource_lookups[['", endpoint, "']] ",
      "for all endpoints and resources.",
      call. = FALSE
    )
  }

  if (
    !is.na(ext) &&
    (!is.null(ext) && !is.character(ext)) ||
    (!is.null(ext) && (endpoint == "type" & ext != "encounters"))
  ) {
    stop(
      "Argument 'ext' can only be NULL, or the string 'encounters' if used ",
      "with endpoint 'pokemon' and a valid resource. See ",
      "trapinch::resource_lookups('pokemon') for valid resources.",
      call. = FALSE
    )
  }

}

.check_endpoint_exists <- function(endpoint, resource) {

  endpoint_table <- trapinch::resource_lookups[[endpoint]]

  if (is.null(endpoint_table)) {

    stop(
      "The endpoint name you provided, '", endpoint,
      "', is not valid. See names(trapinch::resource_lookups) ",
      "for all available endpoints.",
      call. = FALSE
    )

  }

  if (
    !is.null("resource") &&
    (is.numeric(resource) && !resource %in% endpoint_table[["id"]]) ||
    (is.character(resource) && !resource %in% endpoint_table[["name"]])
  ) {

    type <- if(is.numeric(resource)) "id" else "name"

    stop(
      "The resource ", type, " you provided, '", resource,
      "', is not valid for the endpoint '", endpoint,
      "'. See trapinch::resource_lookups[['", endpoint, "']] ",
      "for all available endpoints and resources.",
      call. = FALSE
    )

  }


}


