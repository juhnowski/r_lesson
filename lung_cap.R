# install.packages("GLMsData",lib="/data")
library(GLMsData)
data("lungcap")
View(lungcap)
head(lungcap)
head(lungcap$Age)
head(lungcap$Gender)
tail(lungcap$Gender)
length(lungcap$Age)
dim(lungcap)
str(lungcap)
summary(lungcap)

lungcap$Smoke <- factor(lungcap$Smoke,
                        levels=c(0,1),
                        labels=c("Non-smoker","Smoker"))
summary(lungcap$Smoke)

plot(FEV~Age, data = lungcap,
    xlab = "Age (in years)",
    ylab = "FEV (in L)",
    main = "FEV vs age",
    xlim = c(0, 20),
    ylim = c(0,6),
    las=1
)    

plot( FEV ~ Ht, data=lungcap, main="FEV vs height",
      xlab="Height (in inches)", ylab="FEV (in L)",
      las=1, ylim=c(0, 6) )

plot( FEV ~ Gender, data=lungcap,
      main="FEV vs gender", ylab="FEV (in L)",
      las=1, ylim=c(0, 6))

plot( FEV ~ Smoke, data=lungcap, main="FEV vs Smoking status",
      ylab="FEV (in L)", xlab="Smoking status",
      las=1, ylim=c(0, 6))

plot( FEV ~ Age,
      data=subset(lungcap, Smoke=="Smoker"), # Only select smokers
      main="FEV vs age\nfor smokers",
      # \n means `new line'
      ylab="FEV (in L)", xlab="Age (in years)",
      ylim=c(0, 6), xlim=c(0, 20), las=1)