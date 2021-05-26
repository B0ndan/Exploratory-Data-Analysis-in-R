# Week 10 Material
# library
library(ggplot2)

# The mtcars dataset is natively available in R
#head(mpg)

# Top Left: Set a unique color with fill, colour, and alpha
ggplot(mpg, aes(x=class, y=hwy)) + 
  geom_boxplot(color="red", fill="orange", alpha=0.2)

# Top Right: Set a different color for each group
ggplot(mpg, aes(x=class, y=hwy, fill=class)) + 
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none")

# Bottom Left
ggplot(mpg, aes(x=class, y=hwy, fill=class)) + 
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none") +
  scale_fill_brewer(palette="BuPu")

# Bottom Right
ggplot(mpg, aes(x=class, y=hwy, fill=class)) + 
  geom_boxplot(alpha=0.3) +
  theme(legend.position="none") +
  scale_fill_brewer(palette="Dark2")



##Hilighted
# Libraries
library(ggplot2)
library(dplyr)
library(hrbrthemes)

# Work with the natively available mpg dataset
mpg %>% 
  
  # Add a column called 'type': do we want to highlight the group or not?
  mutate( type=ifelse(class=="subcompact","Highlighted","Normal")) %>%
  
  # Build the boxplot. In the 'fill' argument, give this column
  ggplot( aes(x=class, y=hwy, fill=type, alpha=type)) + 
  geom_boxplot() +
  scale_fill_manual(values=c("#69b3a2", "grey")) +
  scale_alpha_manual(values=c(1,0.1)) +
  theme_ipsum() +
  theme(legend.position = "none") +
  xlab("")



##Grouped Boxplot
# library
library(ggplot2)

# create a data frame
variety=rep(LETTERS[1:7], each=40)
treatment=rep(c("high","low"),each=20)
note=seq(1:280)+sample(1:150, 280, replace=T)
data=data.frame(variety, treatment ,  note)

# grouped boxplot
ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
  geom_boxplot()




# One box per treatment
p1 <- ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
  geom_boxplot() +
  facet_wrap(~treatment)

p1
# one box per variety
p2 <- ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
  geom_boxplot() +
  facet_wrap(~variety, scale="free")

p2


##GGplot BoxPlot for numeric variable
# library
library(ggplot2)
library(dplyr)
library(hrbrthemes)

# Start with the diamonds dataset, natively available in R:
p <- diamonds %>%
  
  # Add a new column called 'bin': cut the initial 'carat' in bins
  mutate( bin=cut_width(carat, width=0.5, boundary=0) ) %>%
  
  # plot
  ggplot( aes(x=bin, y=price) ) +
  geom_boxplot(fill="#69b3a2") +
  theme_ipsum() +
  xlab("Carat")




##GGExtra with Marginal
# library
library(ggplot2)
library(ggExtra)

# The mtcars dataset is proposed in R
head(mtcars)

# classic plot :
p <- ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) +
  geom_point() +
  theme(legend.position="none")
p

# with marginal histogram
p1 <- ggMarginal(p, type="histogram")

p1
# marginal density
p2 <- ggMarginal(p, type="density")

p2
# marginal boxplot
p3 <- ggMarginal(p, type="boxplot")

p3



# ======================================================================
library(ggplot2)
library(tidyverse)
#library(urltools)


getwd()
data <- read.csv("UNC_Salares_NandO_2015-05-06.csv")

head(data)

summary(data)
max(data$totalsal)
median(data$totalsal)

ggplot(data=data) + geom_boxplot(aes(x=0, y=totalsal))

data %>% 
  filter(dept %in% c("Pediatrics", "Orthodontics" , 'Ophthalmology')) %>%
  ggplot() +
  geom_boxplot(aes(x=dept, y=totalsal)) + 
  coord_flip() + ggtitle("Data Instuctor In Campus") + xlab("Department")+ylab("Total Salary") # max the labels horizontal so people can read them!
  
# How to Make Horizontal Boxplot with ggplot2 version 3.3.3?
packageVersion("ggplot2")

theme_set(theme_bw(base_size = 16))

fast_food <-  readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-09-04/fastfood_calories.csv")

# We will make plots using restaurants and calories variables from the fast food data.
fast_food <- fast_food %>%
  mutate(restaurant=fct_reorder(restaurant, calories)) 

# So we can simply swap x and y axis to make horizontal boxplot. 
# Note we also have to specify correct axis to make log-scale. 
# In this case, we want to have log scale on x-axis.
fast_food %>%
  ggplot(aes(x=calories,y=restaurant, color=restaurant)) +
  geom_boxplot()+
  geom_jitter(width=0.15, alpha=0.5)+
  scale_x_log10()+
  labs(y="Restaurant") +
  theme(legend.position="none")
ggsave("horizontal_boxplot_with_ggplot2_v3.3.png")

