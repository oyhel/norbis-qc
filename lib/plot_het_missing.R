#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)

het_file <- args[1]
imiss_file <- args[2]
het_failed_out <- args[3]

het=read.table(het_file,header=T)
mis=read.table(imiss_file,header=T)
het$HET_RATE=(het$"N.NM."-het$"O.HOM.")/het$"N.NM."

pdf(file='het_vs_missingness.pdf')
   plot(het$HET_RATE,mis$N_MISS,ylab="Number of Missing SNPs per Ind",xlab="Heterozygocity Rate")
   abline(v= mean(het$HET_RATE)+2*sd(het$HET_RATE), col="red")
dev.off()
                 
het_fail=subset(het,(het$HET_RATE>mean(het$HET_RATE)+2*sd(het$HET_RATE)))
het_fail$HET_DST=(het_fail$HET_RATE-mean(het$HET_RATE))/sd(het$HET_RATE)

write.table(het_fail,het_failed_out,row.names=F,quote=F)
