
#!/bin/bash

set -e

echo "=================================="
echo "   JDK 21 Installation Started"
echo "=================================="

# Step 1: Update Ubuntu packages
echo "Updating packages..."
sudo apt update

# Step 2: Install OpenJDK 21
echo "Installing JDK 21..."
sudo apt install openjdk-21-jdk -y

# Step 3: Configure JAVA_HOME
echo "Configuring JAVA_HOME..."

JAVA_HOME_PATH=$(dirname "$(dirname "$(readlink -f "$(command -v javac)")")")

echo "export JAVA_HOME=$JAVA_HOME_PATH" | sudo tee /etc/profile.d/java.sh
echo 'export PATH=$JAVA_HOME/bin:$PATH' | sudo tee -a /etc/profile.d/java.sh

# Step 4: Load environment variables
source /etc/profile.d/java.sh

# Step 5: Verify installation
echo "=================================="
echo "JDK Installation Verification"
echo "=================================="

java -version
javac -version

echo "JAVA_HOME: $JAVA_HOME"

echo "=================================="
echo "   JDK 21 Installed Successfully!"
echo "=================================="
