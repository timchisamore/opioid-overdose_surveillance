#' Aggregating population estimates and projections by sex
#'
#' This function takes the clean population estimates and projections data and
#' aggregates it by sex.
#'
#' @param clean_population_estimates_and_projections_data A tbl_df of clean
#' population estimates and projections data.
#'
#' @return A tbl_df of aggregate population estimates and projections data by
#' sex.
#' @export
#'
#' @examples
#' `aggregating_population_estimates_and_projections_by_sex(clean_population_estimates_and_projections_data)`
aggregating_population_estimates_and_projections_by_sex <- function(clean_population_estimates_and_projections_data) {
  clean_population_estimates_and_projections_data %>%
    group_by(year,
             sex) %>%
    summarise(
      population = sum(population),
      .groups = "drop"
    ) %>%
    complete(
      year = 2015:max(year),
      sex = c("Female", "Male"),
      fill = list(n = 0)
    )
}
