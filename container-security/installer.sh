#!/bin/bash
echo ""
echo "Container Security Installer"
echo ""
echo "Installing Figlet"
echo ""
apt install figlet -y
echo ""
echo "Installing Trivy"
wget https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.deb
dpkg -i trivy_0.18.3_Linux-64bit.deb
echo ""
echo "Installing Dive"
wget https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb
apt install ./dive_0.9.2_linux_amd64.deb
echo ""
echo "Installing Inspec"
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
echo ""
echo "Activate Lisence by launching inspec and type in yes"
echo ""
echo "Installing Grype"
curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin
echo ""
echo "Installing Syft"
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin
echo ""
echo "Installing Docker Bench Security"
git clone https://github.com/docker/docker-bench-security.git
echo ""
echo "Installing Falco"(Optional)
curl -fsSL https://falco.org/repo/falcosecurity-packages.asc | sudo gpg --dearmor -o /usr/share/keyrings/falco-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/falco-archive-keyring.gpg] https://download.falco.org/packages/deb stable main" | sudo tee -a /etc/apt/sources.list.d/falcosecurity.list
apt-get update -y
apt install -y dkms make linux-headers-$(uname -r)
# If you use the falco-driver-loader to build the BPF probe locally you need also clang toolchain
apt install -y clang llvm
# You can install also the dialog package if you want it
#sudo apt install -y dialog
sudo apt-get install -y falco
echo ""
echo "Install Jfrog Xray"(Optional)
#curl -fL "https://getcli.jfrog.io?setup" | sh 
#Log in with Browser
#Scan using (jf docker scan <image name>:<image tag>  )

                     


