export CC=gcc-14
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.docker/bin
export PATH=$PATH:$HOME/.bun/bin
export PATH=$PATH:$HOME/.moon/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export JAVA_HOME=$(brew --prefix openjdk)/libexec/openjdk.jdk/Contents/Home
export EDITOR=nvim

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting
# zinit light zdharma-continuum/history-search-multi-word
zi light trapd00r/LS_COLORS

# Add in snippets
zinit snippet OMZP::brew
zinit snippet OMZP::command-not-found
zinit snippet OMZP::direnv
zinit snippet OMZP::extract
zinit snippet OMZP::eza
zinit snippet OMZP::fzf
zinit snippet OMZP::git
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::sudo
zinit snippet OMZP::starship
zinit snippet OMZP::zoxide

# Load completions
autoload -Uz compinit && compinit


zinit cdreplay -q

# Keybindings
bindkey -e
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt APPENDHISTORY
setopt SHAREHISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

ZSH_THEME="amuse"

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias vi="nvim"
alias clr="clear"
alias code="Electron"
alias lg="lazygit"
alias k="kubectl"
alias gc="git clone"
alias pi="pip install"
alias ca="conda activate"
alias ni="npm install"
alias yz="yazi"

# config for node version manager
 export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wudingfeng/Documents/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/wudingfeng/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wudingfeng/Documents/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/wudingfeng/Documents/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


eval "$(zoxide init zsh)"

# cheatsheet
cht() {
  curl https://cht.sh/$1
}

# kill process by port
killp(){
  lsof -t -i:$1 | xargs kill -9
}

rfv() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            nvim {1} +{2}     # No selection. Open the current line in Vim.
          else
            nvim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf < /dev/null \
      --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
)

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Custom export
export KUBECONFIG=~/.kube/config:~/.kube/test-config


export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

eval "$(starship init zsh)"

source ~/local.zsh


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/wudingfeng/.lmstudio/bin"
