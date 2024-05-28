path='~/Documents/important-config-files/'

# Setup git
function setup-git() {
# link: https://www.theodinproject.com/lessons/foundations-setting-up-git
sudo apt update
sudo apt upgrade

sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

git --version

git config --global user.name "Avi"
git config --global user.email "avii@hey.com"

git config --global init.defaultBranch main
git config --global color.ui auto

git config --get user.name
git config --get user.email

# if this returns a string, it means you have
# a key stored
ls ~/.ssh/id_ed25519.pub

ssh-keygen -t ed25519 -C "avii@hey.com"
cat ~/.ssh/id_ed25519.pub

cp "$path/.gitconfig" ~/.
cp "$path/.gitignore" ~/.
cp "$path/.gitattributes" ~/.
}

function get-config-files() {
  cd ~/Documents
  git clone https://github.com/binarygit/config-files
}

function copy-aliases() {
  cp "$path/.bash_aliases" ~/.
  cp "$path/.vimrc" ~/.
  cp "$path/.bashrc" ~/.
}

function install-tmux() {
 sudo apt install tmux
 cp "$path/.tmux.conf" ~/.
}

function install-fzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

function install-xterm() {
 curl -o https://invisible-island.net/datafiles/release/xterm.tar.gz
 cp ~/Documents/important-config-files/.Xauthority ~/.
 cp ~/Documents/important-config-files/.Xdefaults ~/.
 cp ~/Documents/important-config-files/.Xresources ~/.
}

function install-ruby() {
  sudo apt install gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev libyaml-dev
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  source ~/.bashrc
}

function install-ruby-build() {
  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
  rbenv -v
  git -C "$(rbenv root)"/plugins/ruby-build pull
  rbenv install 3.2.2
  rbenv global 3.2.2
  ruby -v
}

# Copy over the programmer dvorak ruby keyboard
# Download and setup xterm (copy the Xterm config files)
# Download and setup ruby
# Copy bash profile and aliases over
# setup fuzzy search
# Setup tmux
