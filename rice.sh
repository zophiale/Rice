# -- REALLY IMPORTANT --


grep -qE "debian|ubuntu" /etc/os-release
if [ $? -eq 0 ]; then
	sudo apt-get install ninja-build gettext cmake curl build-essential
else
	sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra
fi


# - Nvim Installation (latest) + configs -
if [[ ! "$@" == *"-noVim"*  ]]; then


	# -StartNvim Config Init-
	if  [[ ! "-noVimConf" == *"$@"* ]]; then
	
		./nvimconf.sh $*
	fi
	# - End Neovim Config Init -
	NVIMP=$HOME/.config/nvim # nvim config dir
	

	
	wdir=$PWD # save where we're at

	# - Start Nvim Installation -
	if [ ! command -v nvim ];
		echo "[RICE] No Neovim, installing..."

		git clone https://github.com/neovim/neovim.git /tmp/nvim # pull neovim from github 
	
		cd /tmp/nvim # Move to directory
	
		make CMAKE_BUILD_TYPE=Release #configure installation
	
		sudo make install &> /dev/null #install this girlie 
	
		echo "[RICE] Installed: Neovim"	
	
		cd $wdir #leave neovim dir
		
		rm -r /tmp/nvim # Perform cleanup
		

	fi
	# - End Nvim Installation - 

	# - Start Plaster Nvim Configuration -
#	if [[ ! "$@" == *"-noVimConf"* ]]; then
	# - End Plaster Nvim Configuration -


else 
	echo "[RICE] Skipping: Neovim"
fi
# - End Nvim Installation + configs -
