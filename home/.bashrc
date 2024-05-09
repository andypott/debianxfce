# .bashrc

# Source global definitions
# Fedora
[ -f /etc/bashrc ] && . /etc/bashrc
# Debian
[ -f /etc/bash_completion ] && . /etc/bash_completion
# Arch
[ -f /usr/share/bash-completion/bash_complation ] && . /usr/share/bash-completion/bash_complation

# User specific environment
declare -a paths=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.local/language-servers/bin"
    "$HOME/.local/language-servers/node_modules/.bin"
    "$HOME/.cargo/bin"
    "$HOME/go/bin"
    "$HOME/.config/composer/vendor/bin"
    "$HOME/.luarocks/bin"
)

for p in "${paths[@]}"; do
    [[ ":$PATH:" != *"$p"* ]] && PATH="$p:$PATH"
done
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Add FZF keybindings
# Fedora
[ -f /usr/share/fzf/shell/key-bindings.bash ] && . /usr/share/fzf/shell/key-bindings.bash
# Debian
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && . /usr/share/doc/fzf/examples/key-bindings.bash
# Arch
[ -f /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash

# Use ripgrep for fzf (not in silverblue host though as it won't be installed)
if which rg >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Aliases
alias ls="ls --color"
alias ll="ls -lA"

# Disable command not found searching as it is slow and pointless
unset command_not_found_handle

# Configure Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Configure nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
