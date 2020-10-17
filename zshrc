# If you come from bash you might have to change your $PATH.
#export PATH=/usr/bin:/usr/local/bin:${PATH}

# ZSH_TMUX_AUTOSTART="true"
# Path to your oh-my-zsh installation.
export ZSH="/home/jhewers/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ "$TERM_PROGRAM" == "vscode" || ! -z $SSH_CLIENT ]]; then
    ZSH_THEME="robbyrussell"
else
    ZSH_THEME="agnoster"
fi
#"bullet-train"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git archlinux common-aliases history pip python sudo tmux wd
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$PATH:$HOME/.local/bin

if [[ -z $TMUX && "$TERM_PROGRAM" != "vscode" && "$TERM_PROGRAM" != "android_studio" && -z $SSH_CLIENT && -z $SSH_TTY ]] 
then
    tmux attach-session -t home || tmux new -t home
fi




eval $(thefuck --alias)
export EDITOR="/usr/bin/vim"

cd() { 
    builtin cd "$@" && ls
}

alias :w="cowsay 'You are not in vim, Jackass'"
alias :q="cowsay 'You are not in vim, Jackass'"
alias :wq="cowsay 'You are not in vim, Jackass'"
alias :x="cowsay 'You are not in vim, Jackass'"
alias :q!="cowsay 'You are not in vim, Jackass'"

alias ubuntu_vm_ssh="ssh jhe-ubuntu-vm"
alias rpi_ssh="ssh jhrpi"
alias ubuntu_pi_ssh="ssh ubuntu@192.168.1.69"
alias ubuntu_vm_start="virsh start ubuntu18.04"
alias ubuntu_vm_stop="virsh shutdown ubuntu18.04"
alias ubuntu_vm_save="virsh save ubuntu18.04 $HOME/.cache/libvirt/mem_dump"
alias ubuntu_vm_restore="virsh restore $HOME/.cache/libvirt/mem_dump"


uni_vpn() {
    sudo cat /home/jhewers/.vpn/passwd | sudo openconnect --passwd-on-stdin -u 2198917e --authgroup=Off_Campus_Use gucsasa1.cent.gla.ac.uk
}



uni_rdp() {
    rdesktop -g 1440x900 -P -z -x l -u CAMPUS\2198917e $(curl https://rdpinfo.eng.gla.ac.uk/ 2>/dev/null | grep ".eng.gla.ac.uk" | awk 'length($0)<50' | sed 's/ //g' | shuf -n1):3389
}

# set an ad-hoc GUI timer
timer() {
  local N=$1; shift

  (sleep $N && zenity --info --title="Time's Up" --text="${*:-BING}") &
  echo "timer set for $N"
}

# Notify after run
notify(){
  echo "$@"
  zsh -c "$@"
  zenity --info --text="$0 finished with code $!" --title="Command executed"
}


alias hornet_share="sudo mount -t cifs //hornet_cc/share /home/jhewers/Shared -o username=smbuser,password=smbuser,uid=1000,gid=1000"
export ANDROID_HOME=/mnt/SMALL_UN/Android/SDK/
export PATH="$PATH:/opt/android/flutter/bin"
export PATH="$PATH:/opt/android/bin/cache/dart-sdk/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/.gem/ruby/2.7.0/bin"
source /usr/share/gazebo/setup.sh

# added by travis gem
[ ! -s /home/jhewers/.travis/travis.sh ] || source /home/jhewers/.travis/travis.sh

backup_home(){
    rclone sync -PL /home/jhewers /run/media/jhewers/Backup\ Plus/Seagate/Backup --exclude-from /opt/dotfiles/rclone_exclude.list
}


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

