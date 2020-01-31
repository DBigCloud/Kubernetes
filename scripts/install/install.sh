#!/bin/bash
# Scripts for install a Kubernetes cluster with 3 Nodes in Ubuntu 18.

IsMaster=0

if [ $# -gt 0 ]
then
    if [ "$1" == "-n" ] || [ "$1" == "--node" ]
    then
    	if [ $# -eq 2 ]
    	then
    		IsMaster=0
    		TOKEN=$2
    		echo "is a Node $IsMaster"
    	else
    		echo "You need pass the discovery-token-ca-cert-hash getting from the master node"
    		echo "Example: ./install.sh -n sdadsaddsdds14s5d46sd2a1sd3a5sd46a5sd4a2sdas5d4asd"
    		exit 0
    	fi
    elif [ "$1" == "-m" ] || [ "$1" == "--master" ]
    then
    	IsMaster=1
    	echo "is a Master $IsMaster"
    elif [ "$1" == "-h" ] || [ "$1" == "--help" ]
    then
    	echo "** Instructions **"
    	echo "1 - Install a master: ./install.sh -m||--master"
    	echo "2 - Get the the discovery-token-ca-cert-hash from the master"
    	echo "3 - Install a node ./install.sh -n sdadsaddsdds14s5d46sd2a1sd3a5sd46a5sd4a2sdas5d4asd"
    	exit 0
    else
    	echo "install.sh [-n|--node or -m|--master]"
    	exit 0
    fi
else
	echo "install.sh [-n|--node + TOKEN or -m|--master]"
	exit 0
fi


#Get the Docker gpg key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Add the Docker repository:
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#Get the Kubernetes gpg key:
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

#Add the Kubernetes repository:
cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

#Update your packages:
sudo apt-get update

#Install Docker, kubelet, kubeadm, and kubectl, last version:
sudo apt-get install -y docker-ce kubelet kubeadm kubectl

#Hold them at the current version:
sudo apt-mark hold docker-ce kubelet kubeadm kubectl

#Add the iptables rule to sysctl.conf:
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf

#Enable iptables immediately:
sudo sysctl -p

#Initialize the cluster (run only on the master):
if [ $IsMaster -eq 1 ]
then
	sudo kubeadm init --pod-network-cidr=10.244.0.0/16
fi

#Set up local kubeconfig:
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#Apply Flannel CNI network overlay:
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

#Join the worker nodes to the cluster:
if [ $IsMaster -eq 0 ]
then
  sudo kubeadm join $TOKEN
fi

#Verify the worker nodes have joined the cluster successfully:
kubectl get nodes


