export PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:/opt/homebrew/opt/binutils/bin:/opt/homebrew/opt/findutils/libexec/gnubin:/opt/homebrew/opt/ed/bin:/opt/homebrew/opt/flex/bin:$HOME/.local/bin:$HOME/.config:/usr/bin:/opt/homebrew/bin:$PATH
export LDFLAGS=-L/opt/homebrew/opt/binutils/lib:-L/opt/homebrew/opt/flex/lib
export CPPFLAGS=-I/opt/homebrew/opt/binutils/include:-I/opt/homebrew/opt/flex/include
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH=/opt/homebrew/opt/mtr/sbin:$PATH