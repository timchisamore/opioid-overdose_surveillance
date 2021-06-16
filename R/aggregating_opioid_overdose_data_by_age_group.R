#' Aggregating opioid overdose data by age group
#'
#' This function takes the clean opioid overdose ED visits and hospitalizations
#' data and aggregates it by age group.
#'
#' @param clean_opioid_overdose_data A tbl_df of clean opioid overdose ED visits
#' or hospitalizations data.
#'
#' @return A tbl_df of aggregate opioid overdsoe ED visits or hospitalizations
#' data by age group.
#' @export
#'
#' @examples
#' `aggregating_opioid_overdose_data_by_year_and_age_group(clean_opioid_overdose_ed_visits_data)`
#' `aggregating_opioid_overdose_data_by_year_and_age_group(clean_opioid_overdose_hospitalizations_data)`
aggregating_opioid_overdose_data_by_age_group <- function(clean_opioid_overdose_data) {
  clean_opioid_overdose_data %>%
    count(year,
          age_group) %>%
    complete(
      year = 2015:max(year),
      age_group = c("<20", "20-44", "45-64", "65+"),
      fill = list(n = 0)
    )
}
