**topical**
Everything's built around topic areas. If you're adding a new area to your forked dotfiles — say, "Java" — you can simply add a java directory and put files in there. Anything with an extension of .zsh will get automatically included into your shell. Anything with an extension of .symlink will get symlinked without extension into $HOME when you run script/bootstrap.


**components**
There's a few special files in the hierarchy.

bin/: Anything in bin/ will get added to your $PATH and be made available everywhere.
topic/*.zsh: Any files ending in .zsh get loaded into your environment.
topic/path.zsh: Any file named path.zsh is loaded first and is expected to setup $PATH or similar.
topic/completion.zsh: Any file named completion.zsh is loaded last and is expected to setup autocomplete.
topic/install.sh: Any file named install.sh is executed when you run script/install. To avoid being loaded automatically, its extension is .sh, not .zsh.
topic/*.symlink: Any file ending in *.symlink gets symlinked into your $HOME. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run script/bootstrap.
install
Run this:
```
git clone https://github.com/holman/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```
This will symlink the appropriate files in .dotfiles to your home directory. Everything is configured and tweaked within ~/.dotfiles.

The main file you'll want to change right off the bat is zsh/zshrc.symlink, which sets up a few paths that'll be different on your particular machine.

dot is a simple script that installs some dependencies, sets sane macOS defaults, and so on. Tweak this script, and occasionally run dot from time to time to keep your environment fresh and up-to-date. You can find this script in bin/.
```
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Austin Carter"
GIT_COMMITTER_NAME="Austin Carter
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="austin.carter@intelerad.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
You could also use ~/.extra to override settings, functions and aliases from my dotfiles repository. It’s probably better to fork this repository instead, though.
```
Sensible macOS defaults
When setting up a new Mac, you may want to set some sensible macOS defaults:
```
./.macos
```
Install Homebrew formulae
When setting up a new Mac, you may want to install some common Homebrew formulae (after installing Homebrew, of course):
```
./brew.sh
```
