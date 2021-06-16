#' Aggregating population estimates and projections by year
#'
#' This function takes the clean population estimates and projections data and
#' aggregates it by year.
#'
#' @param clean_population_estimates_and_projections_data A tbl_df of clean
#' population estimates and projections data.
#'
#' @return A tbl_df of aggregate population estimates and projections data by
#' year.
#' @export
#'
#' @examples
#' `aggregating_population_estimates_and_projections_by_year(clean_population_estimates_and_projections_data)`
aggregating_population_estimates_and_projections_by_year <- function(clean_population_estimates_and_projections_data) {
  clean_population_estimates_and_projections_data %>%
    group_by(year) %>%
    summarise(
      population = sum(population),
      .groups = "drop"
    ) %>%
    complete(
      year = 2015:max(year),
      fill = list(population = 0)
    )
}
