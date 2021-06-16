#' Aggregating opioid overdose data by year
#'
#' This function takes the clean opioid overdose ED visits or hospitalizations
#' data and aggregates it by year.
#'
#' @param clean_opioid_overdose_data A tbl_df of clean opioid overdose ED visits
#' or hospitalizations data.
#'
#' @return A tbl_df of aggregate opioid overdose ED visits or hospitalizations
#' data by year.
#' @export
#'
#' @examples
#' `aggregating_opioid_overdose_data_by_year(clean_opioid_overdose_ed_visits_data)`
#' `aggregating_opioid_overdose_data_by_year(clean_opioid_overdose_hospitalizations_data)`
aggregating_opioid_overdose_data_by_year <- function(clean_opioid_overdose_data) {
  clean_opioid_overdose_data %>%
    count(year) %>%
    complete(
      year = 2015:max(year),
      fill = list(n = 0)
    )
}
