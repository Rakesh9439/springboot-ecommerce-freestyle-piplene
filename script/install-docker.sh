
#!/bin/bash

set -e

echo "======================================"
echo "   Docker Stable Installation Started"
echo "======================================"

# Step 1: Check Ubuntu
if [ ! -f /etc/os-release ]; then
    echo "OS information not found!"
    exit 1
fi

. /etc/os-release

if [ "$ID" != "ubuntu" ]; then
    echo "This script supports Ubuntu only."
    exit 1
fi

echo "Ubuntu Version: $VERSION"
echo "Ubuntu Codename: $VERSION_CODENAME"

# Step 2: Update packages
echo "Updating Ubuntu packages..."
sudo apt update

# Step 3: Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y ca-certificates curl

# Step 4: Create keyrings directory
echo "Creating Docker keyrings directory..."
sudo install -m 0755 -d /etc/apt/keyrings

# Step 5: Download Docker official GPG key
echo "Downloading Docker GPG key..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
-o /etc/apt/keyrings/docker.asc

sudo chmod a+r /etc/apt/keyrings/docker.asc

# Step 6: Add Docker Stable Repository
echo "Adding Docker Stable Repository..."

sudo tee /etc/apt/sources.list.d/docker.sources > /dev/null <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: ${UBUNTU_CODENAME:-$VERSION_CODENAME}
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Step 7: Update APT repository
echo "Updating Docker repository..."
sudo apt update

# Step 8: Install Docker Stable packages
echo "Installing Docker Engine Stable..."

sudo apt install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin

# Step 9: Enable and start Docker
echo "Enabling Docker service..."
sudo systemctl enable docker

echo "Starting Docker service..."
sudo systemctl start docker

# Step 10: Verify Docker installation
echo "Checking Docker version..."
sudo docker --version

echo "Checking Docker Compose version..."
sudo docker compose version

# Step 11: Check Docker service
sudo systemctl status docker --no-pager

# Step 12: Test Docker
echo "Running Docker Hello World..."
sudo docker run hello-world

echo "======================================"
echo " Docker Stable Installation Completed"
echo "======================================"

#!/bin/bash

set -e

echo "======================================"
echo "   Docker Stable Installation Started"
echo "======================================"

# Step 1: Check Ubuntu
if [ ! -f /etc/os-release ]; then
    echo "OS information not found!"
    exit 1
fi

. /etc/os-release

if [ "$ID" != "ubuntu" ]; then
    echo "This script supports Ubuntu only."
    exit 1
fi

echo "Ubuntu Version: $VERSION"
echo "Ubuntu Codename: $VERSION_CODENAME"

# Step 2: Update packages
echo "Updating Ubuntu packages..."
sudo apt update

# Step 3: Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y ca-certificates curl

# Step 4: Create keyrings directory
echo "Creating Docker keyrings directory..."
sudo install -m 0755 -d /etc/apt/keyrings

# Step 5: Download Docker official GPG key
echo "Downloading Docker GPG key..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
-o /etc/apt/keyrings/docker.asc

sudo chmod a+r /etc/apt/keyrings/docker.asc

# Step 6: Add Docker Stable Repository
echo "Adding Docker Stable Repository..."

sudo tee /etc/apt/sources.list.d/docker.sources > /dev/null <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: ${UBUNTU_CODENAME:-$VERSION_CODENAME}
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Step 7: Update APT repository
echo "Updating Docker repository..."
sudo apt update

# Step 8: Install Docker Stable packages
echo "Installing Docker Engine Stable..."

sudo apt install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin

# Step 9: Enable and start Docker
echo "Enabling Docker service..."
sudo systemctl enable docker

echo "Starting Docker service..."
sudo systemctl start docker

# Step 10: Verify Docker installation
echo "Checking Docker version..."
sudo docker --version

echo "Checking Docker Compose version..."
sudo docker compose version

# Step 11: Check Docker service
sudo systemctl status docker --no-pager

# Step 12: Test Docker
echo "Running Docker Hello World..."
sudo docker run hello-world

echo "======================================"
echo " Docker Stable Installation Completed"
echo "======================================"
