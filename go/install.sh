
#!/bin/bash

# Specify the Go version
GO_VERSION="1.20.1"

# Determine OS platform (Linux, Darwin etc.)
OS="$(uname -s)"

# Determine architecture (amd64, arm64, etc.)
ARCH="$(uname -m)"

# Map common uname output to Golang's architecture names
case "$ARCH" in
    x86_64) ARCH="amd64" ;;
    arm64) ARCH="arm64" ;;
    aarch64) ARCH="arm64" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Define Go installation directory
INSTALL_DIR="$HOME/.local"

# Define Go download URL
URL="https://go.dev/dl/go${GO_VERSION}.${OS,,}-${ARCH}.tar.gz"

# Create installation directory if it does not exist
mkdir -p "$INSTALL_DIR"

# Function to install Go
install_go() {
    echo "Downloading Go ${GO_VERSION} for ${OS}-${ARCH}..."
    curl -L "$URL" | tar -xz -C "$INSTALL_DIR"

    # Setup environment variables
    echo "Configuring environment variables..."
    {
        echo '# Go configuration'
        echo "export GOROOT=${INSTALL_DIR}/go"
        echo "export GOPATH=${HOME}/go"
        echo "export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin"
    } >> "$HOME/.profile"

    # Source .profile to update current session
    source "$HOME/.profile"

    echo "Go installation is complete."
}

# Check if Go is already installed
if [ -x "$(command -v go)" ]; then
    INSTALLED_VERSION="$(go version | awk '{print $3}')"
    if [ "go${GO_VERSION}" == "$INSTALLED_VERSION" ]; then
        echo "Go ${GO_VERSION} is already installed."
    else
        echo "Go version $INSTALLED_VERSION is currently installed. Installing Go ${GO_VERSION} instead."
        install_go
    fi
else
    install_go
fi

