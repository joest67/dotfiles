# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

ZSH_THEME="joest-timestamp"

plugins=(
    git
    git-extras
    gitignore
    git-flow
    autojump
    mvn
)

export PATH=$HOME/.dotfiles/bin:/usr/local/bin:/usr/local/sbin/:$PATH

# pip install --user
LOCAL_PIP=$HOME/Library/Python/2.7/bin
if [ -d $LOCAL_PIP ]; then
    export PATH=$HOME/Library/Python/2.7/bin:$PATH
fi
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"

source $ZSH/oh-my-zsh.sh
source /usr/local/Cellar/zsh-syntax-highlighting/0.5.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

########################
#     system env       #
########################

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export HOMEBREW_GITHUB_API_TOKEN='ec63ccbf280c52ce571e2766bf0ce4ec96478ecb'
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"
export M2_HOME="/usr/local/Cellar/maven/3.5.0/libexec"


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
alias tnew='tmux new'
alias c=code
alias vi=vim
alias ip="curl ipinfo.io/ip"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias serve="python -m SimpleHTTPServer"

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
#       gpg agent        #
##########################

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

##########################
#       functions        #
##########################
ssh-copy-id (){
    ssh $1 "mkdir -p .ssh"
    ssh $1 "echo `cat .ssh/id_rsa.pub` >> ~/.ssh/authorized_keys"
    ssh $1 "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
}
export GOPATH=$HOME/gocode

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
