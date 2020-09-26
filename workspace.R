library(tercen)
library(dplyr)
library(reshape2)
library(clusterCrit)

options("tercen.workflowId" = "7eee20aa9d6cc4eb9d7f2cc2430313b6")
options("tercen.stepId"     = "4806ede4-9902-4214-9cb3-e2368bb32351")

ctx = tercenCtx()

labs <- ctx %>% 
  select(.ci, .ri) %>%
  mutate(labs = ctx$select(ctx$labels)[[1]]) %>%
  acast(.ci ~ .ri, value.var = 'labs')

data <- t(ctx$as.matrix())
results <- intCriteria(
  data, as.integer(labs[, 1]),
  c("Davies_Bouldin", "Dunn", "Silhouette", "Calinski_Harabasz")
)
results <- data.frame(metric = names(results), value = unlist(results))

table <- tercen::dataframe.as.table(ctx$addNamespace(results))
table$properties$name <- 'clustering_metrics'
table$columns[[1]]$type = 'character'
table$columns[[2]]$type = 'double'

relation <- SimpleRelation$new()
relation$id <- table$properties$name

join <- JoinOperator$new()
join$rightRelation <- relation

result <- OperatorResult$new()
result$tables <- list(table)
result$joinOperators <- list(join)

ctx$save(result) 
