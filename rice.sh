# -- REALLY IMPORTANT --

if [ ! command -v ninja ] && [ ! command -v cmake ] && [ ! command -v make ] && [ ! command -v gcc ]; then
	grep -qE "debian|ubuntu" /etc/os-release
	if [ $? -eq 0 ]; then
		sudo apt-get install ninja-build gettext cmake curl build-essential
	else
		sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra
	fi
fi 
# I'm certainly running fedora if not debian or ubuntu
# - Nvim Directory Creation -
if [ ! -d "$HOME/.config/nvim" ]; then
	mkdir $HOME/.config/nvim
	echo "[RICE] Created $HOME/.config/nvim/"
else
	echo "[RICE] Exists: $HOME/.config/nvim/"
fi
NVIMP=$HOME/.config/nvim

# - Nvim Installation (latest) -
if [ ! -d "$HOME/neovim" ]; then
	echo "[RICE] Installing: Neovim"
	echo "[RICE] Echo disabled, please wait for message"
	@echo off
	git clone https://github.com/neovim/neovim.git
	cd neovim
	make CMAKE_BUILD_TYPE=Release
	sudo make install
	#- Plug installation -
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	cp init.vim $NVIMP/init.vim
	/usr/local/bin/nvim -c 'PlugInstall'
	@echo on
	echo "[RICE] Installed: Neovim"
else 
	echo "[RICE] Exists: Neovim"
fi



