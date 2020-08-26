library(tercen)
library(dplyr)
library(clusterCrit)

options("tercen.workflowId" = "7eee20aa9d6cc4eb9d7f2cc2430313b6")
options("tercen.stepId"     = "4806ede4-9902-4214-9cb3-e2368bb32351")

ctx = tercenCtx()

labs <- ctx %>% 
  select(.ci, .ri) %>%
  mutate(labs = ctx$select(ctx$labels)[[1]]) %>%
  reshape2::acast(.ci ~ .ri, value.var='labs')
labs <- labs[, 1]

data <- t(ctx$as.matrix())
results <- intCriteria(data, as.integer(labs), c("Davies_Bouldin", "Dunn", "Silhouette", "Calinski_Harabasz"))
# results$.ci <- seq_len(nrow(data)) - 1
results <- data.frame(results)

cTable = tibble(.ci=seq.int(0,ctx$cschema$nRows-1)) %>% mutate(val = results[[1]])
rTable = tibble(.ri=seq.int(0,ctx$rschema$nRows-1)) %>% mutate(val = results[[1]])

cTable %>% full_join(rTable) %>%
  ctx$addNamespace() %>%
  ctx$save() 

results <- ctx$addNamespace(results)
ctx$save(results)

ctx %>% 
  select(.ci, .ri) %>% summarise()
ctx %>% as.matrix %>% t %>% as_tibble

