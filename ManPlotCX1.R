library(stats)
library(data.table)
library(ggplot2)
library("gridExtra")
library(plyr)
library(dplyr)
library(qqman)

args = commandArgs(trailingOnly=TRUE)
filename = args[1]
outname = args[2]
thresh = args[3] # default = 5e-7

df <- fread(filename,header=TRUE) 

df<- df[, c("SNP","CHR","BP","P_BOLT_LMM_INF"),with = FALSE] # that or 'P_LINREG'
df<-rename(df,P=P_BOLT_LMM_INF)
snpsOfInterest = df[df$P<thresh]$SNP

mypath <-file.path(paste("manhatanPlot_CardiacGWAS_",outname,".png",sep=""))
png(mypath)#pdf(,width=10,height=12,pointsize = 12)
manhattan(df, highlight = snpsOfInterest)#, annotatePval = 0.005, annotateTop = FALSE)
dev.off()
#
mypath <-file.path(paste("QQPlot_CardiacGWAS_",outname,".png",sep=""))
png(mypath)#pdf(,width=10,height=12,paper='special',pointsize = 10)
qq(df$P, main = "Q-Q plot - GWAS on LVM ")
dev.off()