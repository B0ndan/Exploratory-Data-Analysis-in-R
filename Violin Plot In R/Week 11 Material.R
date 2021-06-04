# VIOLIN PLOT 
getwd()

## Violin plots are an alternative to box plots that solves the 
#issues regarding displaying the underlying distribution of the observations, 
#as these plots show a kernel density estimate of the data. 

# Violin Plot With Vector

WorldPopulation <- read.csv("WorldPopulation.csv") 
#You can Download it at https://www.kaggle.com/sansuthi/world-population-by-year 
head(WorldPopulation)

# install.packages("vioplot")
library("vioplot")

vioplot(WorldPopulation$Population, WorldPopulation$Urban)
vioplot(WorldPopulation$Density, WorldPopulation$UrbanPerc)
vioplot(c(WorldPopulation$Density))

vioplot(WorldPopulation$Density , WorldPopulation$UrbanPerc, 
        horizontal = TRUE, names = c("Density" , "UrbanPerc"))

vioplot(WorldPopulation$Density , WorldPopulation$UrbanPerc,
        col = 2,               # Color of the area
        rectCol = "red",       # Color of the rectangle
        lineCol = "white",     # Color of the line
        colMed = "green",      # Pch symbol color
        border = "black",      # Color of the border of the violin
        pchMed = 16,           # Pch symbol for the median
        plotCentre = "points") # If "line", plots a median line

data1 <- WorldPopulation$UrbanPerc
data1

#histogram
hist(data1, probability = TRUE, col = "grey", axes = TRUE,
     main = "", xlab = "",  ylab = "")

# X-axis
axis(1)

# Density
lines(density(data1), lwd = 2, col = "red")

# Add violin plot
par(new = TRUE)
vioplot(data1, horizontal = TRUE, yaxt = "n", axes = FALSE,
        col = rgb(0, 1, 1, alpha = 0.15))

