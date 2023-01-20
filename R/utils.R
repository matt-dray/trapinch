.check_internet <- function() {

  if (!curl::has_internet()) {
    stop("Please check your internet connection.", call. = FALSE)
  }

}

.check_args <- function(endpoint, resource, ext, verbose) {

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

  if (!is.logical(verbose)) {
    stop(
      "Argument 'verbose' must be logical, i.e. TRUE or FALSE.",
      call. = FALSE)
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
