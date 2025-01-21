#!/bin/bash 
# Install OpenJDK 11 Jdk 
sudo apt install -y openjdk-11-jdk

# Install OpenJDK 17 JRE Headless 
sudo apt install openjdk-17-jre-headless -y 

# Download Jenkins GPG key 
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key 

# Add Jenkins repository to package manager sources 
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null 

# Update package manager repositories 
sudo apt-get update 

# Install Jenkins 
sudo apt-get install jenkins -y

sudo systecmctl start jenkins.service

sudo systemctl enable jenkins

sudo ufw allow 8080

sudo ufw reload

# then install git
sudo apt install git -y

# add HashiCorp’s official GPG key

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add the HashiCorp repository 

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update your APT package 

sudo apt update -y 

# Install Terraform using apt

sudo apt install terraform -y

#finally install kubectl

sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl

sudo chmod +x ./kubectl

sudo mkdir -p $HOME/bin
sudo cp ./kubectl $HOME/bin/kubectl

# Add $HOME/bin to your PATH permanently

echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

source ~/.bashrc

kubectl version --client

