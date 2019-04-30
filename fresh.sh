
# install nord konsole theme
echo "Installing nord konsole theme
cd nord-konsole
./install.sh
cd ../

# install zsh, OMZ, add configs
echo "Installing zsh, oh-my-zsh, and relevant configs
sudo pacman -S zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln dotfiles/.zshrc ~/.zshrc
wget https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -O ~/.oh-my-zsh/themes/bullet-train.zsh-theme

# Install tmux and oh-my-tmux
sudo pacman -S tmux
ln dotfiles/.tmux.conf{,.local} $HOME
chmod +x scripts/my_ip
ln scripts/my_ip ~/.local/bin/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# SSH
sudo ln dotfiles/sshd_config /etc/ssh/sshd_config
sudo chown root:root dotfiles/sshd_config
sudo chmod 644 dotfiles/sshd_config

# Spotify
sudo pacman -S snap snapd
snap install spotify
echo "Setting up lyrics engine and spotify CLI"
sudo cp scripts/Spotify.sh /bin/sp
sudo cp scripts/Lyrics.sh /bin/lyrics
sudo chmod +x /bin/{sp,lyrics}

# Themes
echo "Setting up Plasma Themes"
cd Plasma-Themes
mkdir $HOME/.local/share/plasma/desktoptheme
cp -r * $HOME/.local/share/plasma/desktoptheme/
cd ../

# Icons
echo "Installing Dex icons"
git clone https://github.com/ishovkun/Dex.git
cd Dex
sudo cp -r * /usr/share/icons
cd -
rm -rf Dex

# Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd -
rm -rf fonts

# Awesome fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd ..
rm -rf nerd-fonts

# Glava
#glava --copy-config
#rm -f ~/.config/glava/{circle.glsl,rc.glsl}
#ln dotfiles/{circle.glsl,rc.glsl} ~/.config/glava/
#ln dotfiles/glava.desktop ~/.config/autostart/

# Conky
sudo pacman -S conky
ln dotfiles/{conky.conf,conky_music.conf,conkyart.sh} ~/.config/conky
#ln dotfiles/conky{,_music}.desktop ~/.config/autostart

# NordVPN/OpenVPN
sudo pacman -S openvpn ca-certificates
cd /etc/openvpn
sudo wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
sudo unzip ovpn.zip
sudo rm ovpn.zip
sudo pacman -S networkmanager-openvpn

# FUCK
pip install fuck

# .profile
ln dotfiles/.profile ~/

# disable mouse acceleration
ln dotfiles/mouseAccelerationZero.desktop ~/.config/autostart/

# colorls
sudo pacman -S ruby
gem install colorls

# vim and vimrc
sudo pacman -S vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

