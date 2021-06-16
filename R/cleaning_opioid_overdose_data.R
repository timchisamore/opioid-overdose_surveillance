#' Cleaning opioid overdose data
#'
#' This function cleans the ED visits and hospitalizations data read in
#' previously. Specifically, it uses the janitor package to clean field names.
#' As well, it uses the lubridate package to format the date field properly and
#' to create year, month, and day fields.
#'
#' @param raw_opioid_overdose_data A tbl_df of raw ED visits or
#' hospitalziations data due to opioid overdoses.
#'
#' @return A tbl_df of cleaned opioid overdose ED visits or hospitalizations
#' data.
#' @export
#'
#' @examples
#' `cleaning_opioid_overdose_data(raw_opioid_overdose_ed_visits_data)`
#' `cleaning_opioid_overdose_data(raw_opioid_overdose_hospitalizations_data)`
cleaning_opioid_overdose_data <-
  function(raw_opioid_overdose_data) {
    raw_opioid_overdose_data %>%
      janitor::clean_names() %>%
      mutate(
        age_group = creating_age_group(age),
        sex = creating_sex(sex),
        date = lubridate::as_date(date),
        year = lubridate::year(date),
        quarter = lubridate::quarter(date),
        month = lubridate::month(date),
        epiweek = lubridate::epiweek(date),
        day = lubridate::day(date),
        week_day = lubridate::wday(date),
        patient_phu = if_else(
          patient_phu == "(2243) LEEDS,GRENVILLE,LANARK",
          "(2243) LEEDS, GRENVILLE AND LANARK DISTRICT HEALTH UNIT",
          patient_phu
        )
      )
  }
