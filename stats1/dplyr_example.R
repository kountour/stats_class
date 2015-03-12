library(dplyr)

dat <- read.csv("msleep_ggplot2.csv")

dat %>%
  mutate(proportion = sleep_rem / sleep_total) %>%
  group_by(order) %>%
  summarise(median=median(proportion)) %>%
  arrange(median) %>%
  head


