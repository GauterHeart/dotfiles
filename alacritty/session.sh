session=$(tmux ls)

if [[ $session == *"shell"* ]]; then
	tmux a -t shell
else 
	tmux new -s shell
fi
