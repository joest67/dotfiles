# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

ZSH_THEME="af-magic"

plugins=(
    git
    git-flow
    autojump
)

export PATH=$HOME/.dotfiles/bin:/usr/local/bin:$PATH

# pip install --user
LOCAL_PIP=$HOME/Library/Python/2.7/bin
if [ -d $LOCAL_PIP ]; then
    export PATH=$HOME/Library/Python/2.7/bin:$PATH
fi

source $ZSH/oh-my-zsh.sh

########################
#     system env       #
########################

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"


##########################
#     software env       #
##########################

# virtualwrapper
    export WORKON_HOME=~/Envs
    source /usr/local/bin/virtualenvwrapper.sh

##########################
#       alias            #
##########################
alias grep='grep --color'
alias ll='ls -al'
alias glast='git log -n 1 --format=%H |tr -d "\n"'

# used for auto completion
# ref: http://michaelheap.com/enable-zsh-completion-for-hub/
fpath=(~/.dotfiles/auto-completion $fpath)
autoload -U compinit && compinit -u

##########################
#       ssh agent        #
##########################

SSH_ENV="$HOME/.ssh/agent_info"

if ! [ -n "$SSH_AGENT_PID" ]; then
    if [ -f "$SSH_ENV" ]; then
        . "$SSH_ENV" > /dev/null
    fi
    [[ -n "$SSH_AGENT_PID" ]] && ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
    ret=$?
    if ! [ $ret -eq 0 ]; then
        echo "Initializing new SSH agent..."
       # spawn ssh-agent
       ssh-agent > "$SSH_ENV"
       chmod 600 "$SSH_ENV"
       . "$SSH_ENV" > /dev/null
   fi
fi


##########################
#       functions        #
##########################
ssh-copy-id (){
    ssh $1 "mkdir -p .ssh"
    ssh $1 "echo `cat .ssh/id_rsa.pub` >> ~/.ssh/authorized_keys"
    ssh $1 "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
}
