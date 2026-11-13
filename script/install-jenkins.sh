
#!/bin/bash

set -e

echo "===================================="
echo "   Jenkins LTS Installation Started"
echo "===================================="

# Step 1: Update Ubuntu
echo "Updating Ubuntu packages..."
sudo apt update

# Step 2: Install prerequisites and Java 21
echo "Installing prerequisites..."
sudo apt install -y wget ca-certificates fontconfig openjdk-21-jre

# Step 3: Create keyrings directory
echo "Creating keyrings directory..."
sudo mkdir -p /etc/apt/keyrings

# Step 4: Download Jenkins LTS signing key
echo "Downloading Jenkins LTS key..."
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Step 5: Add Jenkins LTS repository
echo "Adding Jenkins LTS repository..."
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Step 6: Update package index
echo "Updating repository..."
sudo apt update

# Step 7: Install Jenkins
echo "Installing Jenkins LTS..."
sudo apt install -y jenkins

# Step 8: Enable Jenkins service
echo "Enabling Jenkins service..."
sudo systemctl enable jenkins

# Step 9: Start Jenkins service
echo "Starting Jenkins..."
sudo systemctl start jenkins

# Step 10: Verify Jenkins
echo "Checking Jenkins status..."
sudo systemctl status jenkins --no-pager

echo "===================================="
echo " Jenkins LTS Installation Completed"
echo "===================================="

echo "Jenkins URL: http://localhost:8080"

echo "Initial Admin Password Command:"
echo "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
