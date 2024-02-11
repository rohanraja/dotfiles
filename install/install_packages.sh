#!/bin/bash

# File containing the list of packages to install
PACKAGES_FILE="install/packages.txt"

# Function to install packages on Ubuntu
install_ubuntu() {
	echo "Detected Ubuntu. Installing packages..."
	sudo apt-get update
	while IFS= read -r package; do
		sudo apt-get install -y "$package"
	done <"$PACKAGES_FILE"
}

# Function to install packages on macOS
install_macos() {
	echo "Detected macOS. Installing packages..."
	while IFS= read -r package; do
		brew install "$package"
	done <"$PACKAGES_FILE"
}

# Detect the operating system
OS="$(uname -s)"
case "$OS" in
Linux*) OS_TYPE="Linux" ;;
Darwin*) OS_TYPE="Mac" ;;
*) OS_TYPE="UNKNOWN" ;;
esac

# Call the appropriate function based on the detected OS
if [ "$OS_TYPE" = "Linux" ]; then
	install_ubuntu
elif [ "$OS_TYPE" = "Mac" ]; then
	install_macos
else
	echo "Unsupported OS."
fi
