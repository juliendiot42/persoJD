sudo apt update && sudo apt upgrade -y

sudo apt install -y \
	vim \
	curl \
	make cmake \
	git \
	code \
	ufw \
	htop \
	openssh-server \
	network-manager-l2tp \
	network-manager-l2tp-gnome \
	network-manager-openvpn-gnome \
	network-manager-openvpn \
	network-manager-gnome \
	gnome-icon-theme \
	terminator \
	zsh \
	nemo \
	kleopatra \
	texlive-full \
	pandoc \
	flameshot \
	firefox \
	chromium-browser \
	thunderbird \
	gnome-tweaks \
	gnome-shell-extensions \
	gnime-clocks \
	piper \
	easystroke \
	python3-pip \
	gimp \
	obs-studio \
	pavucontrol \
	deja-dup \
	baobab \
	gparted \
	ibus-mozc mozc-server mozc-utils-gui \
	discord \
	fonts-firacode \
	gphoto2 v4l2loopback-utils v4l2loopback-dkms ffmpeg 
	
sudo apt install ttf-mscorefonts-installer -y

	

# docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install -y \
	apt-transport-https \
	ca-certificates \
	gnupg-agent \
	software-properties-common
	
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
stable"
sudo apt update 
sudo apt install docker-ce docker-ce-cli containerd.io -y

sudo groupadd docker
sudo usermod -aG docker $USER



# keyboard
python3 -m pip install --user qmk
qmk setup



# settings
sudo update-alternatives --config x-terminal-emulator

chsh -s $(which zsh) 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed 's/plugins=(git)/plugins=(git sudo)/' $HOME/.zshrc -i
source .zshrc
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
mv "$HOME/.zsh/pure/pure.zsh" "$HOME/.oh-my-zsh/themes/pure.zsh-theme"
mv "$HOME/.zsh/pure/async.zsh" "$HOME/.oh-my-zsh/custom/async.zsh"
sed 's/ZSH_THEME="robbyrussell"/ZSH_THEME="pure"/' $HOME/.zshrc -i
source .zshrc


xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.cinnamon.desktop.default-applications.terminal exec 'terminator'


