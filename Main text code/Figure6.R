################################################################################################
## Title: The viability of co-firing biomass waste to mitigate coal plant emissions in Indonesia
## R script for creating Figure 6  
## AUTHOR:            Claire Squire
## Date: 2024 Jan
################################################################################################




library(ggplot2)

data <- data.frame(
  x_values = c(2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030),
  y_values1 = c(233.35, 247.073, 270.1, 277.722656, 324.952, 345.885, 369.236081, 369.375530,  369.375530,  369.491737,  369.491737),
  y_values2 = c(233.35, 247.073, 270.1, 277.722656, 313.791, 333.739, 355.094, 355.209441, 355.209441, 355.304, 355.304840),
  y_values3 = c(233.35, 247.073, 270.1, 277.722656, 292.080, 310.543, 328.334, 328.441, 328.441, 328.530, 328.530),
  y_values4 = c(233.35, 247.073, 270.1, 277.722656, 277.404, 294.916, 311.438, 311.484, 311.484750, 311.523627, 311.523627),
  y_values5 = c(233.35, 247.073, 270.1, 277.722656, 192.933, 206.749, 216.981, 216.981, 216.981, 216.981, 216.981)
)

# Plotting
chart <- ggplot(data, aes(x = x_values)) +
  
  geom_line(aes(y = y_values2, color = "Low"), size = 1.5) +
  geom_line(aes(y = y_values3, color = "Equalized"), size = 1.5) +
  geom_line(aes(y = y_values4, color = "Mid"), size = 1.5) +
  geom_line(aes(y = y_values5, color = "High"), size = 1.5) +
  geom_line(aes(y = y_values1, color = "BAU"), size = 1.5) +
  labs(
    title = "EMISSIONS REDUCTIONS BY SCENARIO",
    x = NULL,
    y = "MILLION TONS OF" ~ CO[2],  
    color = "SCENARIOS"
  ) +
  scale_color_manual(
    values = c(
      "BAU" = "grey",
      "Low" = "lightcyan3",
      "Equalized" = "darkslategray3",
      "Mid" = "darkslategray4",
      "High" = "darkslategrey"
    ),
    breaks = c("BAU", "Low", "Equalized", "Mid", "High"),
    labels = c("BAU", "Low", "Equalized", "Mid", "High")
  ) +
  scale_y_continuous(labels = scales::comma, limits = c(0, 400)) +
  scale_x_continuous(breaks = seq(2020, 2030, 1), labels = seq(2020, 2030, 1)) +
  theme_bw() +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 18, colour = "black"),
    axis.text.y = element_text(size = 14, colour = "black", face = "bold"),
    axis.text = element_text(family = "Franklin Gothic Medium", size = 10, colour = "black"),
    axis.title.y = element_text(size = 14, face = "bold", margin = margin(r = 20)), 
    axis.text.x = element_text(size = 14, face = "bold"), 
    panel.border = element_rect(colour = "black"),
    legend.position = "right",
    legend.title = element_text(size = 14, face = "bold"), 
    legend.text = element_text(size = 12, face = "bold"))

print(chart)













