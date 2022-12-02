if [ -z "$1" ]
  then
    echo "No github token supplied"
    exit
fi
sudo yum -y update
sudo yum -y install python39 python3-pip git sshpass
sudo yum remove python36
pip3 install ansible
pip3 install kubernetes PyYAML jsonpatch jmespath
ansible-galaxy collection install kubernetes.core
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /bin/kubectl
kubectl version --client

git clone https://$1@github.com/mrabbah/gitops
