library(ggplot2)
library(plotly)


#############################################################
# Example using library ggplot dan Mass
library(MASS)

ggplot(geyser) + geom_histogram(aes(x = duration))
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

# Using a binwidth of 0.5 and customized fill and color settings produces a better result:
ggplot(geyser) +
  geom_histogram(aes(x = duration),
                 binwidth = 0.5, fill = "grey", color = "black")

#Reducing the bin width shows an interesting feature:
ggplot(geyser) +
  geom_histogram(aes(x = duration),
                 binwidth = 0.05, fill = "grey", color = "black")


plot(density(geyser$duration, bw = 0.05))


#ggplot2 density plot : Quick start guide - R software and data visualization
## Prepare Data
set.seed(1234)
df <- data.frame(
  sex=factor(rep(c("F", "M"), each=200)),
  weight=round(c(rnorm(200, mean=55, sd=5),
                 rnorm(200, mean=65, sd=5)))
)
head(df)
#df


## Change density plot colors by groups
### Calculate the mean of each group :
library(plyr)
mu <- ddply(df, "sex", summarise, grp.mean=mean(weight))
head(mu)

## Change density plot fill colors by groups
ggplot(df, aes(x=weight, fill=sex)) +
  geom_density()

## Use semi-transparent fill
p<-ggplot(df, aes(x=weight, fill=sex)) +
  geom_density(alpha=0.4)
p

### Use custom color palettes
p+scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))
### use brewer color palettes
p+scale_fill_brewer(palette="Dark2")
### Use grey scale
p + scale_fill_grey() + theme_classic()
### Change legend position
p + theme(legend.position="top")


# Combine histogram and density plots
ggplot(df, aes(x=weight)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666") 

ggplot(df, aes(x=weight)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666") 

## Color by groups
ggplot(df, aes(x=weight, color=sex, fill=sex)) + 
  geom_histogram(aes(y=..density..), alpha=0.5, 
                 position="identity")+
  geom_density(alpha=.2) 

#Customize Density Plots
## Basic density
ggplot(df, aes(x=weight, fill=sex)) +
  geom_density(fill="gray")+
  geom_vline(aes(xintercept=mean(weight)), color="blue",
             linetype="dashed")+
  labs(title="Weight density curve",x="Weight(kg)", y = "Density")+
  theme_classic()
## Change line colors by groups
p<- ggplot(df, aes(x=weight, color=sex)) +
  geom_density()+
  geom_vline(data=mu, aes(xintercept=grp.mean, color=sex),
             linetype="dashed")+
  labs(title="Weight density curve",x="Weight(kg)", y = "Density")

p + scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  theme_classic()
###Change Colors With Pallete
## Continuous colors
p + scale_color_brewer(palette="Paired") + theme_classic()
