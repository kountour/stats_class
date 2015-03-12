babies = read.table("babies.txt", header=TRUE)

bwt.nonsmoke = babies$bwt[babies$smoke==0]
bwt.smoke = babies$bwt[babies$smoke==1]

rep_fun <- function() {
  s_sm = sample(bwt.smoke, 30)
  s_nsm = sample(bwt.nonsmoke, 30)
  t.test(s_sm, s_nsm)$conf.int
}

rep.conf <- replicate(1000, rep_fun())

popdiff = mean(bwt.smoke) - mean(bwt.nonsmoke)
test <- popdiff > rep.conf[1,] & popdiff < rep.conf[2,]

conf.diff <- abs(rep.conf[1,] - rep.conf[2,])
mean_rep <- mean(conf.diff)

power_fun <- function(alpha) {
  s_sm = sample(bwt.smoke, 15)
  s_nsm = sample(bwt.nonsmoke, 15)
  t.test(s_sm, s_nsm)$p.value < alpha
}

alpha <- 0.01
power <- replicate(1000, power_fun(alpha))
mean(power)