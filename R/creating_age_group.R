#' Creating age group
#'
#' This function takes numeric ages and creates the age group corresponding to
#' it.
#'
#' @param age A numeric vector of ages.
#'
#' @return A character vector representing the corresponding age groups.
#' @export
#'
#' @examples
#' `creating_age_group(c(1, 5, 50))`
creating_age_group <- function(age) {
  santoku::chop(
    x = age,
    breaks = c(0, 20, 45, 65, Inf),
    labels = c("<20", "20-44", "45-64", "65+")
  )
}
