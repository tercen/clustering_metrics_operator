# Clustering metrics operator

##### Description

`clustering_metrics` operator returns clustering metrics.

##### Usage

Input projection|.
---|---
`row`   | represents the variables
`col`   | represents the observations
`label`   | represents the clusters
`y-axis`| is the value of the measurement

Output relations|.
---|---
`metrics`        | character, name of the clustering metric
`value`        | numeric, value of the clustering metric

##### References

This operator is based on the [clusterCrit R function](https://www.rdocumentation.org/packages/clusterCrit/versions/1.2.8/topics/clusterCrit).

##### See Also

[hierarchical_clustering_operator](https://github.com/tercen/hierarchical_clustering_operator), [flowsom_operator](https://github.com/tercen/flowsom_operator), [clusterx_operator](https://github.com/tercen/clusterx_operator)
