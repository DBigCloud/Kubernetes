# Script to install a Kubernetes Cluster with nodes in Ubuntu 18.04 Bionic Beaver
## Instructions
1. Clone the repository
`git clone https://github.com/DBigCloud/Kubernetes.git`
2. Set execute permission to the script
`chmod +x Kubernetes/scripts/install/install.sh`
3. Go to the script folder
`cd Kubernetes/scripts/install/`
4. Install a master: Run this script in the master.\
`./install.sh -m || --master`
5. Get IP, HASH and the discovery-token-ca-cert-hash from the master
6. Install a node: Run this script for each node, **set a different name for each node, the master IP, HASH and discovery-token-ca-cert-hash**\
![Alt text](img/master.png?raw=true "Master")
`./install.sh -n kubernetes-node01 192.168.1.1 v320m9.x4lb0hayszu6n9fo sha256:3c32be01539a52f642bb664b1a85dbca619bb82459bb24514f0c203fa786623b`
7. For help: \
`./install.sh -h || --help`
8. Check the cluster
`kubectl get nodes`\
![Alt text](img/nodes.png?raw=true "Check the cluste")


