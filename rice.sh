# -- REALLY IMPORTANT --


grep -qE "debian|ubuntu" /etc/os-release
if [ $? -eq 0 ]; then
	sudo apt-get install ninja-build gettext cmake curl build-essential
else
	sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra
fi

# I'm certainly running fedora if not debian or ubuntu
# - Nvim Directory Creation -
#if [ ! -d "$HOME/.config/nvim" ]; then
#	mkdir $HOME/.config/nvim
#	echo "[RICE] Created $HOME/.config/nvim/"
#else
#	echo "[RICE] Exists: $HOME/.config/nvim/"
#fi
#NVIMP=$HOME/.config/nvim

# - Nvim Installation (latest) -
if [[ ! "$@" == *"-noVim"*  ]]; then
	if [ -d "$HOME/.config/nvim" ]; then
		if [[ "$@" == *"-backup"* ]] && [ ! -d "$HOME/.config/nvim.bak" ]; then
			mv $HOME/.config/nvim{,.bak}
			echo "[RICE] Moved $HOME/.config/nvim to $HOME/.config/nvim.bak"
		fi
		mkdir $HOME/.config/nvim
	
	else
		mkdir $HOME/.config/nvim
		echo "[RICE] Created Nvim config folder"
	fi
	NVIMP=$HOME/.config/nvim
	echo "[RICE] Installing: Neovim"
	echo "[RICE] Echo disabled, please wait for message"
	wdir=$PWD # save where we're at
	git clone https://github.com/neovim/neovim.git /tmp/nvim &> /dev/null
	cd /tmp/nvim # Move to directory
	make CMAKE_BUILD_TYPE=Release #configure installation
	sudo make install &> /dev/null #install this girlie 
	cd $wdir #leave neovim dir
#- Plug installation -
#	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
 #      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	#cp $PWD/init.vim $NVIMP/init.vim
	#cp $PWD/lua $NVIMP/lua -r
	cd neovim # Enter Neovim dir with saves
	cp * $NVIMP -r # COPY DAT SHIT
#	/usr/local/bin/nvim -c 'PlugInstall'
	echo "[RICE] Installed: Neovim"
else 
	echo "[RICE] Exists: Neovim"
fi
