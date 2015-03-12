babies = read.table("babies.txt", header=TRUE)

bwt.nonsmoke = babies$bwt[babies$smoke==0]
pop.var = var(bwt.nonsmoke)

xyz <- function(n) {
  ns_var <- sample(bwt.nonsmoke, n)
  var(ns_var)
}

vars = replicate(1000, xyz(50))
var_prop <- vars > pop.var*1.5
sum(var_prop)/1000
hist(vars)
abline(v=pop.var, col="blue")
