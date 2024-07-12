################################################################################################
## Title: The viability of co-firing biomass waste to mitigate coal plant emissions in Indonesia
## R script for creating Supplementary Figure 1 
## AUTHOR:            Claire Squire
## Date: 2023 September
################################################################################################


library(ggplot2)

data <- data.frame(
  x_values = c(0, 5, 10, 15, 20, 25, 30, 40, 50, 70, 75, 100),
  y_values = c(0, -.5, -.8, -.9, -1, -1.2, -1.34, -1.55, -1.88, -4.05, -4.99, -10))

chart <- ggplot(data, aes(x = x_values, y = y_values)) +
  geom_line(size = 2, color = "goldenrod1") +
  labs(title = "Efficiency Losses under Co-firing", x = "Co-firing Ratio", y = "Efficiency Loss (%)") +
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14, colour = "black"),
    axis.text = element_text(family = "Franklin Gothic Medium", size = 10, colour = "black"),
    axis.title = element_text(size = 10, face = "bold", colour = "black"),
    legend.text = element_text(size = 9),
    panel.border = element_rect(colour = "black"))