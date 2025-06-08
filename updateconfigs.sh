###########
# Created by Zophia H
# Pulls all configuration data

# - Neovim
rm -r neovim/* # wipe neovim dir
echo "Wiped neovim dir (repo)"
cp -r ~/.config/nvim/* ./neovim # refill neovim dir
echo "Filled neovim dir from LOCAL"
#OLD - cp ~/.config/nvim/init.vim ./init.vim
