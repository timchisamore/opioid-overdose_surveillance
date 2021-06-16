#' Joining opioid overdose and population data by sex
#'
#' This function takes clean opioid overdose ED visits or hospitalizations data
#' and clean population estimates and projections data and aggregates each by
#' sex using the appropriate functions. It then joins this aggregate data
#' by sex.
#'
#' @param clean_opioid_overdose_data A tbl_df of clean opioid overdose ED visits
#' or hospitalizations data.
#' @param clean_population_estimates_and_projections_data A tbl_df of clean
#' population estimates and projections data.
#'
#' @return A tbl_df of joined aggregate opioid overdoses ED visits or
#' hospitalizations data and population data.
#' @export
#'
#' @examples
#' `joining_opioid_overdose_and_population_data_by_sex(clean_ed_visits_data, clean_population_estimates_and_projections_data)`
#' `joining_opioid_overdose_and_population_data_by_sex(clean_hospitalizations_data, clean_population_estimates_and_projections_data)`
joining_opioid_overdose_and_population_data_by_sex <- function(clean_opioid_overdose_data, clean_population_estimates_and_projections_data) {
  aggregating_opioid_overdose_data_by_sex(clean_opioid_overdose_data) %>%
    left_join(aggregating_population_estimates_and_projections_by_sex(clean_population_estimates_and_projections_data),
      by = c("year", "sex")
    ) %>%
    mutate(rate = (n / population))
}
