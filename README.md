# Clustering metrics operator

##### Description

`clustering_metrics` operator returns a set of cluster validation metrics.

##### Usage

Input projection|.
---|---
`row`   | represents the variables
`col`   | represents the observations
`label`   | represents the clusters
`y-axis`| is the value of the measurement

Output relations|.
---|---
`metric`        | character, name of the clustering metric
`value`        | numeric, value of the clustering metric

##### References

This operator is based on the [cluster.stats R function from the fpc package](https://www.rdocumentation.org/packages/fpc/versions/2.2-10/topics/cluster.stats).

##### See Also

[hierarchical_clustering_operator](https://github.com/tercen/hierarchical_clustering_operator), [flowsom_operator](https://github.com/tercen/flowsom_operator), [clusterx_operator](https://github.com/tercen/clusterx_operator)
