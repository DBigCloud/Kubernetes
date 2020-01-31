# Script to install a Kubernetes Cluster with nodes in Ubuntu 18.04 Bionic Beaver
## Instructions
1. Install a master: Run this script in the master.\
`./install.sh -m || --master`
2. Get the discovery-token-ca-cert-hash from the master
3. Install a node: Run this script for each node, **use the discovery-token-ca-cert-hash**\
`./install.sh -n sdadsaddsdds14s5d46sd2a1sd3a5sd46a5sd4a2sdas5d4asd`
4. For help: \
`./install.sh -h || --help`
