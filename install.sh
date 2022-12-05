if [ -z "$1" ]
  then
    echo "No github token supplied"
    exit
fi
sudo yum -y update
sudo yum -y install python39 python3-pip git sshpass tar
sudo yum -y remove python36
pip3 install ansible
pip3 install kubernetes PyYAML jsonpatch jmespath
ansible-galaxy collection install kubernetes.core
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /bin/kubectl
kubectl version --client
rm -f kubectl
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
curl https://get.helm.sh/helm-v3.10.2-linux-amd64.tar.gz > helm-v3.10.2-linux-amd64.tar.gz
tar -zxvf helm-v3.10.2-linux-amd64.tar.gz 
sudo mv linux-amd64/helm /usr/local/bin/helm
rm -Rf linux-amd64
git clone https://$1@github.com/mrabbah/gitops
