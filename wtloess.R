## WTLOESS.R --- read in the 2014 WT map
## 2014-05-28
setwd("/Michael.REBER/WORK/EGLEN WILLSHAW/LOO mapping R")
dat <- read.csv('WT map 2014bis.csv', skip=1)

x <- dat[,1]
y <- dat[,2]
pdf(file='wtloess.pdf')
plot(x, y, xlim=c(0,100), ylim=c(0,100), pch=20,cex=1, bty='n',cex.axis=1.5,
     xlab='retinal axis', ylab='collicular axis',main='WT map', las=1, cex.lab=1.5, cex.axis=1.5)
## default for f is 2/3
##f <- 1/10
f <- 2/3
l <- lowess(x, y, f=f)
lines(l)


## LOO
npts <- length(x)
for (i in 1:npts) {
  l2 <- lowess(x[-i], y[-i], f=f)
  lines(l2, col='grey')
}
lines(l, lwd='2')
dev.off()
