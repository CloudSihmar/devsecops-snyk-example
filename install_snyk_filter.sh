#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Clone the Snyk Filter repository
echo "Cloning the snyk-filter repository..."
git clone https://github.com/snyk-labs/snyk-filter.git

# Change to the snyk-filter directory
cd snyk-filter

# Update package list and install npm
echo "Updating package list and installing npm..."
sudo apt update -y && sudo apt install -y npm

# Install jq
echo "Installing jq..."
sudo apt-get install -y jq

# Set environment variables for node-jq
echo "Configuring jq for node-jq..."
export NODE_JQ_SKIP_INSTALL_BINARY=true
export JQ_PATH=$(which jq)

# Install snyk-filter globally (requires Node version <= 12)
echo "Installing snyk-filter..."
sudo npm install -g snyk-filter

# List installed snyk-filter package globally to verify
echo "Listing installed snyk-filter..."
npm list -g snyk-filter

echo "Installation complete."
