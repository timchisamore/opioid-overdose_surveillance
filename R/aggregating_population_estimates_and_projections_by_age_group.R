#' Aggregating population estimates and projections by age group
#'
#' This function takes the clean opioid overdose population estimates and
#' projections data and aggregates it by age group.
#'
#' @param clean_population_estimates_and_projections_data A tbl_df of clean
#' population estimates and projections data.
#'
#' @return A tbl_df of aggregate population estimates and projections data by
#' age group.
#' @export
#'
#' @examples
#' `aggregating_population_estimates_and_projections_by_age_group(clean_population_estimates_and_projections_data)`
aggregating_population_estimates_and_projections_by_age_group <- function(clean_population_estimates_and_projections_data) {
  clean_population_estimates_and_projections_data %>%
    group_by(
      year,
      age_group
    ) %>%
    summarise(
      population = sum(population),
      .groups = "drop"
    ) %>%
    complete(
      year = 2015:max(year),
      age_group = c("<20", "20-44", "45-64", "65+"),
      fill = list(population = 0)
    )
}
