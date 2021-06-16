library(targets)
library(tarchetypes)
purrr::walk(.x = fs::dir_ls(path = here::here("R")), .f = source)
tar_option_set(packages = c("tidyverse", "conflicted"))
list(
  tar_file(name = "opioid_overdose_ed_visits_path", command = here::here("data", "raw", "opioid_overdose_ed_visits_data.xlsx")),
  tar_file(name = "opioid_overdose_hospitalizations_path", command = here::here("data", "raw", "opioid_overdose_hospitalizations_data.xlsx")),
  tar_file(name = "population_estimates_and_projections_path", command = here::here("data", "raw", "population_estimates_and_projections_data.xlsx")),
  tar_target(name = "raw_opioid_overdose_ed_visits_data", command = reading_opioid_overdose_ed_visits_data(opioid_overdose_ed_visits_path)),
  tar_target(name = "raw_opioid_overdose_hospitalizations_data", command = reading_opioid_overdose_hospitalizations_data(opioid_overdose_hospitalizations_path)),
  tar_target(name = "raw_population_estimates_and_projections_data", command = reading_population_estimates_and_projections_data(population_estimates_and_projections_path)),
  tar_target(name = "clean_opioid_overdose_ed_visits_data", command = cleaning_opioid_overdose_data(raw_opioid_overdose_ed_visits_data)),
  tar_target(name = "clean_opioid_overdose_hospitalizations_data", command = cleaning_opioid_overdose_data(raw_opioid_overdose_hospitalizations_data)),
  tar_target(name = "clean_population_estimates_and_projections_data", command = cleaning_population_estimates_and_projections_data(raw_population_estimates_and_projections_data)),
  tar_target(name = "plot_number_of_opioid_overdose_ed_visits_by_year", command = plotting_opioid_overdoses_by_year(clean_opioid_overdose_ed_visits_data, clean_population_estimates_and_projections_data, n)),
  tar_target(name = "plot_rate_of_opioid_overdose_ed_visits_by_year", command = plotting_opioid_overdoses_by_year(clean_opioid_overdose_ed_visits_data, clean_population_estimates_and_projections_data, rate)),
  tar_target(name = "plot_number_of_opioid_overdose_hospitalizations_by_year", command = plotting_opioid_overdoses_by_year(clean_opioid_overdose_hospitalizations_data, clean_population_estimates_and_projections_data, n)),
  tar_target(name = "plot_rate_of_opioid_overdose_hospitalizations_by_year", command = plotting_opioid_overdoses_by_year(clean_opioid_overdose_hospitalizations_data, clean_population_estimates_and_projections_data, rate)),
  tar_target(name = "plot_number_of_opioid_overdose_ed_visits_by_quarter", command = plotting_opioid_overdoses_by_quarter(clean_opioid_overdose_ed_visits_data, clean_population_estimates_and_projections_data, n)),
  tar_target(name = "plot_rate_of_opioid_overdose_ed_visits_by_quarter", command = plotting_opioid_overdoses_by_quarter(clean_opioid_overdose_ed_visits_data, clean_population_estimates_and_projections_data, rate)),
  tar_target(name = "plot_number_of_opioid_overdose_hospitalizations_by_quarter", command = plotting_opioid_overdoses_by_quarter(clean_opioid_overdose_hospitalizations_data, clean_population_estimates_and_projections_data, n)),
  tar_target(name = "plot_rate_of_opioid_overdose_hospitalizations_by_quarter", command = plotting_opioid_overdoses_by_quarter(clean_opioid_overdose_hospitalizations_data, clean_population_estimates_and_projections_data, rate)),
  tar_target(name = "plot_number_of_opioid_overdose_ed_visits_by_age_group", command = plotting_opioid_overdoses_by_age_group(clean_opioid_overdose_ed_visits_data, clean_population_estimates_and_projections_data, n)),
  tar_target(name = "plot_rate_of_opioid_overdose_ed_visits_by_age_group", command = plotting_opioid_overdoses_by_age_group(clean_opioid_overdose_ed_visits_data, clean_population_estimates_and_projections_data, rate)),
  tar_target(name = "plot_number_of_opioid_overdose_hospitalizations_by_age_group", command = plotting_opioid_overdoses_by_age_group(clean_opioid_overdose_hospitalizations_data, clean_population_estimates_and_projections_data, n)),
  tar_target(name = "plot_rate_of_opioid_overdose_hospitalizations_by_age_group", command = plotting_opioid_overdoses_by_age_group(clean_opioid_overdose_hospitalizations_data, clean_population_estimates_and_projections_data, rate)),
  tar_target(name = "plot_number_of_opioid_overdose_ed_visits_by_sex", command = plotting_opioid_overdoses_by_sex(clean_opioid_overdose_ed_visits_data, clean_population_estimates_and_projections_data, n)),
  tar_target(name = "plot_rate_of_opioid_overdose_ed_visits_by_sex", command = plotting_opioid_overdoses_by_sex(clean_opioid_overdose_ed_visits_data, clean_population_estimates_and_projections_data, rate)),
  tar_target(name = "plot_number_of_opioid_overdose_hospitalizations_by_sex", command = plotting_opioid_overdoses_by_sex(clean_opioid_overdose_hospitalizations_data, clean_population_estimates_and_projections_data, n)),
  tar_target(name = "plot_rate_of_opioid_overdose_hospitalizations_by_sex", command = plotting_opioid_overdoses_by_sex(clean_opioid_overdose_hospitalizations_data, clean_population_estimates_and_projections_data, rate)),
  tar_render(name = "surveillance_report", path = here::here("documents", "opioid-overdose_surveillance.Rmd"))
)
