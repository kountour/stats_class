load("skew.RData")

par(mfrow = c(3,3))

for (i in 1:9) {
  qqnorm(dat[1:1000,i])
}