#' Aggregating opioid overdose data by quarter
#'
#' This function takes the clean opioid overdose ED visits or hospitalizations
#' data and aggregates it by year and quarter.
#'
#' @param clean_opioid_overdose_data A tbl_df of clean opioid overdose ED visits
#' or hospitalizations data.
#'
#' @return A tbl_df of aggregate opioid overdose ED visits or hospitalizations
#' data by year and quarter.
#' @export
#'
#' @examples
#' `aggregating_opioid_overdose_data_by_quarter(clean_opioid_overdose_ed_visits_data)`
#' `aggregating_opioid_overdose_data_by_quarter(clean_opioid_overdose_hospitalizations_data)`
aggregating_opioid_overdose_data_by_quarter <- function(clean_opioid_overdose_data) {
  clean_opioid_overdose_data %>%
    count(year,
          quarter) %>%
    complete(
      year = 2015:max(year),
      quarter = 1:4,
      fill = list(n = 0)
    )
}
