# Initial installation on a new Linux

## Update, upgrade packages

```sh
sudo apt update
sudo apt upgrade
```

## bash parameters:

To set bash case-insensitive. (not so nessesary after intallation of zsh) 

```sh
sudo bash -c 'echo "set completion-ignore-case on" >> /etc/inputrc'
sudo bash -c 'echo "set show-all-if-ambiguous on" >> /etc/inputrc'
```

## NVIDIA GPU drivers

Replace `XXX` by the latest version.

```sh
# sudo add-apt-repository ppa:graphics-drivers/ppa # not sure about this line
sudo apt install nvidia-driver-XXX
```


## Instal some programs

### Terminal

```sh
sudo apt install terminator -y
sudo update-alternatives --config x-terminal-emulator
```

### zsh, oh-my-zsh

```sh
sudo apt install zsh
chsh -s $(which zsh) # change shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### plugin "sudo"

```sh
sed 's/plugins=(git)/plugins=(git sudo)/' $HOME/.zshrc -i
source .zshrc
```

#### theme pure

```sh
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
mv "$HOME/.zsh/pure/pure.zsh" "$HOME/.oh-my-zsh/themes/pure.zsh-theme"
mv "$HOME/.zsh/pure/async.zsh" "$HOME/.oh-my-zsh/custom/async.zsh"
sed 's/ZSH_THEME="robbyrussell"/ZSH_THEME="pure"/' $HOME/.zshrc -i
source .zshrc
```

### package manager (install .deb files)

```sh
sudo apt install gdebi -y
```

Then change default program of .deb files


### curl

```sh
sudo apt install curl -y

```

### web browser

```sh
sudo apt install firefox -y
```

### mail

```sh
sudo apt install thunderbird -y

```

### postfix

use web server (send only)
use domainename like "julien-laptop"

```sh
sudo apt install postfix -y
```

```sh
sudo vim /etc/postfix/main.cf
# change:
#  -> inet_interfaces = loopback-only
sudo sed 's/inet_interfaces = all/inet_interfaces = loopback-only/' /etc/postfix/main.cf -i
sudo service postfix restart
```

Test:

```sh
sudo apt install mailutils
echo "this is a test" | mail -s "postfix test" juliendiot@ut-biomet.org
```

### gnome tweaks


```sh
sudo apt install -y gnome-tweaks \
gnome-tweak-tool \
gnome-shell-extensions
```

### htop

```sh
sudo apt install htop -y

```

### nemo file system


```sh
sudo apt install nemo -y
```

```sh
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.cinnamon.desktop.default-applications.terminal exec 'terminator'
```

### gpg


```sh
sudo apt install -y kleopatra \
scdaemon
```

### text editors

```sh
sudo apt install vim -y

```

### latex pandoc and some font


```sh
sudo apt install -y pandoc texlive texmaker
sudo apt install fonts-firacode -y
```

### flameshot

screenshot app.


```sh
sudo apt install flameshot -y
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot '[]'
```

### Docker


```sh
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common
```

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
stable"
```

```sh
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

```sh
sudo groupadd docker
sudo usermod -aG docker $USER
```

### R
#### dependencies

```sh
sudo apt install -y build-essential \
gfortran  \
libreadline-dev  \
zlib1g-dev  \
libbz2-dev  \
liblzma-dev  \
pcre2-utils libpcre2-dev \
libcurl4-openssl-dev \
libxml2-dev \
default-jdk \
libcairo2-dev \
xorg-dev \
tcl-dev \
tk-dev \
libgit2-dev
```
#### download

Check latest version and change corresponding line: https://cran.r-project.org/src/base/

```sh
curl "https://cran.r-project.org/src/base/R-4/R-4.0.3.tar.gz" --output R-4.0.2.tar.gz
sudo mkdir /opt/R/
sudo mv R-4.0.2.tar.gz /opt/R/
```

#### install

```sh
cd /opt/R/
sudo tar -xf /opt/R/R-4.0.2.tar.gz
cd /opt/R/R-4.0.2

sudo ./configure --enable-memory-profiling --enable-R-shlib --with-cairo --with-x --with-tcltk
sudo make && \
sudo make check && \
sudo make pdf && \
sudo make info && \
sudo make install && \
sudo make install-pdf && \
sudo make install-info

sudo rm -rf /opt/R/R-4.0.2.tar.gz
```

### R-Studio

Download latest `.deb` file on https://rstudio.com/products/rstudio/download/#download

```sh
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.4.1103-amd64.deb
```

### zotero

firefox https://www.zotero.org/download/

```sh
tar -xvjf Zotero-5.0.82_linux-x86_64.tar.bz2
mv ~/Downloads/Zotero_linux-x86_64/ /opt/zotero
sudo bash /opt/zotero/set_launcher_icon
ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
```

### insync
firefox "https://www.insynchq.com/downloads"

### slack
firefox "https://slack.com/intl/ja-jp/downloads/linux"

### vs code
firefox "https://code.visualstudio.com/download"

### gitkraken
firefox "https://gitkraken.com/download"

### dashlane
firefox "https://www.dashlane.com/download"


## Security

### firewall with ufw

#### install

```sh
sudo apt install ufw
```

#### manage rules

##### check rules

```sh
sudo ufw status numbered
```

##### delete rules

First check rules and replace `X` by rule number.

```sh
sudo ufw delete X
```

##### set default rules

```sh
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

##### open port to any IP

replace `XXX` by port number.

```sh
sudo ufw allow XXX
sudo ufw allow XXX/tcp 
sudo ufw allow XXX/udp
```

##### open port to specific IP

replace `XXX` by port number.
replace `xx.xx.xx.xx` by ip.

```sh
sudo ufw allow from xx.xx.xx.xx to any port XXX
sudo ufw allow from xx.xx.xx.0/24 to any port XXX # for a subnet
```

#### start / stop /reload ufw

```sh
sudo ufw status 
sudo ufw enable
sudo ufw disable
sudo ufw reload
```

### ssh

```sh
sudo apt install openssh-server
```

Setup. Change `XXX` by ssh port

```sh
sudo sed 's/#Port 22/Port XXX/' /etc/ssh/sshd_config -i
```

```sh
sudo sed 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config -i
sudo sed 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config -i
sudo sed 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config -i
sudo service ssh restart
```




# Gnome extentions

## system-monitor by Cerin

Display system informations in gnome shell status bar, such as memory usage, cpu usage, network rates…

https://extensions.gnome.org/extension/120/system-monitor/


## Activities Configurator 

Configure the Activities Button and Top Panel. Select an icon. Change the text. Disable Hot Corner or set the Hot Corner Threshold. Set Panel Background color and transparency plus much more to enhance your desktop. Click the icon or text with the secondary mouse button to launch the GS Extension Prefs.(by nls1729)

https://extensions.gnome.org/extension/358/activities-configurator/

## Auto Move Windows 

Move applications to specific workspaces when they create windows. by fmuellner

https://extensions.gnome.org/extension/16/auto-move-windows/

##  Caffeine by eon

Disable the screensaver and auto suspend

https://extensions.gnome.org/extension/517/caffeine/

## CPU Power Manager by martin31821

Manage Intel_pstate CPU Frequency scaling driver

https://extensions.gnome.org/extension/945/cpu-power-manager/

## Drop Down Terminal by zzrough

Drop down terminal toggled by a keystroke (the key above tab by default) for advanced users.

https://extensions.gnome.org/extension/442/drop-down-terminal/

## GSConnect by dlandau

GSConnect is a complete implementation of KDE Connect especially for GNOME Shell with Nautilus, Chrome and Firefox integration. It does not rely on the KDE Connect desktop application and will not work with it installed.

https://extensions.gnome.org/extension/1319/gsconnect/

## OpenWeather by jens

Weather extension to display weather information from https://openweathermap.org/ or https://darksky.net for almost all locations in the world.

https://extensions.gnome.org/extension/750/openweather/

## Places Status Indicator by fmuellner

Add a menu for quickly navigating places in the system.

https://extensions.gnome.org/extension/8/places-status-indicator/

## Pop Shell

Pop Shell

## Proxy Switcher by flannable

Switches between the system proxy settings profiles defined in Network Settings.

https://extensions.gnome.org/extension/771/proxy-switcher/

## Removable Drive Menu by fmuellner

A status menu for accessing and unmounting removable devices.

https://extensions.gnome.org/extension/7/removable-drive-menu/

## Remove Accessibility by lomegor

Remove the accessibility button from the top panel.

https://extensions.gnome.org/extension/112/remove-accesibility/

## Remove Dropdown Arrows by mpdeimos

Removes the dropdown arrows which were introduced in Gnome 3.10 from the App Menu, System Menu, Input Menu, Access Menu, Places Menu, Applications Menu and any other extension that wants to add dropdown arrows.

https://extensions.gnome.org/extension/800/remove-dropdown-arrows/

## RunCat by win0err

The cat tells you the CPU usage by running speed

https://extensions.gnome.org/extension/2986/runcat/

## Status Area Horizontal Spacing by p91paul

Reduce the horizontal spacing between icons in the top-right status area

https://extensions.gnome.org/extension/355/status-area-horizontal-spacing/

## Time ++ by zagortenay33

A todo.txt manager, time tracker, timer, stopwatch, pomodoro, and alarm clock

https://extensions.gnome.org/extension/120/system-monitor/

## TopIcons Plus by phocean

This extension moves legacy tray icons (bottom left of Gnome Shell) to the top panel. It is a fork from the original extension from ag  with settings for icon opacity, saturation, padding, size and tray position, along with a few minor fixes and integration with the Skype integration extension.

https://extensions.gnome.org/extension/1031/topicons/

## Workspace Indicator by fmuellner

Put an indicator on the panel signaling in which workspace you are, and give you the possibility of switching to another one.

https://extensions.gnome.org/extension/21/workspace-indicator/






# Use SSD and HDD on linux

The idea is to move the folders `/home` `/tmp` `/var` on a HDD.

## initialisation

Format and create partition using `gnome-disks`

## tempoary mount HDD on a specific folder

Check HDD device name:

```sh
sudo fdisk -l
```

If device name is `/dev/sda1`: (replace if needed)

```sh
sudo mkdir /hard_drive
sudo mount /dev/sda1 /hard_drive
```

## startup mount "rules"

### save original file

**VERY IMPORTANT !**

```sh
sudo cp /etc/fstab /etc/fstab.orig
cat /etc/fstab.orig
```

```sh
sudo mkdir /.orig
sudo cp /{home,tmp,var} /.orig
ls -la /.orig
```




### mount HDD on /hard_drive folder

Copy this line at the end of the `/etc/fstab` file:
`/dev/sda1	/hard_drive	ext4	defaults	0	0`

```sh
echo '/dev/sda1	/hard_drive	ext4	defaults	0	0' | sudo tee -a /etc/fstab
```

### move folders on hard drive

```sh
sudo mv /{tmp,var,home}  /hard_drive/
sudo ls /hard_drive
sudo ls /hard_drive/tmp
sudo ls /hard_drive/var
sudo ls /hard_drive/home
```

create empty folder on `/`:

```sh
mkdir /{tmp,var,home}
```

### modify `fstab`

```sh
echo '/hard_drive/tmp /tmp none defaults,bind 0 0' | sudo tee -a /etc/fstab
```
```sh
echo '/hard_drive/var /var none defaults,bind 0 0' | sudo tee -a /etc/fstab
```
```sh
echo '/hard_drive/home /home none defaults,bind 0 0' | sudo tee -a /etc/fstab
```

### reboot

```sh
sudo reboot now
```



###############

```sh
sudo cp /etc/fstab /etc/fstab.orig
cat /etc/fstab.orig
```

```sh
sudo mkdir /.orig
sudo cp /{home,tmp,var} /.orig
ls -la /.orig
```

```sh
sudo chmod 777 /.orig/tmp
sudo chown -R julien:julien /.orig/home/julien
ls -la /.orig
ls -la /.orig/home
```

```sh
sudo mkdir /mnt/hard_drive
sudo mnt /dev/sdb1 /mnt/hard_drive
sudo rm -rf /mnt/hard_drive/*
```


```sh
sudo cp -rp /{home,tmp,var} /mnt/hard_drive/
ls -la /hard_drive/
ls -la /hard_drive/home

```
