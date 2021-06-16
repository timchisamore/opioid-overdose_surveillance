#' Creating sex
#'
#' This function takes sex as a character and creates sex as a factor.
#'
#' @param sex A character vector of sexes.
#'
#' @return A factor of sexes.
#' @export
#'
#' @examples
#' `creating_sex(sex)`
creating_sex <- function(sex) {
  sex <- fct_recode(sex, Female = "FEMALE", Male = "MALE")
}
