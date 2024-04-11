#!/bin/zsh

# Define Go version
GO_VERSION="1.22.2"

# Download URL for Go binary for ARM macOS
GO_URL="https://golang.org/dl/go${GO_VERSION}.darwin-arm64.tar.gz"

# Installation directory
INSTALL_DIR="$HOME/go"

# Create the installation directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Download Go binary using curl
echo "Downloading Go binary for ARM macOS..."
curl -L "$GO_URL" | tar -xz -C "$INSTALL_DIR" --strip-components=1

# Setup environment variables in .zshrc if using Zsh
echo "Setting up Go environment variables in .zshrc..."

# Check if GOROOT is already set in .zshrc and add it if not
if ! grep -q "export GOROOT=" "$HOME/.zshrc"; then
    echo "export GOROOT=${INSTALL_DIR}" >> "$HOME/.dotfiles/go/environment.zsh"
fi

# Check if GOPATH is already set in .zshrc and add it if not
if ! grep -q "export GOPATH=" "$HOME/.zshrc"; then
    echo "export GOPATH=\$HOME/go" >> "$HOME/.dotfiles/go/environment.zsh"
fi

# Check if Go bin is in PATH and add it if not
if ! grep -q "${INSTALL_DIR}/bin" "$HOME/.zshrc"; then
    echo "export PATH=\$PATH:${INSTALL_DIR}/bin:\$GOPATH/bin" >> "$HOME/.dotfiles/go/path.zsh"
fi

echo "Version details:"
$INSTALL_DIR/bin/go version
