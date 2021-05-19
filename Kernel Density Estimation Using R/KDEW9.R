hist(mtcars$mpg)

# Colored Histogram with Different Number of Bins
hist(mtcars$mpg, breaks=12, col="red")


# Add a Normal Curve (Thanks to Peter Dalgaard)
x <- mtcars$mpg
h<-hist(x, breaks=10, col="red", xlab="Miles Per Gallon",
        main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)

# Kernel Density Plot
d <- density(mtcars$mpg) # returns the density data
plot(d) # plots the results


# Filled Density Plot
d <- density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d, col="red", border="blue")


# Compare MPG distributions for cars with
# 4,6, or 8 cylinders
library(sm)
attach(mtcars)
# create value labels
cyl.f <- factor(cyl, levels= c(4,6,8),
                labels = c("4 cylinder", "6 cylinder", "8 cylinder"))
# plot densities
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
title(main="MPG Distribution by Car Cylinders")
# add legend via mouse click
colfill<-c(2:(2+length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill=colfill,cex=0.45)






#Tugas atau Latihan
A=(mtcars$mpg);A
n=length(A);n
h=0.5;h
summary(A)
x=seq(9,35, by=0.1);x
Xl=A;Xl
#Logistic
k1 = (1/(n*h))*(1/(exp((x-Xl[1])/h)+2+exp(-1*(x-Xl[1])/h)))
k2 = (1/(n*h))*(1/(exp((x-Xl[2])/h)+2+exp(-1*(x-Xl[2])/h)))
k3 = (1/(n*h))*(1/(exp((x-Xl[3])/h)+2+exp(-1*(x-Xl[3])/h)))
k4 = (1/(n*h))*(1/(exp((x-Xl[4])/h)+2+exp(-1*(x-Xl[4])/h)))
k5 = (1/(n*h))*(1/(exp((x-Xl[5])/h)+2+exp(-1*(x-Xl[5])/h)))
k6 = (1/(n*h))*(1/(exp((x-Xl[6])/h)+2+exp(-1*(x-Xl[6])/h)))
k7 = (1/(n*h))*(1/(exp((x-Xl[7])/h)+2+exp(-1*(x-Xl[7])/h)))
k8 = (1/(n*h))*(1/(exp((x-Xl[8])/h)+2+exp(-1*(x-Xl[8])/h)))
k9 = (1/(n*h))*(1/(exp((x-Xl[9])/h)+2+exp(-1*(x-Xl[9])/h)))
k10 = (1/(n*h))*(1/(exp((x-Xl[10])/h)+2+exp(-1*(x-Xl[10])/h)))
k11 = (1/(n*h))*(1/(exp((x-Xl[11])/h)+2+exp(-1*(x-Xl[11])/h)))
k12 = (1/(n*h))*(1/(exp((x-Xl[12])/h)+2+exp(-1*(x-Xl[12])/h)))
k13 = (1/(n*h))*(1/(exp((x-Xl[13])/h)+2+exp(-1*(x-Xl[13])/h)))
k14 = (1/(n*h))*(1/(exp((x-Xl[14])/h)+2+exp(-1*(x-Xl[14])/h)))
k15 = (1/(n*h))*(1/(exp((x-Xl[15])/h)+2+exp(-1*(x-Xl[15])/h)))
k16 = (1/(n*h))*(1/(exp((x-Xl[16])/h)+2+exp(-1*(x-Xl[16])/h)))
k17 = (1/(n*h))*(1/(exp((x-Xl[17])/h)+2+exp(-1*(x-Xl[17])/h)))
k18 = (1/(n*h))*(1/(exp((x-Xl[18])/h)+2+exp(-1*(x-Xl[18])/h)))
k19 = (1/(n*h))*(1/(exp((x-Xl[19])/h)+2+exp(-1*(x-Xl[19])/h)))
k20 = (1/(n*h))*(1/(exp((x-Xl[20])/h)+2+exp(-1*(x-Xl[20])/h)))
k21 = (1/(n*h))*(1/(exp((x-Xl[21])/h)+2+exp(-1*(x-Xl[21])/h)))
k22 = (1/(n*h))*(1/(exp((x-Xl[22])/h)+2+exp(-1*(x-Xl[22])/h)))
k23 = (1/(n*h))*(1/(exp((x-Xl[23])/h)+2+exp(-1*(x-Xl[23])/h)))
k24 = (1/(n*h))*(1/(exp((x-Xl[24])/h)+2+exp(-1*(x-Xl[24])/h)))
k25 = (1/(n*h))*(1/(exp((x-Xl[25])/h)+2+exp(-1*(x-Xl[25])/h)))
k26 = (1/(n*h))*(1/(exp((x-Xl[26])/h)+2+exp(-1*(x-Xl[26])/h)))
k27 = (1/(n*h))*(1/(exp((x-Xl[27])/h)+2+exp(-1*(x-Xl[27])/h)))
k28 = (1/(n*h))*(1/(exp((x-Xl[28])/h)+2+exp(-1*(x-Xl[28])/h)))
k29 = (1/(n*h))*(1/(exp((x-Xl[29])/h)+2+exp(-1*(x-Xl[29])/h)))
k30 = (1/(n*h))*(1/(exp((x-Xl[30])/h)+2+exp(-1*(x-Xl[30])/h)))
k31 = (1/(n*h))*(1/(exp((x-Xl[31])/h)+2+exp(-1*(x-Xl[31])/h)))
k32 = (1/(n*h))*(1/(exp((x-Xl[32])/h)+2+exp(-1*(x-Xl[32])/h)))

kt = k1 + k2 + k3 + k4 + k5 +k6 + k7 + k8 + k9 + k10 + k11 + k12 + k13 + k14 + k15 +k16 + k17 + k18 + k19 + k20 +k21 + k22 + k23 + k24 + k25 +k26 + k27 + k28 + k29 + k30 + k31 + k32

plot(x,k1,type="l",col="black",ylim=c(0,0.13),main="Kernel Logistic mtcars$mpg dengan h = 0.5",col.main="black",
     cex.main=1,xlab="x",ylab="fh(x)")

lines(x,k2)
lines(x,k3)
lines(x,k4)
lines(x,k5)
lines(x,k6)
lines(x,k7)
lines(x,k8)
lines(x,k9)
lines(x,k10)
lines(x,k11)
lines(x,k12)
lines(x,k13)
lines(x,k14)
lines(x,k15)
lines(x,k16)
lines(x,k17)
lines(x,k18)
lines(x,k19)
lines(x,k20)
lines(x,k21)
lines(x,k22)
lines(x,k23)
lines(x,k24)
lines(x,k25)
lines(x,k26)
lines(x,k27)
lines(x,k28)
lines(x,k29)
lines(x,k30)
lines(x,k31)
lines(x,k32)
lines(x,kt,col="green")


# Using Loop in R for Kernel Density Estimation
X=mtcars$mpg
h=0.5
n=length(X)
x=seq(10,34,by=0.1)
nx=length(x)
k=matrix(0,nx,n)
for(i in 1:n){
  for(j in 1:nx){
    k[j,i]=(1/(n*h))*(1/((2*22/7)^0.5))*exp((-0.5)*((x[j]-X[i])/h)^2)
    
  }
}
kt=0
for (i in 1:n){
  kt=kt+k[,i]
}
plot(x,kt)

