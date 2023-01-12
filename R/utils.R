.check_internet <- function() {
  if (!curl::has_internet()) {
    stop("Please check your internet connection", call. = FALSE)
  }
}

.check_args <- function(endpoint, resource, ext) {

  if (!is.character(endpoint)) {
    stop("Argument 'endpoint' must be a string.", call. = FALSE)
  }

  if (!is.character(resource)) {

    if (
      endpoint %in% c(
        "contest-effect", "evolution-chain", "machine", "characteristic"
      )
    ) {
      stop(
        "Argument 'resource' must be a numeric value.",
        call. = FALSE
      )
    } else {
      stop(
        "Argument 'resource' must be a string.",
        call. = FALSE
      )
    }
  }

  if (!is.null(ext) && !is.character(ext)) {
    stop(
      "Argument 'ext' can only be 'encounters' when 'endpoint' is 'pokemon'.",
      call. = FALSE
    )
  }

  if (!is.null(ext) && (endpoint == "type" & ext != "encounters")) {
    stop(
      "Argument 'ext' can only be 'encounters' when 'endpoint' is 'type'.",
      call. = FALSE
    )
  }

  if (!is.logical(verbose)) {
    stop("Argument 'verbose' must be logical, i.e. TRUE or FALSE.")
  }

}

.check_resource <- function(resource) {



}
