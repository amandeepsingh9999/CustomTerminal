# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# Display Pokemon-colorscripts
pokemon-colorscripts --no-title -s -r

# Set up FZF key bindings (CTRL R for fuzzy history finder)
# source <(fzf --zsh)

# History settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Aliases for Neovim configurations
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

# Function to select and open Neovim configuration
nvims() {
  local items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  local config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  fi

  [[ $config == "default" ]] && config=""
  NVIM_APPNAME=$config nvim "$@"
}

# Bind nvims function to CTRL+A
bindkey -s ^a "nvims\n"

# Initialize zoxide
eval "$(zoxide init zsh)"
