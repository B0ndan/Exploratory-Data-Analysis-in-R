# Resistant Line
getwd()
# Import Data mtcars
data(mtcars)
head(mtcars)

# Split Data  
head(mtcars[c('mpg', 'disp')])
mtcars[c('mpg', 'disp')]

# Take the Intercept and Slope Value
## Function = line(x, y, iter = 1)
## Fit a line robustly as recommended in Exploratory Data Analysis.
x = mtcars$mpg
y = mtcars$disp


Resline = line(x, y, iter = 4)
Resline

class(Resline)

## Methods are available for the generic functions coef, residuals, fitted, and print.
residuals(Resline)

coef(Resline)

fitted(Resline)

intersep = Resline$coefficients[1]
slope = Resline$coefficients[2]

# Making Resistant Line Plot
# 1
plot(x, y)
abline(a = intersep, b = slope)


# 2
R1 = line(x, y, iter = 1)
R2 = line(x, y, iter = 2)
R3 = line(x, y, iter = 3)
R4 = line(x, y, iter = 4)

plot(x, y)
abline(a = R1$coefficients[1], b = R1$coefficients[2], col = 'magenta')
abline(a = R2$coefficients[1], b = R2$coefficients[2], col = 'darkgreen')
abline(a = R3$coefficients[1], b = R3$coefficients[2], col = 'lightblue')
#abline(a = R4$coefficients[1], b = R4$coefficients[2], col = 'black')

# Data From the PDF Example
install.packages('readxl')
library(readxl)

df = read_excel('data temperature mortality.xlsx')
head(df)

# Take the Value of Intercept and Slope
x1 = df$temp
y1 = df$mortal

tempmor = line(x1, y1, iter = 4)
tempmor

residuals(tempmor)

coef(tempmor)

fitted(tempmor)

intersep = tempmor$coefficients[1]
slope = tempmor$coefficients[2]


## Making Plot of PDF Example Data
plot(x1, y1)
abline(a = intersep, b = slope)

R1 = line(x1, y1, iter = 1)
R2 = line(x1, y1, iter = 2)
R3 = line(x1, y1, iter = 3) 
R4 = line(x1, y1, iter = 4)

plot(x1, y1)
abline(a = R1$coefficients[1], b = R1$coefficients[2], col = 'red')
abline(a = R2$coefficients[1], b = R2$coefficients[2], col = 'green')
abline(a = R3$coefficients[1], b = R3$coefficients[2], col = 'blue')
#abline(a = R4$coefficients[1], b = R4$coefficients[2], col = 'black')




