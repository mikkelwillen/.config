### EXPORT ###
set fish_greeting
set TERM "ghostty"
set EDITOR "emacsclient -t -a ''"
set VISUAL "emacsclient -c -a emacs"

bind \c\b backward-kill-word
if status is-interactive
	# Commands to run in interactive sessions can go here
end

set PATH $HOME/.local/share/nvm/v22.12.0/bin/ $PATH
