unbind-key -n C-b
unbind-key -n C-a
set -g prefix ^A
set -g prefix2 ^A
bind a send-prefix

# disable fuction key in tmux
source-file /usr/local/Cellar/byobu/5.75/share/byobu/keybindings/f-keys.tmux.disable

# reload config
bind-key R source-file ~/.byobu/keybindings.tmux \; display-message "keybindings.tmux reloaded"


# Windows
# tmux windows
# bind-key space next-window
# bind-key bspace previous-window

# split panes
bind-key v split-window -h
bind-key s split-window -v


# VIM
# vim conifg
set-window-option -g mode-keys vi

# hjkl pane traversal
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# copy
bind-key -t vi-copy 'y' copy-selection
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'V' rectangle-toggle

# copy to system clipboard
# support copy to system clipboard
# set-option -g default-command "reattach-to-user-namespace -l zsh"
# bind C-y run "tmux save-buffer - | reattach-to-user-namespace pbcopy"

if-shell 'test "$(uname)" = "Darwin"' 'bind C-y run "tmux save-buffer - | pbcopy"'

# display-message "keybindings.tmux reloaded"


# paste
bind ']' paste-buffer
