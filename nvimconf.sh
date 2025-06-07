if [ -d "$HOME/.config/nvim" ]; then
	
	echo "[RICE] Nvim config folder exists..."

	if [[ "$@" == *"-backup"* ]] && [ ! -d "$HOME/.config/nvim.bak" ]; then

		mv $HOME/.config/nvim{,.bak} # Moves config to a backup folder

		echo "[RICE] Moved $HOME/.config/nvim to $HOME/.config/nvim.bak"

		mkdir $HOME/.config/nvim #remakes config folder

	fi
else
	echo "[RICE] Creating Nvim config folder..."

	mkdir $HOME/.config/nvim #Makes config folder

	echo "[RICE] Created Nvim config folder"
fi

