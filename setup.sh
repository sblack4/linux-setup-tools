#!/bin/bash
# 
# sets up environment in new server

INTERACTIVE=
HOME_DIRECTORY=~


usage() {
cat << EOF
Usage: $0 [-ih] [-d directory]
    -d --directory $HOME_DIRECTORY   set up in $HOME_DIRECTORY
    -i                             interactive
    -h                             displays help / usage  
EOF
}

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
  exit 1
}

get_dot_files() {

    cd $HOME_DIRECTORY

    echo "setting up dotfiles for $USER in $HOME_DIRECTORY"

    echo "$(PWD)"

    curl https://gist.githubusercontent.com/sblack4/e5a8dda8c8b0f78984657c05f6712ae3/raw/c21eb0fa7d0b4e3e550ce484fd5773fe40ed5a21/.vimrc >> .vimrc

    curl https://gist.githubusercontent.com/sblack4/e5a8dda8c8b0f78984657c05f6712ae3/raw/c21eb0fa7d0b4e3e550ce484fd5773fe40ed5a21/.bashrc >> .bashrc

    

}

install_necessary_programs() {
    # I'll be using yum, this can be changed

    sudo yum install -y vim wget mlocate 
}

get_opts() {
    while [ "$1" != "" ]; do
    case $1 in
        -d | --directory ) shift # shift to get following arg
                    HOME_DIRECTORY=$1
                    ;;
        -i | --interactive )  INTERACTIVE=1
                    ;;
        -h | --help )       usage
                    exit
                    ;;
        * )           usage
                    # exit 1
    esac
    shift
    done
}

main() {

    get_opts "$@"

    get_dot_files

    install_necessary_programs

    exit 0
}

main "$@"
