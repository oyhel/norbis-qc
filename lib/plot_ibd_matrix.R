#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
genomefile <- args[1]

d = read.table(genomefile, header=T)

pdf(file='ibd_matrix.pdf')
	par(pch=16)
	with(d,plot(Z0,Z1, xlim=c(0,1), ylim=c(0,1), type="n", main="IBD matrix"))

	with(subset(d,RT=="OT") , points(Z0,Z1,col=4))
	with(subset(d,RT=="PO") , points(Z0,Z1,col=2))
	with(subset(d,RT=="UN") , points(Z0,Z1,col=3))

	legend(1,1, xjust=1, yjust=1, legend=levels(d$RT), pch=16, col=c(4,2,3))
dev.off()
