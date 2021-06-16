#' Plotting opioid overdoses by quarter
#'
#' This function takes the clean opioid overdoses ED visits or hospitalizations
#' data and the the clean population estimates and projections data and produces
#' a plot of the number or rate of ED visits or hospitalizations due to opioid
#' overdoses by quarter.
#'
#' @param clean_opioid_overdose_data A tbl_df of clean opioid overdose ED visits
#' or hospitalizations data.
#' @param clean_population_estimates_and_projections_data A tbl_df of clean
#' population estimates and projections data.
#' @param measure A symbol indicating whether the count or rate will be plotted.
#'
#' @return A ggplot of the number or rate of opioid overdose ED visits or
#' hospitalizations by quarter.
#' @export
#'
#' @examples
#' `plotting_opioid_overdoses_by_quarter(clean_opioid_overdose_ed_visits_data, clean_population_estimates_and_projections_data, n)`
#' `plotting_opioid_overdoses_by_quarter(clean_opioid_overdose_hospitalizations_data, clean_population_estimates_and_projections_data, rate)`
plotting_opioid_overdoses_by_quarter <- function(clean_opioid_overdose_data, clean_population_estimates_and_projections_data, measure) {
  # quoting our clean_opioid_overdose_data argument to use for labelling
  data_name <- rlang::as_label(enquo(clean_opioid_overdose_data))

  # quoting our measure argument to use for labelling
  measure_name <- rlang::as_label(enquo(measure))

  # creating a label for our data data to easily use in text
  data_label <- case_when(
    data_name == "clean_opioid_overdose_ed_visits_data" ~ "ED Visits",
    data_name == "clean_opioid_overdose_hospitalizations_data" ~ "Hospitalizations",
    TRUE ~ "Unknown"
  )

  # creating a label for our title that releis on the data label
  title_label <- case_when(
    data_label == "ED Visits" ~ "ED Visits due to Opioid Overdoses",
    data_label == "Hospitalizations" ~ "Hospitalizations due to Opioid Overdoses",
    TRUE ~ "Unknown"
  )

  # creating a label for our y-axis that relies on the measure name and data label
  y_label <- case_when(
    measure_name == "n" ~ paste0("Number of ", data_label, "\n"),
    measure_name == "rate" ~ paste0("Rate of ", data_label, " per 100,000", "\n"),
    TRUE ~ "Unknown"
  )

  joining_opioid_overdose_and_population_data_by_quarter(
    clean_opioid_overdose_data,
    clean_population_estimates_and_projections_data
  ) %>%
    filter(year == max(year)) %>%
    ggplot() +
    aes(
      x = quarter,
      y = {{ measure }},
      label = scales::comma({{ measure }}, scale = if_else(measure_name == "rate", 100000, 1), accuracy = if_else(measure_name == "rate", 0.01, 1))
    ) +
    geom_col(fill = rgb(
      red = 31,
      green = 73,
      blue = 125,
      maxColorValue = 255
    )) +
    geom_label(position = position_stack(vjust = 0.5)) +
    scale_x_continuous(breaks = 1:4) +
    scale_y_continuous(
      breaks = scales::pretty_breaks(),
      labels = scales::comma_format(scale = if_else(measure_name == "rate", 100000, 1))
    ) +
    labs(
      title = title_label,
      subtitle = "LGLDHU",
      x = "\nQuarter",
      y = y_label,
      caption = "IntelliHealth"
    ) +
    theme_minimal() +
    theme(
      plot.title.position = "plot",
      panel.grid.minor = element_blank(),
      panel.grid.major.x = element_blank()
    )
}
