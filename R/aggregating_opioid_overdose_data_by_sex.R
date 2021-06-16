#' Aggregating opioid overdose data by sex
#'
#' This function takes the clean opioid overdose ED visits or hospitalizations
#' data and aggregates it by sex.
#'
#' @param clean_opioid_overdose_data A tbl_df of clean opioid overdose ED visits
#' or hospitalizations data.
#'
#' @return A tbl_df of aggregate opioid overdose ED visits or hospitlizations
#' data by sex.
#' @export
#'
#' @examples
#' `aggregating_opioid_overdose_data_by_sex(clean_ed_visits_data)`
#' `aggregating_opioid_overdose_data_by_sex(clean_hospitalizations_data)`
aggregating_opioid_overdose_data_by_sex <- function(clean_opioid_overdose_data) {
  clean_opioid_overdose_data %>%
    count(year,
          sex) %>%
    complete(
      year = 2015:max(year),
      sex = c("Female", "Male"),
      fill = list(n = 0)
    )
}
