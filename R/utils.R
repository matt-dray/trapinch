.check_internet <- function() {
  if (!curl::has_internet()) {
    stop("Please check your internet connection", call. = FALSE)
  }
}
