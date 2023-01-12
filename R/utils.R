.check_internet <- function() {

  if (!curl::has_internet()) {
    stop("Please check your internet connection", call. = FALSE)
  }

}

.check_args <- function(endpoint, resource, ext, verbose) {

  if (!is.character(endpoint)) {
    stop(
      "Argument 'endpoint' must be a string. ",
      "Run names(resource_lookups) for available endpoints.",
      call. = FALSE)
  }

  if (!(is.character(resource) | is.numeric(resource))) {
    stop(
      "Argument 'resource' must be a valid numeric or character value for the endpoint '",
      endpoint,
      "'. See resource_lookups[['",
      endpoint,
      "']] for details.",
      call. = FALSE
    )
  }

  if (
    is.character(resource) &
    endpoint %in% c("contest-effect", "evolution-chain", "machine", "characteristic")
  ) {
    stop(
      "Argument 'resource' must be a valid numeric value for the endpoint '",
      endpoint,
      "'. See resource_lookups[['",
      endpoint,
      "']] for details.",
      call. = FALSE
    )
  }

  if (!is.null(ext) && !is.character(ext)) {
    stop(
      "Argument 'ext' can only be used with endpoint 'pokemon' ",
      "and it must be set to 'encounter'.",
      call. = FALSE
    )
  }

  if (!is.null(ext) && (endpoint == "type" & ext != "encounters")) {
    stop(
      "Argument 'ext' can only be used with endpoint 'pokemon' ",
      "and it must be set to 'encounter'.",
      call. = FALSE
    )
  }

  if (!is.logical(verbose)) {
    stop("Argument 'verbose' must be logical, i.e. TRUE or FALSE.")
  }

}

.check_resource_exists <- function(endpoint, resource) {

  endpoint_table <- trapinch::resource_lookups[[endpoint]]

  if (is.numeric(resource)) {

    if (!resource %in% endpoint_table[["id"]]) {
      stop(
        "The resource ID you provided, '",
        resource,
        "' is not valid for the endpoint '",
        endpoint,
        "'. See resource_lookups[['",
        endpoint,
        "']] for details.",
        call. = FALSE
      )
    }

  }

  if (is.character(resource)) {

    if (!resource %in% endpoint_table[["name"]]) {
      stop(
        "The resource name you provided, '",
        resource,
        "' is not valid for the endpoint '",
        endpoint,
        "'. See resource_lookups[['",
        endpoint,
        "']] for details.",
        call. = FALSE
      )
    }
  }

}

