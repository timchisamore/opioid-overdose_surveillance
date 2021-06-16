#' Cleaning population estimates and projections data
#'
#' This function takes the raw population estimates and projections data and
#' uses the janitor package to clean field names. As well, we use a function to
#' create age groups of interest.
#'
#' @param raw_population_estimates_and_projections_data A tbl_df of raw
#' population estimates and projections data.
#'
#' @return A tbl_df of clean population estimates and projections data.
#' @export
#'
#' @examples
#' `cleaning_population_estimates_and_projections_data(raw_population_estimates_and_projections_data)`
cleaning_population_estimates_and_projections_data <- function(raw_population_estimates_and_projections_data) {
  raw_population_estimates_and_projections_data %>%
    janitor::clean_names() %>%
    mutate(
      age_group = creating_age_group(age),
      sex = creating_sex(sex)
    )
}
