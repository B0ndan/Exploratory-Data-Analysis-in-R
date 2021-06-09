library(ggplot2)

#Series1
#Stripchart
p <- ggplot(mpg, aes(cyl, hwy))
p + geom_point()

#tambah jitter
p + geom_jitter()

# Add aesthetic mappings
p + geom_jitter(aes(colour = class))


# Use smaller width/height to emphasise categories
ggplot(mpg, aes(cyl, hwy)) + geom_jitter()


ggplot(mpg, aes(cyl, hwy)) + geom_jitter(width = 0.25)



# Use larger width/height to completely smooth away discreteness
ggplot(mpg, aes(cty, hwy)) + geom_jitter()


ggplot(mpg, aes(cty, hwy)) + geom_jitter(width = 0.5, height = 0.5)



#Series2
# Convert the variable dose from a numeric to a factor variable
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
head(ToothGrowth)

# Basic stripchart
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_jitter()

# Change the position
# 0.2 : degree of jitter in x direction
p<-ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_jitter(position=position_jitter(0.2))
p

# Rotate the stripchart
p + coord_flip()

#Limit x
p + scale_x_discrete(limits=c("0.5", "2"))



# Change point size
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_jitter(position=position_jitter(0.2), cex=1.2)

# Change shape
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_jitter(position=position_jitter(0.2), shape=17)


#add summary
# stripchart with mean points
p + stat_summary(fun.y=mean, geom="point", shape=18,
                 size=3, color="red")

# stripchart with median points
p + stat_summary(fun.y=median, geom="point", shape=18,
                 size=3, color="red")

# Add basic box plot
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_boxplot()+
  geom_jitter(position=position_jitter(0.2))

# Add notched box plot
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_boxplot(notch = TRUE)+
  geom_jitter(position=position_jitter(0.2))

# Add violin plot
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_violin(trim = FALSE)+
  geom_jitter(position=position_jitter(0.2))


# add mean n std
p <- ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_jitter(position=position_jitter(0.2))

p + stat_summary(fun.data="mean_sdl", fun.args=list(mult=1), 
                 geom="crossbar", width=0.5)

p + stat_summary(fun.data=mean_sdl, fun.args=list(mult=1), 
                 geom="pointrange", color="red")


# Function to produce summary statistics (mean and +/- sd)
data_summary <- function(x) {
  m <- mean(x)
  ymin <- m-sd(x)
  ymax <- m+sd(x)
  return(c(y=m,ymin=ymin,ymax=ymax))
}

p + stat_summary(fun.data=data_summary, color="blue")

#shape by group
# Change point shapes by groups
p<-ggplot(ToothGrowth, aes(x=dose, y=len, shape=dose)) + 
  geom_jitter(position=position_jitter(0.2))
p

# Change point shapes manually
p + scale_shape_manual(values=c(1,17,19))


#color by group
# Use single color
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_jitter(position=position_jitter(0.2), color="red")

# Change stripchart colors by groups
p<-ggplot(ToothGrowth, aes(x=dose, y=len, color=dose)) +
  geom_jitter(position=position_jitter(0.2))
p

# Use custom color palettes
p+scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))

# Use brewer color palettes
p+scale_color_brewer(palette="Dark2")

# Use grey scale
p + scale_color_grey() + theme_classic()


# position legend
p + theme(legend.position="top")
p + theme(legend.position="bottom")
p + theme(legend.position="none")# Remove legend


# scale limit
p + scale_x_discrete(limits=c("2", "0.5", "1"))


# multiple group
# Change stripchart colors by groups
ggplot(ToothGrowth, aes(x=dose, y=len, color=supp)) +
  geom_jitter(position=position_jitter(0.2))

# Change the position : interval between stripchart of the same group
p<-ggplot(ToothGrowth, aes(x=dose, y=len, color=supp, shape=supp)) +
  geom_jitter(position=position_dodge(0.8))
p


# Change colors
p+scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))

# Add box plots
ggplot(ToothGrowth, aes(x=dose, y=len, color=supp)) +
  geom_boxplot(color="black")+
  geom_jitter(position=position_jitter(0.2))

# Change the position
ggplot(ToothGrowth, aes(x=dose, y=len, color=supp)) +
  geom_boxplot(position=position_dodge(0.8))+
  geom_jitter(position=position_dodge(0.8))


