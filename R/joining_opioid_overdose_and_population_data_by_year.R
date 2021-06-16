#' Joining opioid overdose and population data by year
#'
#' This function takes clean opioid overdose ED visits or hospitalizations data
#' and clean population estimates and projections data and aggregates each by
#' year using the appropriate functions. It then joins this aggregate data by
#' year.
#'
#' @param clean_opioid_overdose_data A tbl_df of clean opioid overdose ED visits
#' or hospitalizations data.
#' @param clean_population_estimates_and_projections_data A tbl_df of clean
#' population estimates and projections data.
#'
#' @return A tbl_df of joined aggregate opioid overdose ED visits or
#' hospitalizations data and aggregate population estimates and projections
#' data.
#' @export
#'
#' @examples
#' `joining_opioid_overdose_and_population_data_by_year(clean_ed_visits_data, clean_population_estimates_and_projections_data)`
#' `joining_opioid_overdose_and_population_data_by_year(clean_hospitalizations_data, clean_population_estimates_and_projections_data)`
joining_opioid_overdose_and_population_data_by_year <- function(clean_opioid_overdose_data, clean_population_estimates_and_projections_data) {
  aggregating_opioid_overdose_data_by_year(clean_opioid_overdose_data) %>%
    left_join(aggregating_population_estimates_and_projections_by_year(clean_population_estimates_and_projections_data),
      by = "year"
    ) %>%
    mutate(rate = (n / population))
}
