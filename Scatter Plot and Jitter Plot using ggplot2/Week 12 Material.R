# Week 12 Material
getwd()


#load package and data
library(ggplot2)

# Basic scatter plot
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
# Change the point size, and shape
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(size=2, shape=23)

# Label points in the scatter plot
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point() + 
  geom_text(label=rownames(mtcars))


geom_smooth(method="auto", se=TRUE, fullrange=TRUE, level=0.95)

# Add the regression line
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point()+
  geom_smooth(method=lm)
# Remove the confidence interval
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point()+
  geom_smooth(method=lm, se=FALSE)
# Loess method
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point()+
  geom_smooth(method=loess, se=FALSE)


# Change the appearance of points and lines
## This section describes how to change :
#1. the color and the shape of points
#2. the line type and color of the regression line
#3. the fill color of the confidence interval

# Change the point colors and shapes
# Change the line type and color
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point(shape=18, color="blue")+
  geom_smooth(method=lm, se=FALSE, linetype="dashed",
              color="darkred")
# Change the confidence interval fill color
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point(shape=18, color="blue")+
  geom_smooth(method=lm, se=TRUE, linetype="dashed",
              color="darkred", fill="blue")


# Convert cyl column from a numeric to a factor variable
mtcars$cyl <- as.factor(mtcars$cyl)
head(mtcars)
# Scatter plots with multiple groups
# Change point shapes by the levels of cyl
ggplot(mtcars, aes(x=wt, y=mpg, shape=cyl)) +
  geom_point()
# Change point shapes and colors
ggplot(mtcars, aes(x=wt, y=mpg, shape=cyl, color=cyl)) +
  geom_point()
# Change point shapes, colors and sizes
ggplot(mtcars, aes(x=wt, y=mpg, shape=cyl, color=cyl, size=cyl)) +
  geom_point()


# Change the point color/shape/size automatically
# Change point shapes by the levels of cyl
ggplot(mtcars, aes(x=wt, y=mpg, shape=cyl)) +
  geom_point()
# Change point shapes and colors
ggplot(mtcars, aes(x=wt, y=mpg, shape=cyl, color=cyl)) +
  geom_point()
# Change point shapes, colors and sizes
ggplot(mtcars, aes(x=wt, y=mpg, shape=cyl, color=cyl, size=cyl)) +
  geom_point()

# Add regression lines
# Add regression lines
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, shape=cyl)) +
  geom_point() + 
  geom_smooth(method=lm)
# Remove confidence intervals
# Extend the regression lines
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, shape=cyl)) +
  geom_point() + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)
# The fill color of confidence bands can be changed as follow :
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, shape=cyl)) +
  geom_point() + 
  geom_smooth(method=lm, aes(fill=cyl))

# Change point shapes and colors manually
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, shape=cyl)) +
  geom_point() + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)+
  scale_shape_manual(values=c(3, 16, 17))+ 
  scale_color_manual(values=c('#999999','#E69F00', '#56B4E9'))+
  theme(legend.position="top")

# Change the point sizes manually
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, shape=cyl))+
  geom_point(aes(size=cyl)) + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)+
  scale_shape_manual(values=c(3, 16, 17))+ 
  scale_color_manual(values=c('#999999','#E69F00', '#56B4E9'))+
  scale_size_manual(values=c(2,3,4))+
  theme(legend.position="top")


# Scatter plots with the 2d density estimation
# Scatter plot with the 2d density estimation
head(faithful)

sp <- ggplot(faithful, aes(x=eruptions, y=waiting)) +
  geom_point()
sp + geom_density_2d()
# Gradient color
sp + stat_density_2d(aes(fill = ..level..), geom="polygon")
# Change the gradient color
sp + stat_density_2d(aes(fill = ..level..), geom="polygon")+
  scale_fill_gradient(low="blue", high="red")

# Scatter plots with ellipses
# One ellipse arround all points
ggplot(faithful, aes(waiting, eruptions))+
  geom_point()+
  stat_ellipse()
# Ellipse by groups
p <- ggplot(faithful, aes(waiting, eruptions, color = eruptions > 3))+
  geom_point()
p + stat_ellipse()
# Change the type of ellipses: possible values are "t", "norm", "euclid"
p + stat_ellipse(type = "norm")

# Customized scatter plots
# Basic scatter plot
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point()+
  geom_smooth(method=lm, color="black")+
  labs(title="Miles per gallon \n according to the weight",
       x="Weight (lb/1000)", y = "Miles/(US) gallon")+
  theme_classic()  
# Change color/shape by groups
# Remove confidence bands
p <- ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, shape=cyl)) + 
  geom_point()+
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)+
  labs(title="Miles per gallon \n according to the weight",
       x="Weight (lb/1000)", y = "Miles/(US) gallon")
p + theme_classic()  

# Create Scatter Plot using ggplot2 in R
# Default way to draw Scatter Plot with diamond data
ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point()


####################################################################
# Program R untuk eksplorasi data World Report Happiness 2018/2019

library(readxl)
library(ggplot2)
library(dplyr)
library(RColorBrewer)

Data_World_Happy_2018_2019 <- read_excel("Data World Happy 2018-2019.xlsx")
attach(Data_World_Happy_2018_2019)
head(Data_World_Happy_2018_2019)

theme_set(theme_classic())

data2018 <- Data_World_Happy_2018_2019 %>% filter(Year!="2019",`Country or region`!="United Arab Emirates")
data2018$Corruption <- as.numeric(as.character(data2018$Corruption))

data2019 <- Data_World_Happy_2018_2019 %>% filter(Year!="2018",`Country or region`!="United Arab Emirates")
data2019$Corruption <- as.numeric(as.character(data2019$Corruption))

dataAll <- Data_World_Happy_2018_2019  %>% filter(`Country or region`!="United Arab Emirates")
dataAll$Corruption <- as.numeric(as.character(dataAll$Corruption))


### Correlogram UNTUK SEMUA ASPEK ###
library(corrplot)
a <- dataAll[,c(3:9)]
a$Corruption <- as.numeric(as.character(a$Corruption))
Cor <- cor(a); Cor

corrplot(Cor,method = "number",col=brewer.pal(n=8, name="RdYlBu"),
         title="Correlogram",
         caption = "Source : https://www.kaggle.com/unsdsn/world-happiness#2019.csv")

corrplot(Cor, type="upper", order="hclust",
         col=brewer.pal(n=8, name="PuOr"),
         title="Correlogram",
         caption = "Source : https://www.kaggle.com/unsdsn/world-happiness#2019.csv")

### SCATTERPLOT SCORE VS SEMUA ASPEK ###

# Scatterplot untuk vs GDP per capita
theme_set(theme_classic())
Sg1<-ggplot(data2018, aes(x=GDP,y=Score))+
  geom_point(aes(col=factor(Year)))+
  geom_smooth(method="loess",se=F)+
  labs(substitle="GDP vs Score (2018)",
       y="Score",
       x="GDP",
       title="Scatterplot GDP vs Score (2018)",
       caption="Source : https://www.kaggle.com/unsdsn/world-happiness#2019.csv")
Sg1


Sg2<-ggplot(data2019, aes(x=GDP,y=Score))+
  geom_point(aes(col=factor(Year)))+
  geom_smooth(method="loess",se=F,fullrange = T)+
  labs(substitle="GDP vs Score (2019)",
       y="Score",
       x="GDP",
       title="Scatterplot GDP vs Score (2019)",
       caption="Source : https://www.kaggle.com/unsdsn/world-happiness#2019.csv")
Sg2

# Scatterplot untuk vs Social support

Ss1<-ggplot(data2018, aes(x=SocSup,y=Score))+
  geom_point(aes(col=factor(Year)))+
  geom_smooth(method="loess",se=F)+
  labs(substitle="Social support vs Score (2018)",
       y="Score",
       x="Social support",
       title="Scatterplot Social support vs Score (2018)",
       caption="Source : https://www.kaggle.com/unsdsn/world-happiness#2019.csv")
+ theme_set(theme_dark())
Ss1



Ss2<-ggplot(data2019, aes(x=SocSup,y=Score))+
  geom_point(aes(col=factor(Year)))+
  geom_smooth(method="loess",se=F)+
  labs(substitle="Social support vs Score (2019)",
       y="Score",
       x="Social support",
       title="Scatterplot Social support vs Score (2019)",
       caption="Source : https://www.kaggle.com/unsdsn/world-happiness#2019.csv")
Ss2










