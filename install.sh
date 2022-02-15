# bash <(curl -s https://raw.githubusercontent.com/craftsmandigital/.dotfiles/master/install.sh)
# Heavyly inspired of this setup
# https://github.com/jakewies/.dotfiles
# https://www.jakewiesler.com/blog/portable-development-environment
function intro(){
  echo -e "\n\n\n\n#########################################################################################################"
  echo -e "#########     $1"
  echo '#########################################################################################################'
  # read -p "\n\n\nControl every step.\nPress any key to resume ...\n\n\n"
}


intro "Setting environment variables"

EMAIL='hackjack@tutanota.com'
USR='hackjack'
GITHUBPROFILE='craftsmandigital'


# intro "Config git username and email"
# git config --global user.email $EMAIL
# git config --global user.name $USR



intro "keygen stuff, Credentials for github"
#https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
echo "Enter password for SSH key encryption"
ssh-keygen -t ed25519 -C $EMAIL
eval "$(ssh-agent -s)"
cat ~/.ssh/id_ed25519.pub
if lsb_release -a | grep "Ubuntu"; then
	# Copy ssh key to clipoard
	cat ~/.ssh/id_ed25519.pub | clip.exe
	# opening browser page for creating a new ssh key on github
	wslview https://github.com/settings/keys
fi
read -p "The ssh key is copied to the clipboard\nPaste ssh key when creating a new ssh key in the github web page\nSave ssh key\nPress any key to resume ..."


# Install dotfilerepo
intro 'Install .dotfiles repo to $HOME folder'
cd ~
git clone git@github.com:craftsmandigital/.dotfiles.git
cd ~/.dotfiles

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
	nixpkgs.zoxide
	
	
intro 'Installing lunar vim'
# https://www.lunarvim.org/01-installing.html#prerequisites
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
# delete initial config file and replace later on with own config file
rm ~/.config/lvim/config.lua

intro "stow dotfiles"
stow lvim
# stow tmux
stow zsh
stow git

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
