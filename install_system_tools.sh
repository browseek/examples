#!/bin/bash

# Function to install tools on Ubuntu/Debian
install_ubuntu() {
    sudo apt-get update
    sudo apt-get install -y ansible docker.io python3-pip
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
}

# Function to install tools on CentOS/RHEL
install_centos() {
    sudo yum update -y
    sudo yum install -y epel-release
    sudo yum install -y ansible docker python3-pip
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
}

# Function to install tools on Fedora
install_fedora() {
    sudo dnf update -y
    sudo dnf install -y ansible docker python3-pip
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
}

# Function to install tools on macOS
install_macos() {
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null
    then
        echo "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew update
    brew install ansible
    brew install --cask docker
    brew install python3
}

# Detect the operating system
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
elif [ "$(uname)" == "Darwin" ]; then
    OS="macOS"
else
    echo "Unsupported operating system"
    exit 1
fi

# Install tools based on the detected OS
case $OS in
    "Ubuntu"*)
        install_ubuntu
        ;;
    "Debian"*)
        install_ubuntu
        ;;
    "CentOS"*)
        install_centos
        ;;
    "Red Hat Enterprise Linux"*)
        install_centos
        ;;
    "Fedora"*)
        install_fedora
        ;;
    "macOS")
        install_macos
        ;;
    *)
        echo "Unsupported operating system: $OS"
        exit 1
        ;;
esac

echo "Installation of system tools completed!"
echo "Please log out and log back in for group changes to take effect."
