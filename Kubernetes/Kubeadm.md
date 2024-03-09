# Installing Kubernetes using Kubeadm (On Premisis Server)

1. Create 2 different ec2 server (ubuntu 22) - (t2.medium)
2. Open both the server for cluster connection - switch as root user (sudo su -) on both the machines
3.Install Docker.io
4. sudo swapoff -a
5. sudo apt-get update
6. sudo apt-get install -y apt-transport-https ca-certificates curl gpg
7. curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
8. echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
9. sudo apt-get update
10. sudo apt-get install -y kubelet kubeadm kubectl
11. sudo apt-mark hold kubelet kubeadm kubectl
12. {sometimes, we may face an error because of the different versions we are using, try to follow this steps in order to reconfigure the setup}
--- First, reset your kubeadm cluster by running the reset command and flush your iptables (to avoid any networking issue) kubeadm reset -f 
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X

13. Second, you need to change your Docker cgroup driver to systemd (recommended CRI conf for kubernetes kubelet by default) then restart docker service by using this command
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
14. systemctl daemon-reload
15. systemctl restart docker
16. swapoff -a
17. systemctl start kubelet
18. sudo kubeadm init --pod-network-cidr=10.244.0.0/16 (In Master Node Only)
19. mkdir -p $HOME/.kube
20. sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
21. sudo chown $(id -u):$(id -g) $HOME/.kube/config
22. Now, copy the kubeadm token command from master, and join it to worker node
[command example: kubeadm join 172.31.24.229:6443 --token 6m5tqp.f0sf9sbejh176bk5 \
        --discovery-token-ca-cert-hash sha256:96290dc0e91d839da9e44c76d2390fd572bc6105da4d8b67074c248ea3cdfc6e]
23. run this command (kubectl get nodes) on your master machine to confirm about the joining
24. run this command (kubectl get nodes) on your master machine to confirm about the joining
25. we need to setup the cluster network for in-order to run the status [currently it is in pending status]
26. we are going to bring this flannel network setup on our master machine, run this command (kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml) [this command will be available on the flannel document]
27. now give the command (kubectl get pods --all-namespaces) - as we can see the status changed to ready.
28. run command (kubectl get nodes) - we will be able to see the dns came to running status.
29. to check your version (kubectl version)
    




