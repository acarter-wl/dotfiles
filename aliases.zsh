alias sc='script/console'
alias sg='script/generate'
alias sd='script/destroy'
# Basic alias to ensure color output
alias ls='ls --color=always'

# Assuming `eza` supports similar options for colors and icons
alias eza='eza --color=always --icons'

# Expanding upon your provided aliases to ensure color and icons are always used
alias ls='eza --color=always --icons -a'       # Show all files including hidden, with icons
alias lsl='eza --color=always --icons -lh'      # Long listing with human-readable sizes, with icons
alias lsla='eza --color=always --icons -lah'    # Long listing for all files, with icons
alias lsg='eza --color=always --icons -G'       # Group directories first, with icons
alias lss='eza --color=always --icons -lS'      # Sort by file size, with icons
alias lsr='eza --color=always --icons -R'       # Recursively list directories, with icons
alias lst='eza --color=always --icons -T'       # Tree view, with icons
alias lsx='eza --color=always --icons -@'       # Show extended attributes, with icons
