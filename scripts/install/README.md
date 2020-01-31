# Script to install a Kubernetes Cluster with nodes in Ubuntu 18.04 Bionic Beaver
## Instructions
1. Clone the repository
`git clone https://github.com/DBigCloud/Kubernetes.git`
2. Set execute permission to the script
`chmod +x chmod +x Kubernetes/scripts/install/install.sh`
3. Go to the script folder
`cd Kubernetes/scripts/install/`
4. Install a master: Run this script in the master.\
`./install.sh -m || --master`
5. Get the discovery-token-ca-cert-hash from the master
6. Install a node: Run this script for each node, **Set a different name for each node** and the **master IP, HASH and discovery-token-ca-cert-hash**\
`./install.sh -n NODE-NAME 192.168.1.1 adergk6.khj016e179rnmbas sdadsaddsdds14s5d46sd2a1sd3a5sd46a5sd4a2sdas5d4asd`
7. For help: \
`./install.sh -h || --help`
