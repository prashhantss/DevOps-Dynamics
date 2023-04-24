#!/bin/bash

# Update the package manager
sudo yum update -y

# Install Docker
sudo yum install -y docker

# Start the Docker service
sudo systemctl start docker

# Enable the Docker service to start at boot
sudo systemctl enable docker

# Install kubeadm, kubelet, and kubectl
sudo yum install -y kubelet kubeadm kubectl

# Initialize the master node
sudo kubeadm init --pod-network-cidr=192.168.0.0/16

# Set up the Kubernetes configuration for the current user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Install a pod network add-on (Flannel)
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# Print out the kubeadm join command for worker nodes
echo "To join worker nodes to the cluster, run the following command:"
sudo kubeadm token create --print-join-command
