################################################################################################
## Title: The viability of co-firing biomass waste to mitigate coal plant emissions in Indonesia
## R script for creating Supplementary Figure 2 
## AUTHOR:            Claire Squire
## Date: 2024 July
################################################################################################


library(ggplot2)
library(dplyr)

data <- data.frame(
  Scenario = factor(rep(c("Low", "Mid", "High"), each = 8), levels = c("High", "Mid", "Low")),
  Demand = c(126, 160, 172, 196, 197, 197, 197, 197, 
             431, 538, 576, 650, 651, 651, 652, 652, 
             1172, 1391, 1468, 1605, 1607, 1607, 1609, 1609),
  Min = c(126, 126, 126, 126, 126, 126, 126, 126, 
          431, 431, 431, 431, 431, 431, 431, 431, 
          1172, 1172, 1172, 1172, 1172, 1172, 1172, 1172),
  Max = c(126, 168, 192, 220, 224, 224, 224, 239, 
          431, 561, 636, 723, 735, 735, 736, 782, 
          1172, 1430, 1569, 1729, 1750, 1750, 1751, 1829),
  Year = rep(2023:2030, 3),
  Supply_Min = c(424, 423, 423, 423, 423, 423, 423, 423, 
                 423, 423, 423, 423, 423, 423, 423, 423, 
                 423, 423, 423, 423, 423, 423, 423, 423),
  Supply_Max = c(558, 558, 558, 558, 558, 558, 558, 558, 
                 558, 558, 558, 558, 558, 558, 558, 558, 
                 558, 558, 558, 558, 558, 558, 558, 558),
  Supply = c(504, 504, 504, 504, 504, 504, 504, 504, 
             504, 504, 504, 504, 504, 504, 504, 504, 
             504, 504, 504, 504, 504, 504, 504, 504))

ggplot(data, aes(x = Year)) +
  geom_line(aes(y = Demand, color = Scenario, group = Scenario), size = 1) +
  geom_ribbon(aes(ymin = Min, ymax = Max, fill = Scenario), alpha = 0.2) +
  geom_line(aes(y = Supply, linetype = "Supply", color = "Supply"), size = 1) +
  geom_ribbon(aes(ymin = Supply_Min, ymax = Supply_Max, fill = "Supply"), alpha = 0.2) +
  labs(title = "Biomass Supply and Demand Sensitivity",
       x = NULL,
       y = "Billion MJ",
       color = "Demand Scenario", 
       fill = "Scenario",
       linetype = "Supply") +
  scale_fill_manual(name = "Scenario", 
                    values = c("Low" = "lightcyan3", "Mid" = "darkslategray4", "High" = "darkslategrey", "Supply" = "orange2")) +
  scale_color_manual(name = "Scenario", 
                     values = c("Supply" = "orange2", "Low" = "lightcyan3", "Mid" = "darkslategray4", "High" = "darkslategrey")) +
  scale_linetype_manual(name = "Supply", 
                        values = c("Supply" = "solid")) +
  guides(color = guide_legend(override.aes = list(fill = NA)),
         fill = guide_legend(override.aes = list(color = c("darkslategrey", "darkslategray4", "lightcyan3", "orange2")))) +
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

