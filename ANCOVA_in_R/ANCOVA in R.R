library("rcompanion")
library("car")
library("effects")
library("multcomp")

plotNormalHistogram(cellPhone$Night.Mins)

#Looks normally distributed!  

#Homogeneity of Variance

leveneTest(Night.Mins~International.Plan, data=cellPhone)

#Results weren't significant, assumption is met.

#Homogeneity of Regression Slopes

Homogeneity_RegrSlp = lm(Night.Mins~vMail.Plan, data=cellPhone)
anova(Homogeneity_RegrSlp)

#This assumption was met. 

#Sample size is met - need 20 per IV or CV and I have 2, so need at least 40 and there are over 4,000 cases!

#Run the Analysis

ANCOVA = lm(Night.Mins~vMail.Plan + International.Plan*vMail.Plan, data=cellPhone)
anova(ANCOVA)

#Whether a client has an international plan or not does not influence the number of night minutes he or she uses.