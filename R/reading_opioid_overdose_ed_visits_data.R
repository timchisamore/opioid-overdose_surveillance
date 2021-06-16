#' Reading opioid overdose ED visits data
#'
#' This function reads in the National Ambulatory Care Reporting System (NACRS)
#' opioid overdose emergency department (ED) visits data. It is comprised of T40
#' codes from the International Classification of Diseases 10 (ICD-10).
#'
#' @param opioid_overdose_ed_visits_path A character indicating the path to the
#' opioid overdose ED visits data.
#'
#' @return A tbl_df of data of ED visits due to opioid overdoses.
#' @export
#'
#' @examples
#' `reading_opioid_overdose_ed_visits_data(here::here("data", "raw", "opioid_overdose_ed_visits_data.xlsx"))`
reading_opioid_overdose_ed_visits_data <- function(opioid_overdose_ed_visits_path) {
  readxl::read_xlsx(
    path = opioid_overdose_ed_visits_path,
    col_names = TRUE,
    col_types = c(
      "text",
      "text",
      "text",
      "date",
      "text",
      "numeric",
      "text",
      "text",
      "text",
      "text",
      "text"
    )
  )
}
