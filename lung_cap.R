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

plot( FEV ~ Age,
      data=subset(lungcap, Smoke=="Non-smoker"), # Only select non-smokers
      main="FEV vs age\nfor non-smokers",
      ylab="FEV (in L)", xlab="Age (in years)",
      ylim=c(0, 6), xlim=c(0, 20), las=1)

plot( FEV ~ Ht, data=subset(lungcap, Smoke=="Smoker"),
      main="FEV vs height\nfor smokers",
      ylab="FEV (in L)", xlab="Height (in inches)",
      xlim=c(45, 75), ylim=c(0, 6), las=1)

plot( FEV ~ Ht, data=subset(lungcap, Smoke=="Non-smoker"),
      main="FEV vs height\nfor non-smokers",
      ylab="FEV (in L)", xlab="Height (in inches)",
      xlim=c(45, 75), ylim=c(0, 6), las=1)

AgeAdjust <- lungcap$Age + ifelse(lungcap$Smoke=="Smoker", 0, 0.5)

plot( FEV ~ AgeAdjust, data=lungcap,
      pch = ifelse(Smoke=="Smoker", 3, 20),
      xlab="Age (in years)", ylab="FEV (in L)", main="FEV vs age", las=1)

boxplot(lungcap$FEV ~ lungcap$Smoke + lungcap$Gender,
        ylab="FEV (in L)", main="FEV, by gender\n and smoking status",
        las=2,
        # Keeps labels perpendicular to the axes
        names=c("F:\nNon", "F:\nSmoker", "M:\nNon", "M:\nSmoker"))

interaction.plot( lungcap$Smoke, lungcap$Gender, lungcap$FEV,
                  xlab="Smoking status", ylab="FEV (in L)",
                  main="Mean FEV, by gender\n and smoking status",
                  trace.label="Gender", las=1)

interaction.plot( lungcap$Smoke, lungcap$Gender, lungcap$Age,
                  xlab="Smoking status", ylab="Age (in years)",
                  main="Mean age, by gender\n and smoking status",
                  trace.label="Gender", las=1)

contrasts( relevel( lungcap$Gender, "M") )
contrasts(lungcap$Gender)

lungcap$Smoke <- factor(lungcap$Smoke,
                        levels=c(0, 1),
                        labels=c("Non-smoker","Smoker"))
contrasts(lungcap$Smoke)
