#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
mds_file <- args[1]
pops_file <- args[2]

mds <- read.table(file = mds_file, header = T)
pops <- read.table(file = pops_file, header = T)

# merge mds with population info
m <- merge(mds, pops, by=c('FID','IID'))

palette(rainbow(length(levels(m$population))))

pdf(file='mds_2dplot.pdf')
	par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
	plot(m$C1, 
		m$C2, 
		col=m$population, 
		xlab="Component 1", 
		ylab="Component 2", 
		main="MDS plot C1 vs. C2 HapMap")
	legend("topright",
		inset=c(-0.2,0), 
		legend=levels(m$population), 
		col=as.numeric(levels(as.factor(as.numeric(m$population)))), 
		pch = 16)
dev.off()
