
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

# Install tmux and oh-my-tmux
sudo pacman -S tmux
ln dotfiles/.tmux.conf{,.local} $HOME

# SSH
sudo ln dotfiles/sshd_config /etc/ssh/sshd_config
sudo chown root:root dotfiles/sshd_config
sudo chmod 644 dotfiles/sshd_config

# Spotify
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

# Glava
glava --copy-config
rm -f ~/.config/glava/{bars.glsl,rc.glsl}
ln dotfiles/{bars.glsl,rc.glsl} ~/.config/glava/
ln dotfiles/glava.desktop ~/.config/autostart/