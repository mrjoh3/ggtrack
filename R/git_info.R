


#' @title Get Local Git Information
#' @description Uses \link[base]{system} to determine if a git repository exists
#' and if so returns the upstream remote URL and current commit SHA
#'
#' @return character
#' @export
#'
#' @examples
#' \dontrun{
#'
#' get_git_info()
#'
#' }
get_git_info <- function() {

  g <- Sys.which('git')

  if (as.character(g) != '') {
    # we might have git but not be in a git repo
    in_git_repo <- invisible(system("git rev-parse --git-dir",
                                    ignore.stderr = TRUE,
                                    ignore.stdout = TRUE))

    if (in_git_repo == 0) {

      git_sha <- strtrim(system("git rev-parse HEAD", intern=TRUE), 8)
      git_url <- system("git config --get remote.origin.url", intern=TRUE)
      git_url <- gsub(':', '/', git_url) # change remote to web URL
      git_url <- gsub('git@', 'http://', git_url)
      git_url <- gsub('\\.git', '', git_url)

      git <- paste0(git_url, ' ', git_sha)

    } else {
      git <- ""
    }
  }

  return(git)

}
