# Heavyly inspired of this setup
# https://github.com/jakewies/.dotfiles
# https://www.jakewiesler.com/blog/portable-development-environment
function intro(){
  read -p "\n\n\nControl every step.\nPress any key to resume ...\n\n\n"
  echo -e "\n\n\n\n#########################################################################################################"
  echo -e "#########     $1"
  echo '#########################################################################################################'
}


if lsb_release -a | grep "Ubuntu"; then
	intro "Update packages"
    sudo apt update -y
		
	intro "Upgrade packages"
	sudo apt upgrade -y
fi


intro "Install nix"
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

intro "install packages"
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.trash-cli \
	nixpkgs.antibody \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.gnumake \
	nixpkgs.gcc \
	nixpkgs.direnv \
	nixpkgs.nodePackages.npm \
	nixpkgs.nodejs \
	nixpkgs.fd \
	nixpkgs.cargo \
	nixpkgs.lazygit \
	nixpkgs.zoxide\
	
	
intro 'Installing lunar vim'
# https://www.lunarvim.org/01-installing.html#prerequisites
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
# delete initial config file and replace later on with own config file
rm ~/.config/lvim/config.lua

intro "stow dotfiles"
stow git
stow lvim
# stow tmux
stow zsh

intro "add zsh as a login shell"
command -v zsh | sudo tee -a /etc/shells

intro "use zsh as default shell"
sudo chsh -s $(which zsh) $USER

intro "bundle zsh plugins "
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# intro "install neovim plugins"
# nvim --headless +PlugInstall +qall

intro "Use kitty terminal on MacOS"
[ `uname -s` = 'Darwin' ] && stow kitty
