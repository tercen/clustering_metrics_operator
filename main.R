suppressPackageStartupMessages({
  library(tercen)
  library(dplyr)
  library(reshape2)
  library(fpc)
})

ctx = tercenCtx()

labs <- ctx %>% 
  select(.ci, .ri) %>%
  mutate(labs = ctx$select(ctx$labels)[[1]]) %>%
  filter(.ri == 0) %>%
  arrange(.ci) %>%
  select(labs)

data <- t(ctx$as.matrix())

cl_stats <- fpc::cluster.stats(data, as.integer(as.factor(labs$labs)), aggregateonly = TRUE)

nulls <- unlist(lapply(cl_stats, is.null))
cl_stats[nulls] <- NA_real_

cl_stats %>%
  as_tibble() %>%
  as_relation() %>%
  as_join_operator(list(), list()) %>%
  save_relation()
