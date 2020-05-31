library(forestplot)



#### methods
cochrane_meta <- data.frame(
  coef = c(NA, 6.139, 7.407, 4.598, 7.46,  5.42,  6.100), 
  low =  c(NA, 5.089, 5.331, 3.277, 4.58,  1.37,  5.277), 
  high = c(NA, 7.189, 9.484, 5.918, 10.70, 9.46,  6.923))

tabletext<-cbind( c("Method", "RT-LAMP","CRISPR","ID Now", "RT-iiPCR","RCA", "Summary" ), 
                  c("NO. of Studies", "18", "3", "3", "1", "1", "26"),
                  c("NO. of Samples (+/-)", "2413(670/1743)", "213(104/109)", "414(299/115)", "103(52/51)", "14(7/7)", "3157(1132/2025)")) 

forestplot(tabletext, cochrane_meta, new_page = TRUE,
           is.summary=c(TRUE, rep(FALSE,5), TRUE),
           #clip=c(-1.00,1.00), xlog=F, 
           xticks = c(0,2,4,6,8,10,12),
           graphwidth = unit(3.5, 'cm'),
           txt_gp = fpTxtGp(ticks=gpar(cex=1)),
           lineheight = unit(1,'cm'),
           col=fpColors(box="royalblue",line="darkblue", summary="royalblue"))

########


#### diseases
cochrane_meta <- data.frame(
  coef = c(NA, 5.163, 6.294, 6.232, 6.100), 
  low  = c(NA, 3.322, 3.097, 5.273, 5.277), 
  high = c(NA, 7.004, 9.490, 7.192, 6.923))

tabletext<-cbind( c("Disease", "SARS","MERS","COVID-19", "Summary" ), 
                  c("NO. of Studies", "2", "3", "21", "26"),
                  c("NO. of Samples (+/-)", "192(44/148)", "112(59/53)", "2853(1029/1824)", "3157(1132/2025)")) 

forestplot(tabletext, cochrane_meta, new_page = TRUE,
           is.summary=c(TRUE, rep(FALSE,3), TRUE),
           #clip=c(-1.00,1.00), xlog=F, 
           txt_gp = fpTxtGp(ticks=gpar(cex=1)),
           lineheight = unit(1,'cm'),
           xticks = c(0,2,4,6,8,10,12),
           graphwidth = unit(3.5, 'cm'),
           col=fpColors(box="royalblue",line="darkblue", summary="royalblue"))


###########


library(forestplot)





#### sample size
cochrane_meta <- data.frame(
  coef = c(NA, 5.005, 6.410, 6.100), 
  low  = c(NA, 3.546, 5.412, 5.277), 
  high = c(NA, 6.464, 7.408, 6.923))

tabletext<-cbind( c("Sample size", "less than 10","at least 10", "Summary" ), 
                  c("NO. of Studies", "7", "19", "26"),
                  c("NO. of Samples (+/-)", "146(63/83)", "3011(1069/1942)", "3157(1132/2025)")) 

forestplot(tabletext, cochrane_meta, new_page = TRUE,
           is.summary=c(TRUE, rep(FALSE,2), TRUE),
           #clip=c(-1.00,1.00), xlog=F, 
           txt_gp = fpTxtGp(ticks=gpar(cex=1)),
           lineheight = unit(1,'cm'),
           xticks = c(0,2,4,6,8,10,12),
           graphwidth = unit(3.5, 'cm'),
           col=fpColors(box="royalblue",line="darkblue", summary="royalblue"))


####




#### publication status
cochrane_meta <- data.frame(
  coef = c(NA, 5.943, 6.131, 6.100), 
  low  = c(NA, 5.012, 4.929, 5.277), 
  high = c(NA, 6.874, 7.333, 6.923))

tabletext<-cbind( c("Pub. status", "peer-reviewed","preprint", "Summary" ), 
                  c("NO. of Studies", "11", "15", "26"),
                  c("NO. of Samples (+/-)", "766(276/490)", "2391(856/1535)", "3157(1132/2025)")) 

forestplot(tabletext, cochrane_meta, new_page = TRUE,
           is.summary=c(TRUE, rep(FALSE,2), TRUE),
           #clip=c(-1.00,1.00), xlog=F, 
           txt_gp = fpTxtGp(ticks=gpar(cex=1)),
           lineheight = unit(1,'cm'),
           xticks = c(0,2,4,6,8,10,12),
           graphwidth = unit(3.5, 'cm'),
           col=fpColors(box="royalblue",line="darkblue", summary="royalblue"))






#### large, COVID19

#method
library(forestplot)


cochrane_meta <- data.frame(
  coef = c(NA, 6.600, 8.048,  4.598, 6.402), 
  low  = c(NA, 5.236, 5.628,  3.277, 5.313), 
  high = c(NA, 7.964, 10.468, 5.918, 7.490))

tabletext<-cbind( c("Method", "RT-LAMP","CRISPR", "ID Now", "Summary" ), 
                  c("NO. of Studies", "12", "2", "3", "17"),
                  c("NO. of Samples (+/-)", "2179 (595/1584)", "196(92/104)", "414(299/115)", "2789(986/1803)")) 

forestplot(tabletext, cochrane_meta, new_page = TRUE,
           is.summary=c(TRUE, rep(FALSE,3), TRUE),
           #clip=c(0.00,11), xlog=F, 
           txt_gp = fpTxtGp(ticks=gpar(cex=1)),
           lineheight = unit(1,'cm'),
           xticks = c(0,2,4,6,8,10,12),
           graphwidth = unit(3.5, 'cm'),
           col=fpColors(box="royalblue",line="darkblue", summary="royalblue"))

#.....
#pub status
library(forestplot)


cochrane_meta <- data.frame(
  coef = c(NA, 8.279,  6.317, 6.600), 
  low  = c(NA, 5.851,  4.832, 5.236), 
  high = c(NA, 10.706, 7.802, 7.964))

tabletext<-cbind( c("Pub. status", "peer-reviewed","preprint", "Summary" ), 
                  c("NO. of Studies", "2", "10", "12"),
                  c("NO. of Samples (+/-)", "284(72/212)", "1895(523/1372)", "2179(595/1584)")) 

forestplot(tabletext, cochrane_meta, new_page = TRUE,
           is.summary=c(TRUE, rep(FALSE,2), TRUE),
           #clip=c(0.00,11), xlog=F, 
           txt_gp = fpTxtGp(ticks=gpar(cex=1)),
           lineheight = unit(1,'cm'),
           xticks = c(0,2,4,6,8,10,12),
           graphwidth = unit(3.5, 'cm'),
           col=fpColors(box="royalblue",line="darkblue", summary="royalblue"))



####### New large COVID-19 method plot ######

library(forestplot)
cochrane_meta <- data.frame(
  coef = c(NA, 6.91, 5.14, 8.048,  4.598, 6.402), 
  low  = c(NA, 5.32, 3.20, 5.628,  3.277, 5.313), 
  high = c(NA, 8.51, 7.07, 10.468, 5.918, 7.490))

tabletext<-cbind( c("Method", "RT-LAMP(pure)", "RT-LAMP(crude)","CRISPR", "ID Now", "Summary" ), 
                  c("NO. of Studies", "10", "2", "2", "3", "17"),
                  c("NO. of Samples (+/-)", "1939(436/1503)", "240(159/81)", "196(92/104)", "414(299/115)", "2789(986/1803)")) 

forestplot(tabletext, cochrane_meta, new_page = TRUE,
           is.summary=c(TRUE, rep(FALSE,4), TRUE),
           #clip=c(0.00,11), xlog=F, 
           txt_gp = fpTxtGp(ticks=gpar(cex=1)),
           lineheight = unit(1,'cm'),
           xticks = c(0,2,4,6,8,10,12),
           graphwidth = unit(3.5, 'cm'),
           col=fpColors(box="royalblue",line="darkblue", summary="royalblue"))




#### new pub stat plot

#pub status
library(forestplot)



cochrane_meta <- data.frame(
  coef = c(NA, 8.28,   6.62,  6.91), 
  low  = c(NA, 5.85,   4.81,  5.32), 
  high = c(NA, 10.71,  8.43,  8.51))

tabletext<-cbind( c("Pub. status", "peer-reviewed","preprint", "Summary" ), 
                  c("NO. of Studies", "2", "8", "10"),
                  c("NO. of Samples (+/-)", "284(72/212)", "1655(364/1291)", "1939(436/1503)")) 

forestplot(tabletext, cochrane_meta, new_page = TRUE,
           is.summary=c(TRUE, rep(FALSE,2), TRUE),
           #clip=c(0.00,11), xlog=F, 
           txt_gp = fpTxtGp(ticks=gpar(cex=1)),
           lineheight = unit(1,'cm'),
           xticks = c(0,2,4,6,8,10,12),
           graphwidth = unit(3.5, 'cm'),
           col=fpColors(box="royalblue",line="darkblue", summary="royalblue"))


