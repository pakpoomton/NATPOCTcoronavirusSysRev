


### input 2x2 table data

TP = c(14,16,42,38,43,52,6,52,8,43,
       12,93,17,34,44,94,8,20,7,65,
       119,7,58,16,6,33)

FP = c(2,1,1,0,0,2,7,0,0,1,
       0,0,0,2,0,0,3,0,0,0,
       2,0,0,0,0,0)

FN = c(0,15,10,2,2,0,0,0,0,4,
       0,14,0,2,4,33,2,11,0,23,
       10,0,0,0,0,0)

TN = c(138,69,30,42,25,49,46,62,8,212,
       5,50,7,18,72,73,8,88,2,25,
       661,7,72,191,1,96)

# construct 2x2 summary data-frame of all studies
NATresult <- data.frame(TP, FP, FN, TN)

#  labeling study list
studylist = c('Baek 2020', 'Basu 2020pp', 'Ben-Assa 2020pp', 'Broughton 2020', 'Butt 2020pp',
              'Go 2017', 'Hong 2004', 'Hou 2020pp', 'Huang 2020', 'Jiang	2020pp', 
              'Joung 2020pp', 'Lee 2020pp', 'Lu 2020a', 'Lu 2020b', 'Mohan 2020pp',
              'Moore 2020pp', 'Osterdahl	2020pp', 'Poon 2004', 'Shirato 2018', 'Smithgall 2020pp', 
              'Thi 2020pp', 'Wang	2005', 'Yan 2020', 'Yang 2020pp', 'Zhang	2020pp',
              'Zhu	2020pp')



## define subgroup
### RT-LAMP vs CRISPR vs ID Now
NATresult_RTLAMP <- NATresult[c(1,3,5,7,9,10,12,13,14,15,17,18,19,21,23,24,25,26), ] 
NATresult_CRISPR <- NATresult[c(4,8,11), ] 
NATresult_IDNow <- NATresult[c(2,16,20), ] 

### SARS vs MERS vs COVID19 
NATresult_SARS <- NATresult[c(7,18,22), ] 
NATresult_MERS <- NATresult[c(6,19), ] 
NATresult_COVID19 <- NATresult[-c(6,7,18,19,22), ] 

### small vs large sample size
NATresult_small<- NATresult[c(7,9, 11, 13,19,22,25), ] 
NATresult_large <- NATresult[-c(7,9,11, 13,19,22,25), ] 

### published vs pre-print
NATresult_published <- NATresult[c(1,4,6,7,9,13,14,18,19,22,23), ] 
NATresult_preprint <- NATresult[-c(1,4,6,7,9,13,14,18,19,22,23), ] 

#### Covid-19, large study: LAMP vs CRISPR vs ID Now######
NATresult_COVID19largeLAMP <- NATresult[c(1,3,5,10,12,14,15,17,21,23,24,26), ] 
NATresult_COVID19largeCRISPR <- NATresult[c(4,8), ] 
NATresult_COVID19largeIDNow <- NATresult[c(2,16,20), ] 
NATresult_COVID19large <- NATresult[c(1,2,3,4,5,8,10,12,14,15,16,17,20,21,23,24,26), ] 


NATresult_COVID19largeLAMP_Crude <- NATresult[c(3,12), ] 
NATresult_COVID19largeLAMP_Pure <- NATresult[c(1,5,10,14,15,17,21,23,24,26), ] 

#### Covid-19, large study: published vs preprint LAMP ######
#NATresult_COVID19largePub <- NATresult[c(1,4,23), ] 
#NATresult_COVID19largePre <- NATresult[c(2,3,5,8,10,12,14,15,16,17,20,21,24,26), ] 

NATresult_COVID19largePubLAMP <- NATresult[c(1,23), ] 
NATresult_COVID19largePreLAMP <- NATresult[c(3,5,10,12,14,15,17,21,24,26), ] 

NATresult_COVID19largePubLAMP_Pure <- NATresult[c(1,23), ] 
NATresult_COVID19largePreLAMP_Pure <- NATresult[c(5,10, 14,15,17,21,24,26), ] 


####++++


colSums(NATresult)

###################
library("mada")
### generate forest plot for sensitivity and specificity
forest(madad(NATresult, correction = 0.0), type = "spec", snames = studylist, main = "Specificity forest plot")
forest(madad(NATresult, correction = 0.0 ), type = "sens", snames = studylist, main = "Sensitivity forest plot")

# calculate DOR of each and of all included data. 
(fit.DOR.DSL <- madauni(NATresult, snames = studylist))
forest(fit.DOR.DSL, main = "DOR forest plot")

# ##
print("\n")
print("****** DOR of each and ALL included data ******")
summary(fit.DOR.DSL)






##################*****
print("\n")
print("\n")
print("\n")
print("\n")
######
print(">>>>>>>>>> subgroup analyses ... all studies <<<<<<")

## extract data subgroup


print("\n")
print("*******||||**METHOD**||||******")

### RT-LAMP vs CRISPR vs IDNow

fit_RTLAMP.DOR.DSL <- madauni(NATresult_RTLAMP)
fit_CRISPR.DOR.DSL <- madauni(NATresult_CRISPR)
fit_IDNow.DOR.DSL <- madauni(NATresult_IDNow)

print("\n")
print("*****DOR RT-LAMP*****")
summary(fit_RTLAMP.DOR.DSL)
colSums(NATresult_RTLAMP)

print("*****CRISPR*****")
summary(fit_CRISPR.DOR.DSL)
colSums(NATresult_CRISPR)

print("*****IDNow*****")
summary(fit_IDNow.DOR.DSL)
colSums(NATresult_IDNow)

print("\n")
print("********||||**DISEASE**||||*********")


fit_SARS.DOR.DSL <- madauni(NATresult_SARS)
fit_MERS.DOR.DSL <- madauni(NATresult_MERS)
fit_COVID19.DOR.DSL <- madauni(NATresult_COVID19)


print("\n")
print("*****DOR SARS*****")
summary(fit_SARS.DOR.DSL)
colSums(NATresult_SARS)

print("\n")
print("*****DOR MERS*****")
summary(fit_MERS.DOR.DSL)
colSums(NATresult_MERS)

print("\n")
print("*****DOR COVID19*****")
summary(fit_COVID19.DOR.DSL)
colSums(NATresult_COVID19)


print("\n")


print("********||||**Study size**||||*********")

fit_small.DOR.DSL <- madauni(NATresult_small)
fit_large.DOR.DSL <- madauni(NATresult_large)

print("\n")
print("*****DOR small*****")
summary(fit_small.DOR.DSL)
colSums(NATresult_small)

print("\n")
print("*****DOR large*****")
summary(fit_large.DOR.DSL)
colSums(NATresult_large)

print("\n")


print("********||||**Publication Status**||||*********")

fit_published.DOR.DSL <- madauni(NATresult_published)
fit_preprint.DOR.DSL <- madauni(NATresult_preprint)

print("\n")
print("*****DOR peer-reviewed*****")
summary(fit_published.DOR.DSL)
colSums(NATresult_published)

print("\n")
print("*****DOR preprint*****")
summary(fit_preprint.DOR.DSL)
colSums(NATresult_preprint)


######
print(">>>>>>>>>> subgroup analyses ... large COVID19 study <<<<<<")

print("*******||||**METHOD, large COVID19 study**||||******")


fit_COVID19largeLAMP.DOR.DSL <- madauni(NATresult_COVID19largeLAMP)
fit_COVID19largeCRISPR.DOR.DSL <- madauni(NATresult_COVID19largeCRISPR)
fit_COVID19largeIDNow.DOR.DSL <- madauni(NATresult_COVID19largeIDNow)
fit_COVID19large.DOR.DSL <- madauni(NATresult_COVID19large)


fit_COVID19largeLAMP_Crude.DOR.DSL <- madauni(NATresult_COVID19largeLAMP_Crude)
fit_COVID19largeLAMP_Pure.DOR.DSL <- madauni(NATresult_COVID19largeLAMP_Pure)

print("\n")
print("*****COVID19largeLAMP*****")
summary(fit_COVID19largeLAMP.DOR.DSL)
colSums(NATresult_COVID19largeLAMP)

print("\n")
print("*****COVID19largeCRISPR*****")
summary(fit_COVID19largeCRISPR.DOR.DSL)
colSums(NATresult_COVID19largeCRISPR)

print("\n")
print("*****COVID19largeIDNow*****")
summary(fit_COVID19largeIDNow.DOR.DSL)
colSums(NATresult_COVID19largeIDNow)

print("\n")
print("*****COVID19large*****")
summary(fit_COVID19large.DOR.DSL)
colSums(NATresult_COVID19large)

print("\n")
print("*****COVID19largeLAMP_Crude*****")
summary(fit_COVID19largeLAMP_Crude.DOR.DSL)
colSums(NATresult_COVID19largeLAMP_Crude)

print("\n")
print("*****COVID19largeLAMP_Pure*****")
summary(fit_COVID19largeLAMP_Pure.DOR.DSL)
colSums(NATresult_COVID19largeLAMP_Pure)

print("*******||||**Publication status, large COVID19 study**||||******")

fit_COVID19largePubLAMP_Pure.DOR.DSL <- madauni(NATresult_COVID19largePubLAMP_Pure)
fit_COVID19largePreLAMP_Pure.DOR.DSL <- madauni(NATresult_COVID19largePreLAMP_Pure)
fit_COVID19largeLAMP.DOR.DSL <- madauni(NATresult_COVID19largeLAMP)

print("\n")
print("*****COVID19largePub, Pure*****")
summary(fit_COVID19largePubLAMP_Pure.DOR.DSL)
colSums(NATresult_COVID19largePubLAMP_Pure)

print("\n")
print("*****COVID19largePre, Pure*****")
summary(fit_COVID19largePreLAMP_Pure.DOR.DSL)
colSums(NATresult_COVID19largePreLAMP_Pure)





