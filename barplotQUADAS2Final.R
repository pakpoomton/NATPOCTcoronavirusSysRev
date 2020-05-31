# source https://rdrr.io/rforge/DiagnosisMed/man/QA.plot.html 

library(ggplots)

ramp <- colorRamp(c("darkgreen", "white"))
setwd("/Users/pakpoomton/Desktop/Career_Research/COVID19Diagnosis/")
demoQUADAS2 <- read.csv(file='finalNATQUADAS2.csv',sep=',',header=T)

attr(demoQUADAS2, "var.labels") <- c("Study unique ID", "Patient selection",
                                "Index test", "Reference standard",
                                "Flow and timing", "Patient selection-applicability",
                                "Index test-applicability", "Reference standard-applicability")

# Making a table with the classification proportions  - risk of bias
tabtmpDEMO1 <- sapply(4:7, function(i) prop.table(table(factor(demoQUADAS2 [, i], levels = c('Low', 'Unclear', 'High')))))
colnames(tabtmpDEMO1) <- c("Patient selection", "Index test", "Reference standard", "Flow and timing")

tabtmpDEMO1n <- sapply(4:7, function(i) (table(factor(demoQUADAS2 [, i], levels = c('Low', 'Unclear', 'High')))))
tabtmpDEMO2n <- sapply(8:10, function(i) (table(factor(demoQUADAS2 [, i], levels = c('Low', 'Unclear', 'High')))))



par(mar = c(4.1, 13.1, 2.1, 6.1), mfrow = c(2, 1))

# Calling the superior plot
barplot(tabtmpDEMO1, horiz = TRUE, cex.names = .9,
        xlab = 'Proportion of studies with low, high \n or unclear risk of bias',
        cex.lab = .9, las = 1, legend.text = FALSE, col = rgb(ramp(seq(0, 1, length = 3)),
                                                              max = 255))

# Making a table with the classification proportions  - applicability
tabtmpDEMO2 <- sapply(8:10, function(i) prop.table(table(factor(demoQUADAS2 [, i], levels = c('Low', 'Unclear', 'High')))))
colnames(tabtmpDEMO2) <- c("Patient selection - applicability",
                      "Index test  - applicability", "Reference standard - applicability")


# Calling the inferior window plot
barplot(tabtmpDEMO2, legend.text = rownames(tabtmpDEMO1), horiz = TRUE, cex.names = .9,
        args.legend = list(x = 'top', inset = -.4, xpd = NA, horiz = TRUE, cex = .6),
        xlab = 'Proportion of studies with low, high, or unclear \n concerns regarding applicability',
        cex.lab = .9, las = 1, space = 1,
        col = rgb(ramp(seq(0, 1, length = 3)), max = 255))


