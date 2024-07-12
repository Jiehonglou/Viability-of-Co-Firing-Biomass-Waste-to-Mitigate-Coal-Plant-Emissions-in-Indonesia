################################################################################################
## Title: The viability of co-firing biomass waste to mitigate coal plant emissions in Indonesia
## R script for creating Figure 5  
## AUTHOR:            Claire Squire
## Date: 2024 Jan
################################################################################################


###Figure 5A, National Map

library(ggplot2)
library(readr)
library(tidyr)
library(dplyr)

# Read data
df <- fread("Figure5a.csv")

# Reshape data into tidy format
df_tidy <- pivot_longer(df, 
                        cols = starts_with(c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")),
                        names_to = "Month",
                        values_to = "Million_MJ",
                        names_pattern = "(.*)")

# Convert Month to factor with desired order
df_tidy <- df_tidy %>%
  mutate(Month = factor(Month, levels = month.abb))

# Define the custom theme_panel
theme_panel <-   theme(plot.title = element_text(hjust = 0.5, face = "bold", size =14),
                       line = element_line(colour = "black"),
                       text = element_text(family = "Franklin Gothic Medium", colour = "black", size = 10),
                       axis.text.y = element_text(size = 10, colour = "black"),
                       axis.text.x = element_text(size = 10, colour = "black"),
                       axis.title.y = element_text(size = 10, face = "bold"),
                       axis.title.x = element_text(size = 10, face = "bold"),
                       
                       panel.border = element_rect(colour = "black"))

# Plot stacked bar chart and apply the custom theme_panel
ggplot(data = df_tidy, aes(x = Month, y = Million_MJ, fill = Feedstock)) +
  geom_col(position = "stack") +
  scale_fill_manual(values = c(
    "Bagasse" = "#88CCEE",
    "Rubber" = "#AA4499",
    "Rice" = "#DDCC77",
    "Wood" = "#117733",
    "Oil Palm" = "#661100",
    "MSW" = "#888888"
  )) +
  theme_bw() +
  labs(y = "MILLION MJ", 
       x = NULL, 
       title = "A. NATIONAL FEEDSTOCK AVAILABILITY", 
       fill = "Feedstock") +  
  theme(plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
        axis.text.x = element_text(size = 14, colour = "black", face = "bold", angle = 0, hjust = .5, vjust = 1),
        axis.text.y = element_text(size = 14, colour = "black", face = "bold"),
        legend.text = element_text(size = 14, face = "bold"),
        legend.title = element_text(size = 14, face = "bold"),
        axis.title.x = element_text(size = 14, colour = "black", face = "bold"), 
        axis.title.y = element_text(size = 16, colour = "black", face = "bold")) +
  scale_y_continuous(labels = scales::comma) +
  scale_x_discrete() +  
  guides(fill = guide_legend(title = "FEEDSTOCK")) +
  theme(axis.title.y = element_text(margin = margin(r = 20)))


###Figure 5B, Sumatra

df <- fread("Figure5b.csv")

df_tidy <- pivot_longer(df, 
                        cols = starts_with(c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")),
                        names_to = "Month",
                        values_to = "Million_MJ",
                        names_pattern = "(.*)")

df_tidy <- df_tidy %>%
  mutate(Month = factor(Month, levels = month.abb))

theme_panel <-   theme(plot.title = element_text(hjust = 0.5, face = "bold", size =14),
                       line = element_line(colour = "black"),
                       text = element_text(family = "Franklin Gothic Medium", colour = "black", size = 10),
                       axis.text.y = element_text(size = 10, colour = "black"),
                       axis.text.x = element_text(size = 10, colour = "black"),
                       axis.title.y = element_text(size = 10, face = "bold"),
                       axis.title.x = element_text(size = 10, face = "bold"),
                       legend.text = element_text(size = 9),
                       panel.border = element_rect(colour = "black"))

ggplot(data = df_tidy, aes(x = Month, y = Million_MJ, fill = Feedstock)) +
  geom_col(position = "stack") +
  scale_fill_manual(values = c(
    "Bagasse" = "#88CCEE",
    "Rubber" = "#AA4499",
    "Rice" = "#DDCC77",
    "Wood" = "#117733",
    "Oil Palm" = "#661100",
    "MSW" = "#888888"
  )) +
  theme_bw() +
  theme(legend.position = "right") +
  labs(y = NULL, x = NULL, title = "B. SUMATRA") +
  theme(plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        axis.text.y = element_text(size = 14, colour = "black", face = "bold"),
        legend.text = element_text(size = 10)) +
  scale_y_continuous(labels = scales::comma) +
  theme(legend.position = "none")+
  scale_x_discrete(breaks = NULL)


###Figure 5C, Java

df <- fread("Figure5c.csv")

df_tidy <- pivot_longer(df, 
                        cols = starts_with(c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")),
                        names_to = "Month",
                        values_to = "Million_MJ",
                        names_pattern = "(.*)")

df_tidy <- df_tidy %>%
  mutate(Month = factor(Month, levels = month.abb))

theme_panel <-   theme(plot.title = element_text(hjust = 0.5, face = "bold", size =14),
                       line = element_line(colour = "black"),
                       text = element_text(family = "Franklin Gothic Medium", colour = "black", size = 10),
                       axis.text.y = element_text(size = 10, colour = "black"),
                       axis.text.x = element_text(size = 10, colour = "black"),
                       axis.title.y = element_text(size = 10, face = "bold"),
                       axis.title.x = element_text(size = 10, face = "bold"),
                       legend.text = element_text(size = 9),
                       panel.border = element_rect(colour = "black"))

ggplot(data = df_tidy, aes(x = Month, y = Million_MJ, fill = Feedstock)) +
  geom_col(position = "stack") +
  scale_fill_manual(values = c(
    "Bagasse" = "#88CCEE",
    "Rubber" = "#AA4499",
    "Rice" = "#DDCC77",
    "Wood" = "#117733",
    "Oil Palm" = "#661100",
    "MSW" = "#888888"
  )) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = NULL, x = NULL, title = "C. JAVA") +
  theme(plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        axis.text.y = element_text(size = 14, colour = "black", face = "bold"),
        legend.text = element_text(size = 10)) +
  scale_y_continuous(labels = scales::comma)+
  theme(legend.position = "none")+
  scale_x_discrete(breaks = NULL)


###Figure 5D, Bali & Nusa Tenggara

df <- fread("Figure5d.csv")

df_tidy <- pivot_longer(df, 
                        cols = starts_with(c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")),
                        names_to = "Month",
                        values_to = "Million_MJ",
                        names_pattern = "(.*)")

df_tidy <- df_tidy %>%
  mutate(Month = factor(Month, levels = month.abb))

theme_panel <-   theme(plot.title = element_text(hjust = 0.5, face = "bold", size =14),
                       line = element_line(colour = "black"),
                       text = element_text(family = "Franklin Gothic Medium", colour = "black", size = 10),
                       axis.text.y = element_text(size = 10, colour = "black"),
                       axis.text.x = element_text(size = 10, colour = "black"),
                       axis.title.y = element_text(size = 10, face = "bold"),
                       axis.title.x = element_text(size = 10, face = "bold"),
                       
                       panel.border = element_rect(colour = "black"))

ggplot(data = df_tidy, aes(x = Month, y = Million_MJ, fill = Feedstock)) +
  geom_col(position = "stack") +
  scale_fill_manual(values = c(
    "Bagasse" = "#88CCEE",
    "Rubber" = "#AA4499",
    "Rice" = "#DDCC77",
    "Wood" = "#117733",
    "Oil Palm" = "#661100",
    "MSW" = "#888888"
  )) +
  theme_bw() +
  labs(y = NULL, x = NULL, title = "D. BALI & NUSA TENGGARA") +
  theme(plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
        axis.text.x = element_text(size = 14, colour = "black", face = "bold", angle = 0, hjust = .5, vjust = 1),
        axis.text.y = element_text(size = 14, colour = "black", face = "bold"),
        legend.text = element_text(size = 10),
        axis.title.x = element_text(size = 10, face = "bold")) + # Add this line
  scale_y_continuous(labels = scales::comma) +
  scale_x_discrete() +  # Remove breaks = NULL to show x-axis labels
  guides(fill = FALSE) 



###Figure 5E, Sulawesi

df <- fread("Figure5e.csv")

df_tidy <- pivot_longer(df, 
                        cols = starts_with(c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")),
                        names_to = "Month",
                        values_to = "Million_MJ",
                        names_pattern = "(.*)")

df_tidy <- df_tidy %>%
  mutate(Month = factor(Month, levels = month.abb))

theme_panel <-   theme(plot.title = element_text(hjust = 0.5, face = "bold", size =14),
                       line = element_line(colour = "black"),
                       text = element_text(family = "Franklin Gothic Medium", colour = "black", size = 10),
                       axis.text.y = element_text(size = 10, colour = "black"),
                       axis.text.x = element_text(size = 10, colour = "black"),
                       axis.title.y = element_text(size = 10, face = "bold"),
                       axis.title.x = element_text(size = 10, face = "bold"),
                       legend.text = element_text(size = 9),
                       panel.border = element_rect(colour = "black"))

ggplot(data = df_tidy, aes(x = Month, y = Million_MJ, fill = Feedstock)) +
  geom_col(position = "stack") +
  scale_fill_manual(values = c(
    "Bagasse" = "#88CCEE",
    "Rubber" = "#AA4499",
    "Rice" = "#DDCC77",
    "Wood" = "#117733",
    "Oil Palm" = "#661100",
    "MSW" = "#888888"
  )) +
  theme_bw() +
  theme(legend.position = "bottom") +
  labs(y = NULL, x = NULL, title = "E. SULAWESI") +
  theme(plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        axis.text.y = element_text(size = 14, colour = "black", face = "bold"),
        legend.text = element_text(size = 10)) +
  scale_y_continuous(labels = scales::comma)+
  theme(legend.position = "none")+
  scale_x_discrete(breaks = NULL)


###Figure 5F, Kalimantan

df <- fread("Figure5f.csv")

df_tidy <- pivot_longer(df, 
                        cols = starts_with(c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")),
                        names_to = "Month",
                        values_to = "Million_MJ",
                        names_pattern = "(.*)")

df_tidy <- df_tidy %>%
  mutate(Month = factor(Month, levels = month.abb))

theme_panel <-   theme(plot.title = element_text(hjust = 0.5, face = "bold", size =14),
                       line = element_line(colour = "black"),
                       text = element_text(family = "Franklin Gothic Medium", colour = "black", size = 10),
                       axis.text.y = element_text(size = 10, colour = "black"),
                       axis.text.x = element_text(size = 10, colour = "black"),
                       axis.title.y = element_text(size = 10, face = "bold"),
                       axis.title.x = element_text(size = 10, face = "bold"),
                       legend.text = element_text(size = 9),
                       panel.border = element_rect(colour = "black"))

ggplot(data = df_tidy, aes(x = Month, y = Million_MJ, fill = Feedstock)) +
  geom_col(position = "stack") +
  scale_fill_manual(values = c(
    "Bagasse" = "#88CCEE",
    "Rubber" = "#AA4499",
    "Rice" = "#DDCC77",
    "Wood" = "#117733",
    "Oil Palm" = "#661100",
    "MSW" = "#888888"
  )) +
  theme_bw() +
  theme(legend.position = "right") +
  labs(y = NULL, x = NULL, title = "F. KALIMANTAN") +
  theme(plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        axis.text.y = element_text(size = 14, colour = "black", face = "bold"),
        legend.text = element_text(size = 10)) +
  scale_y_continuous(labels = scales::comma)+
  theme(legend.position = "none")+
  scale_x_discrete(breaks = NULL)


###Figure 5G, Maluku & Papua

df <- fread("Figure5g.csv")

df_tidy <- pivot_longer(df, 
                        cols = starts_with(c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")),
                        names_to = "Month",
                        values_to = "Million_MJ",
                        names_pattern = "(.*)")

df_tidy <- df_tidy %>%
  mutate(Month = factor(Month, levels = month.abb))

theme_panel <-   theme(plot.title = element_text(hjust = 0.5, face = "bold", size =14),
                       line = element_line(colour = "black"),
                       text = element_text(family = "Franklin Gothic Medium", colour = "black", size = 10),
                       axis.text.y = element_text(size = 10, colour = "black"),
                       axis.text.x = element_text(size = 10, colour = "black"),
                       axis.title.y = element_text(size = 10, face = "bold"),
                       axis.title.x = element_text(size = 10, face = "bold"),
                       legend.text = element_text(size = 9),
                       panel.border = element_rect(colour = "black"))

ggplot(data = df_tidy, aes(x = Month, y = Million_MJ, fill = Feedstock)) +
  geom_col(position = "stack") +
  scale_fill_manual(values = c(
    "Bagasse" = "#88CCEE",
    "Rubber" = "#AA4499",
    "Rice" = "#DDCC77",
    "Wood" = "#117733",
    "Oil Palm" = "#661100",
    "MSW" = "#888888"
  )) +
  theme_bw() +
  labs(y = NULL, x = NULL, title = "G. MALUKU & PAPUA") +
  theme(plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
        axis.text.x = element_text(size = 14, colour = "black", face = "bold", angle = 0, hjust = .5, vjust = 1),
        axis.text.y = element_text(size = 14, colour = "black", face = "bold"),
        legend.text = element_text(size = 10),
        axis.title.x = element_text(size = 10, face = "bold")) + # Add this line
  scale_y_continuous() +  # Remove the comma formatting if desired
  scale_x_discrete() +  # Remove breaks = NULL to show x-axis labels
  guides(fill = FALSE) 



