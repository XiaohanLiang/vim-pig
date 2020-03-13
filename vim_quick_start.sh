#! /bin/bash

location=""

function install_neovim(){
	add-apt-repository ppa:neovim-ppa/unstable
	apt-get update
	apt-get install -y python-dev python-pip python3-dev python3-pip
	apt-get install -y neovim 
}

function install_golang_113(){
    
    wget https://studygolang.com/dl/golang/go1.13.8.linux-amd64.tar.gz
    tar -zxvf go1.13.8.linux-386.tar.gz
    if [ ! -d /go ]
    then
        location="/go"
    else
        echo "/go exists already so... we make it /go113 instead :P"
        location="/go113"
        mkdir $location
    fi
    mv go/* $location
    echo "GOROOT=$location" >> ~/.bashrc
    cd /usr/bin
    ln -s $location/bin/go .
    cd -
    go version
}

function set_up_nvim() {
    mkdir -p ~/.config/nvim
    mv init.vim  ~/.config/nvim/
	echo "alias vim=nvim" >> ~/.bashrc
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    python2 -m pip install --user --upgrade pynvim # Require at least python2.7
    python3 -m pip install --user --upgrade pynvim # Minimum python3.4
}

function set_up_vim_go(){
    export GOPROXY="https://goproxy.cn"
    export GO111MODULE=on
    if [ ! -n $location ]
    then
        echo "setup GOBIN and come back :("
        exit 1 
    fi
    export GOBIN="$location/bin"
    echo "installing guru"
    go get -u golang.org/x/tools/cmd/guru
    echo "installing gogetdoc"
    go get -u github.com/zmb3/gogetdoc
    echo "installing asmfmt"
    go get -u github.com/klauspost/asmfmt/cmd/asmfmt
    echo "installing gopls"
    go get -u golang.org/x/tools/gopls
    echo "installing fillstruct"
    go get -u github.com/davidrjenni/reftools/cmd/fillstruct
    echo "installing godef"
    go get -u github.com/rogpeppe/godef
    echo "installing motion"
    go get -u github.com/fatih/motion
    echo "installing errcheck"
    go get -u github.com/kisielk/errcheck
    echo "installing dlv"
    go get -u github.com/go-delve/delve/cmd/dlv
    echo "installing go-rename"
    go get -u golang.org/x/tools/cmd/gorename
    echo "installing iferr"
    go get -u github.com/koron/iferr
    echo "installing gotags"
    go get -u github.com/jstemmer/gotags
    echo "installing impl"
    go get -u github.com/josharian/impl
    echo "installing goimports"
    go get -u golang.org/x/tools/cmd/goimports
    echo "installing lint"
    go get -u github.com/golangci/golangci-lint/cmd/golangci-lint@master
    echo "installing modify-tags"
    go get -u github.com/fatih/gomodifytags
    echo "installing keyify"
    go get -u honnef.co/go/tools/cmd/keyify
    echo "installing golint"
    go get -u golang.org/x/lint/golint
}

# install_neovim
# install_golang_113
# set_up_nvim
# set_up_vim_go

# The next thing you are going todo is: 
# $ source ~/.basrc
# Then enter the vim and use :PlugInstall and :qa after it's finished
# Enter the vim again and use :checkhealth provider to check if everything went well
