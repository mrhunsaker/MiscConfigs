###################################
## Set up Google Drive and OneDrive using RClone
###################################
#rclone --vfs-cache-mode writes mount "onedrive": ~/OneDrive &
#rclone --vfs-cache-mode writes mount "googledriveHC": ~/GoogleDriveHC &
#rclone --vfs-cache-mode writes mount "googledriveW": ~/GoogleDriveW &
###################################
## Set up Paths and Linkers 
###################################
export WORKON_HOME=~/virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.11
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
###################################
## Set up zsh Aliases
###################################
alias neofetch="neofetch -config off --bold off --color_blocks on --ascii_distro openSUSE_Tumbleweed --colors 3 4 5 6 2 1"
alias ls="ls -CHG --color=auto"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias vim="nvim" #vi is still vi, only vim has been aliased to NeoVim
alias diff="colordiff"
alias wget="wget -c"
alias top="htop"
alias untar="tar --extract --gzip --verbose --file"
alias archive="tar --create --gzip --verbose --file"
alias mkdir="mkdir -pv"
alias ls.="ls -d .* --color=auto"
alias cd..="cd .."
alias .="cd .."
alias ..="cd ../../"
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
###################################
# Configurations for zsh
###################################
setopt AUTO_CD
setopt NO_CASE_GLOB
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt EXTENDED_HISTORY
SAVEHIST=5000
HISTSIZE=2000

# share history across multiple zsh sessions
setopt SHARE_HISTORY

# append to history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST

# do not store duplications
setopt HIST_IGNORE_DUPS

# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS

# removes blank lines from history
setopt HIST_REDUCE_BLANKS
setopt CORRECT
setopt CORRECT_ALL
autoload -Uz compinit && compinit

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Left Prompt
PROMPT=' %n@%B%F{red}%d%f%b %# '

# Right Prompt set to tell me where I am within any Github Projects
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)%f%F{blue}%r%f'
zstyle ':vcs_info:*' enable git

if [ -n "$COLORTERM" ]; then
	alias ls='ls -F --color=auto'
	if [ -x "`which dircolors`" -a -r "$HOME/.dir_colors" ]; then
	       eval `dircolors -b "$HOME/.dir_colors"`
	fi
else
	alias ls='ls -F'
fi

mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc


fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath+=${ZDOTDIR:-~}/.zsh_functions
