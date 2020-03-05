function install_neovim(){
	add-apt-repository ppa:neovim-ppa/unstable
	apt-get update
	apt-get install -y python-dev python-pip python3-dev python3-pip
	apt-get install -y neovim 
}

function set_up() {
    mkdir -p ~/.config/nvim
    mv init.vim  ~/.config/nvim/
	echo "alias vim=nvim" >> ~/.bashrc
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    python2 -m pip install --user --upgrade pynvim # Require at least python2.7
    python3 -m pip install --user --upgrade pynvim # Minimum python3.4
}


install_neovim

set_up

# The next thing you are going todo is: 
# $ source ~/.basrc
# Then enter the vim and use :PlugInstall and :qa after it's finished
# Enter the vim again and use :checkhealth provider to check if everything went well
