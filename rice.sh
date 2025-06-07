# -- REALLY IMPORTANT --


grep -qE "debian|ubuntu" /etc/os-release
if [ $? -eq 0 ]; then
	sudo apt-get install ninja-build gettext cmake curl build-essential
else
	sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra
fi


# - Nvim Installation (latest) + configs -
if [[ ! "$@" == *"-noVim "*  ]]; then


	# -StartNvim Config -  
	if [[ ! "$@" == *"-noVimConf "* ]]; then 
		./nvimconf.sh $* # run nvim configuration script
	fi
	# - End Neovim Config -
	NVIMP=$HOME/.config/nvim # nvim config dir
	

	
	wdir=$PWD # save where we're at

	# - Start Nvim Installation -
	if [ ! command -v nvim &> /dev/null ]; then
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






else 
	echo "[RICE] Skipping: Neovim"
fi
# - End Nvim Installation + configs -
