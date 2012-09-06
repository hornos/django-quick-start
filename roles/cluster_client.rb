name "cluster_client"
description "HPC cluster client"
run_list(
  "recipe[rsyslog::client]"
)
