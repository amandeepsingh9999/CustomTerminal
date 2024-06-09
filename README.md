Sure, here’s a more interactive version with emojis added for better engagement:

# 🛠 CustomTerminal ~ >

## What Are We Going to Achieve?
![Terminal Screenshot](Assets/Images/Screenshot_08-Jun_17-46-31_27791.png)

> [!NOTE]
> This repository is divided into three parts:
> 1. ZSH
> 2. TMUX
> 3. ZOXIDE
>
> Although this repository is specific to ZSH, all three are mentioned to show that there are many ways to customize your terminal beyond its appearance.

# 1. ZSH 🎨

In simple words, ZSH stands for Z Shell. It's primarily used for adding plugins and theming your terminal. Here's how to install it on Ubuntu:
```sh
sudo apt install zsh
```
If you're using another OS, use the respective package manager. For example, on Arch Linux:
```sh
sudo pacman -S zsh
```

### Installing Oh-My-Zsh 🚀

Now that we have ZSH installed, we'll install **Oh-My-Zsh**. Run this command:

**Using Curl:**
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Using Wget:**
```sh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

### Understanding the Code 📜

The following code is provided in the `.zshrc` file in this repository.

### Code - 1 🖥️
```sh
# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
```
- **Line 1:** Ensures ZSH is configured each time you use the terminal.
- **Line 2:** Sets the terminal theme.

To add your choice of ZSH theme, place it in the themes directory. For example, in my case, it is:
```
/home/zangetsu/.oh-my-zsh/themes/
```
*(Replace "zangetsu" with your username)*

I personally use the oxide theme (provided in this repo).

### Code - 2 🔌
```sh
# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
```
- **Plugins:**
  - **git:** Allows performing git operations like clone, etc.
  - **zsh-autosuggestions:** Provides command suggestions (as shown in the image below).
  - **zsh-syntax-highlighting:** Highlights words in your source code (as shown in the image below).

![Plugin Example](Assets/Images/Screenshot_08-Jun_22-50-34_27015.png)

As shown, syntax highlighting works properly, and suggestions appear in grey.

### Code - 3 📂
```sh
# Load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"
```
- This line loads Oh My Zsh. 

To reload your `.zshrc` file after making changes, run:
```sh
source .zshrc
```

### Code - 4 🎨
```sh
# Display Pokemon-colorscripts
pokemon-colorscripts --no-title -s -r
```
- This script displays pixelated Pokémon randomly when you open the terminal. The arguments are:
  - `--no-title`: Removes the Pokémon name.
  - `-s`: Displays only shiny Pokémon.
  - `-r`: Displays random Pokémon.

**Installation:**

Step One - Clone or download the repository:
```sh
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
```

Step Two - `cd` into the directory and run the install script:
```sh
cd pokemon-colorscripts
sudo ./install.sh
```

### Code - 5 📜
```sh
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
```
- These settings ensure ZSH keeps a history of up to 10,000 commands for both the current session and across multiple sessions, saving them in a file called `.zsh_history` in your home directory.

### Code - 6 ⚙️
```sh
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
```
- This script helps you use various Neovim configurations like NvChad, Kickstart, LazyVim, and AstroNvim.
- Each configuration can be used for different purposes, such as a Jupyter Notebook-like experience with Kickstart Nvim.

### Final Edits ✏️

- You can comment out the Pokémon script if you don't like it by adding `#` before the line.
- Add another Neovim distribution by modifying the `nvims` function.
- Change themes by modifying the theme name in the `ZSH_THEME` variable.
- Add more plugins to the `plugins` array.

## Conclusion 🎉
That's it for now! The sky's the limit, so feel free to make any changes you want to this dotfile. In the next repository, we'll configure TMUX.
