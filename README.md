Using Git and the bootstrap script
You can clone the repository wherever you want. (I like to keep it in ~/Projects/dotfiles, with ~/dotfiles as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

git clone https://github.com/acarter-ims/dotfiles.git && cd dotfiles && source bootstrap.sh
To update, cd into your local dotfiles repository and then:

source bootstrap.sh
Alternatively, to update while avoiding the confirmation prompt:

set -- -f; source bootstrap.sh

Specify the $PATH
If ~/.path exists, it will be sourced along with the other files, before any feature testing (such as detecting which version of ls is being used) takes place.

Here’s an example ~/.path file that adds /usr/local/bin to the $PATH:

export PATH="/usr/local/bin:$PATH"
Add custom commands without forking
If ~/.extra exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My ~/.extra looks something like this:

# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Austin Carter"
GIT_COMMITTER_NAME="Austin Carter
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="austin.carter@intelerad.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
You could also use ~/.extra to override settings, functions and aliases from my dotfiles repository. It’s probably better to fork this repository instead, though.

Sensible macOS defaults
When setting up a new Mac, you may want to set some sensible macOS defaults:

./.macos
Install Homebrew formulae
When setting up a new Mac, you may want to install some common Homebrew formulae (after installing Homebrew, of course):

./brew.sh
Some of the functionality of these dotfiles depends on formulae installed by brew.sh. If you don’t plan to run brew.sh, you should look carefully through the script and manually install any particularly important ones. A good example is Bash/Git completion: the dotfiles use a special version from Homebrew.
