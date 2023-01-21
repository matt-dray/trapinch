#' Clear the Cache
#'
#' Removes all cached returns from the PokéAPI, which are stored as RDS files
#' at the path resolved by \code{tools::R_user_dir("trapinch", "cache")}.
#'
#' @return Nothing. Deletes cached files.
#'
#' @export
#'
#' @examples \dontrun{clear_cache()}
clear_cache <- function() {

  cache_files <-
    list.files(tools::R_user_dir("trapinch", "cache"), full.names = TRUE)

  cache_count <- length(cache_files)

  if (cache_count == 0) {
    message("Cache is empty.")
  } else {
    invisible(lapply(cache_files, file.remove))
    message("Removed ", cache_count, " items from the cache.")
  }

}
