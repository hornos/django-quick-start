name "cluster_server"
description "HPC cluster server"
run_list(
  "recipe[rsyslog::server]"
)
