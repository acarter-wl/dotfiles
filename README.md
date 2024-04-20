# Organizing Your Dotfiles with GitHub

Managing your dotfiles using a structured repository can significantly streamline your environment setup. Here's an effective way to organize your dotfiles and automate their deployment.

## Directory Structure and Components

Your dotfiles repository can be organized by topic areas, making it modular and easy to navigate. Here's a breakdown of what each component does:

### Special Directories and Files

- **`bin/`**: Files here will be added to your `$PATH` and made available globally.
- **`topic/*.zsh`**: These scripts are loaded into your shell environment.
- **`topic/path.zsh`**: Loaded first to set up `$PATH`.
- **`topic/completion.zsh`**: Loaded last, setting up shell autocompletion.
- **`topic/install.sh`**: Executed with `script/install`. These are not loaded automatically because they have a `.sh` extension.
- **`topic/*.symlink`**: Files with this extension are symlinked into `$HOME` when you run `script/bootstrap`.

### Installation Process

To set up your dotfiles from the repository, follow these steps:

```bash
git clone https://github.com/holman/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This script will symlink the appropriate files from `.dotfiles` to your home directory, ensuring that your environment is set up with the configurations you've defined in your repository.

### Initial Configuration

Immediately after installation, you might want to modify `zsh/zshrc.symlink` to adjust paths specific to your setup.

### Utility Script

- **`dot`**: A script that helps install dependencies, set macOS defaults, and more. Regularly run `dot` to keep your environment updated.

## Example of Git Configuration

Here's how you can set your Git credentials locally, which also helps to avoid commits with incorrect user data:

```bash
# Set Git credentials
GIT_AUTHOR_NAME="Your Name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="your.email@example.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

### Extending Your Configuration

For personal overrides and additional settings, you can use `~/.extra`. This allows you to maintain a personal configuration without altering the main dotfiles repository.

## Setting Up a New Mac

When configuring a new Mac, you might want to set macOS defaults and install common Homebrew packages:

- **Sensible macOS defaults**:
  ```bash
  ./.macos
  ```
- **Install Homebrew and formulae**:
  ```bash
  ./brew.sh
  ```

This structured approach not only keeps your environment organized but also makes it replicable across different machines, easing transitions and upgrades.
