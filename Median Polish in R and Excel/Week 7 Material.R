getwd()

# MEDIAN POLISH
library(readxl)
df = read_xlsx('Data pdf (Tobacco) Excel.xlsx')
head(df)

df1 <- df[ ,-1]
df1

medpol <- medpolish(df1, eps = 0.01, maxiter = 10, trace.iter = TRUE,
          na.rm = FALSE)
medpol

plot(medpol)


# ROOTOGRAM
#install.packages("countreg", repos="http://R-Forge.R-project.org")
library(countreg)

df2 = read.csv("Data Chest.csv", sep = ";")
df2

hist(df2$Count)

data = rep(df2$Chess, df2$Count)
data

rootogram(data, fitted = "t", style = c("hanging"))










