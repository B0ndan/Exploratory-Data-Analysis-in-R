# Week 14 Material
# license : bvitto

## Prerequisites:
## gganimate stable version is available on CRAN 
## and can be installed with install.packages('gganimate')

library(ggplot2)
library(gganimate)
theme_set(theme_bw())

# Dataset Demo
library(gapminder)
head(gapminder, 10)


# Staticplot (Bubbleplot)
static <- ggplot(
  gapminder, 
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")
static

# Transition through distinct states in time
# Basics
## transition_time(). The transition length between the states 
## will be set to correspond to the actual time difference between them.
## Label variables: frame_time

bismillahgerak <- p + transition_time(year) + labs(title = "Year: {frame_time}")
bismillahgerak

# facets by continents
setiap_benua <- p + facet_wrap(~continent) + transition_time(year) +
                labs(title = "Year: {frame_time}")
setiap_benua

# Let the view follow the data in each frame
berdasarkan_view <-p + transition_time(year) + 
                    labs(title = "Year: {frame_time}") + 
                    view_follow(fixed_y = TRUE)
berdasarkan_view

# Show preceding frames with gradual falloff
punya_bayangan <- p + transition_time(year) + 
                  labs(title = "Year: {frame_time}") 
                  + shadow_wake(wake_length = 0.1, alpha = FALSE)
punya_bayangan

# Show the original data as background marks
bg_original <-p + transition_time(year) +
              labs(title = "Year: {frame_time}") +
              shadow_mark(alpha = 0.3, size = 0.5)
bg_original


# Line Transisiton not Bubble anymore

# Static Line 
garis <- ggplot(
  airquality,
  aes(Day, Temp, group = Month, color = factor(Month))
) +
  geom_line() +
  scale_color_viridis_d() +
  labs(x = "Day of Month", y = "Temperature") +
  theme(legend.position = "top")
garis

# Line plot bergerak. Mari kita coba!

## Reveal by day
garis + transition_reveal(Day)

## show points
garis + geom_point() + transition_reveal(Day)

## Points can be kept by giving them a unique group
p + geom_point(aes(group = seq_along(Day))) + transition_reveal(Day)



# Transition between several distinct stages of the data

## Data Preparation
library(dplyr)
mean.temp <- airquality %>%
  group_by(Month) %>%
  summarise(Temp = mean(Temp))
mean.temp

# Bar Plot
batang <- ggplot(mean.temp, aes(Month, Temp, fill = Temp)) +
  geom_col() +
  scale_fill_distiller(palette = "PuRd", direction = 1) +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(color = "white"),
    panel.ontop = TRUE
  )
batang

# Gerak nih berdasarkan transition_states()
batang + transition_states(Month, wrap = F) +
  shadow_mark()

# Adding Fade 
batang + transition_states(Month, wrap = FALSE) +
  shadow_mark() +
  enter_grow() +
  enter_fade()



