#' Reading opioid overdose hospitalizations data
#'
#' This function reads in the Discharge Abstract Database (DAD) opioid overdose
#' hospitalizations data. It is comprised of T40 codes from the International
#' Classification of Diseases 10 (ICD-10).
#'
#' @param opioid_overdose_hospitalizations_path A character indicating the path
#' to the opioid overdose hospitalizations data.
#'
#' @return A tbl_df of data of hospitalziations due to opioid overdoses.
#' @export
#'
#' @examples
#' `reading_opioid_overdose_hospitalizations_data(here::here("data", "raw", "opioid_overdose_hospitalizations_data.xlsx"))`
reading_opioid_overdose_hospitalizations_data <- function(opioid_overdose_hospitalizations_path) {
  readxl::read_xlsx(
    path = opioid_overdose_hospitalizations_path,
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
      "text",
      "text"
    )
  )
}
