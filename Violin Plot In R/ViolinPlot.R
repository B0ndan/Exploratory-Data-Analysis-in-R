ToothGrowth$dose<-as.factor(ToothGrowth$dose)

#suatu density (lekukan)
#menggambarkan distribusi

#data non-parametrik
#kepadatan massa

#semakin cembung rata" semakin besar
#semakin lebar = varian semakin besar

library(ggplot2)
#basic violin plot
p<-ggplot(ToothGrowth, aes(x=dose,y=len)) + geom_violin()
p

#Rotate the violin plot
p + coord_flip()

#Set trim argument to FALSE
ggplot(ToothGrowth, aes(x=dose,y=len)) + geom_violin(trim=FALSE)


p+scale_x_discrete(limits=c("0.5","2"))



#mean point
p+stat_summary(fun.y=mean, geom="point",shape=23,size=2)

#median point
p+stat_summary(fun.y=median,geom="point",size=2,color="red")


#with boxplot
p+geom_boxplot(width=0.1)

#with mean and std (crossbar n pointrange)
p <- ggplot(ToothGrowth, aes(x=dose, y=len)) + geom_violin(trim=FALSE) 

p + stat_summary(fun.data="mean_sdl", mult=1, geom="crossbar", width=0.2 ) 

p + stat_summary(fun.data="mean_sdl", mult=1, geom="pointrange", color="red")



data_summary<- function(x) {
  m <- mean(x) 
  ymin <- m-sd(x) 
  ymax <- m+sd(x) 
  return(c(y=m,ymin=ymin,ymax=ymax))
} 
p + stat_summary(fun.data=data_summary)

                 
# violin plot with dot plot 
p + geom_dotplot(binaxis='y', stackdir='center', dotsize=1) 

# violin plot with jittered points 
# 0.2 : degree of jitter in x direction 
p + geom_jitter(shape=16, position=position_jitter(0.2))


# Change violin plot line colors by groups 
p<-ggplot(ToothGrowth, aes(x=dose, y=len, color=dose)) + geom_violin(trim=FALSE) 
p

#manual color_line

p+scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))

p+scale_color_brewer(palette="Dark2")

p + scale_color_grey() + theme_classic()



#Fill Color

ggplot(ToothGrowth, aes(x=dose, y=len)) + geom_violin(trim=FALSE, fill='#A4A4A4', color="darkred")+ geom_boxplot(width=0.1) + theme_minimal()

#by group color

p<-ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose)) + geom_violin(trim=FALSE) 
p


p+scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))


p+scale_fill_brewer(palette="Dark2")


p + scale_fill_grey() + theme_classic()


# beberapa grup coloring

ggplot(ToothGrowth, aes(x=dose, y=len, fill=supp)) + geom_violin()

p<-ggplot(ToothGrowth, aes(x=dose, y=len, fill=supp)) + geom_violin(position=position_dodge(1)) 
p


#mengubah warna dan dotplot

p+scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))

p + geom_dotplot(binaxis='y', stackdir='center', position=position_dodge(1))


#mengubah posisi legend

p + theme(legend.position="top") 
p + theme(legend.position="bottom")
p + theme(legend.position="none") # Remove legend


#mengubah urutan legend

p + scale_x_discrete(limits=c("2", "0.5", "1"))



#Violin customized

#basic v.plot
ggplot(ToothGrowth, aes(x=dose, y=len)) + geom_violin(trim=FALSE, fill="gray")+ labs(title="Plot of length by dose",x="Dose (mg)", y = "Length")+ geom_boxplot(width=0.1)+ theme_classic()


#Change.color by group
dp <- ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose)) + geom_violin(trim=FALSE)+ geom_boxplot(width=0.1, fill="white")+ labs(title="Plot of length by dose",x="Dose (mg)", y = "Length") 
dp + theme_classic()

# Continues colors 
dp + scale_fill_brewer(palette="Blues") + theme_classic() 

# Discrete colors 
dp + scale_fill_brewer(palette="Dark2") + theme_minimal() 

# Gradient colors 
dp + scale_fill_brewer(palette="RdBu") + theme_minimal()



