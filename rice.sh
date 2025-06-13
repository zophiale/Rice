echo "[Rice] Welcome to Monarch Rice, this process moves really fast so don't expect to be able to read this"
# -- REALLY IMPORTANT --
if [[ "$@" == *"-pullLocal"* ]]; then
	./updateconfigs.sh
	exit
fi
if [[ "$@" == *"-pullGithub"* ]]; then
	git pull
	echo "[Rice] Updated from github!"
	exit
fi
builder=0
grep -qE "debian|ubuntu" /etc/os-release
if [ $? -eq 0 ]; then
	sudo apt-get install ninja-build gettext cmake curl build-essential
else
	sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra
	builder=1
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
	echo "[RICE] Installing latest neovim..."

	git clone https://github.com/neovim/neovim.git /tmp/nvim # pull neovim from github 
	
	cd /tmp/nvim # Move to directory
	
	make CMAKE_BUILD_TYPE=Release #configure installation
	
	sudo make install &> /dev/null #install this girlie 
	
	echo "[RICE] Installed: Neovim"	
	
	cd $wdir #leave neovim dir
		
	rm -r /tmp/nvim # Perform cleanup
		
	if [[ "$@" == *"-runVim"* ]] then
		sh -c "nvim"
	fi

	# - End Nvim Installation - 






else 
	echo "[RICE] Skipping: Neovim"
fi
# - End Nvim Installation + configs -



# - Start ZAP + ZSH Install -

if [[ ! "$@" == *"-noZSH"* ]]; then
	if [ $builder -eq 1 ]; then
		# Fedora
		sudo dnf in zsh
	else
		sudo apt-get install zsh
		#Likely apt?
		# Will add arch shit later, im LAZY
	fi

	if [[ ! "$@" == *"-noDefaultShell"* ]]; then
		chsh -s /bin/zsh # Set zsh to shell
	fi


	if [[ ! "$@" == *"-noZap"* ]]; then
		zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
	fi
	
fi


# - Zig installation -
# ZIG MUST BE CALLED TO BE INCLUDED


if [[ "$@" == *"-includeZig"* ]]; then
	sudo dnf in zig
fi


