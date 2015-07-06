# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

plugins=(
    git
    git-flow
)

export PATH=$HOME/bin:/usr/local/bin:$PATH
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

# git
# see oh-my-zsh/plugins/git/git.plugin.zsh


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
    ssh $1 "echo `cat .ssh/id_rsa.pub` >> ~/.ssh/authorized_keys"
}
