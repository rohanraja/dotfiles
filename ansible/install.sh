#!/bin/bash

# Install required packages for Ansible
if [[ $(uname -s) == "Linux" ]]; then
    if command -v apt-get &>/dev/null; then
        sudo apt-get update
        sudo apt-get install -y software-properties-common
        sudo apt-add-repository --yes --update ppa:ansible/ansible
        sudo apt-get install -y ansible
    elif command -v yum &>/dev/null; then
        sudo yum install -y epel-release
        sudo yum install -y ansible
    else
        echo "Unsupported package manager. Please install Ansible manually."
        exit 1
    fi
elif [[ $(uname -s) == "Darwin" ]]; then
    if command -v brew &>/dev/null; then
        brew update
        brew install ansible
    else
        echo "Homebrew not found. Please install Ansible manually."
        exit 1
    fi
else
    echo "Unsupported operating system. Please install Ansible manually."
    exit 1
fi
