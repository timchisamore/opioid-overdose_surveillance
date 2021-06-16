#' Reading population estimates and projections data
#'
#' This function reads in the raw population estimates and projections data,
#' this is comprised of population estimates for for 2010 to 2017 and population
#' projections for 2018 to 2020.
#'
#' @param population_estimates_and_projections_path A character indicating the path to the population estimates and
#' projections data.
#'
#' @return A tbl_df of raw population estimates and projections data.
#' @export
#'
#' @examples
#' `reading_population_estimates_and_projections_data(here::here("data", "raw", "population_estimates_and_projections_union_data.xlsx"))`
reading_population_estimates_and_projections_data <-
  function(population_estimates_and_projections_path) {
    readxl::read_xlsx(
      path = population_estimates_and_projections_path,
      col_names = TRUE,
      col_types = c("text", "numeric", "text", "text", "numeric", "numeric")
    )
  }
