if tmux has-session 2>/dev/null
	if echo (tmux ls | rg "shell")
		tmux a -t shell
	end
else
    tmux new -s shell
end
