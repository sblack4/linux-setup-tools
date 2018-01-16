#!/bin/bash
# 
# sets up environment in new server


# asks user before executing command
#   default is FALSE 
declare INTERACTIVE=

# defaults to home of logged in user 
#   but can be specified with -d flag
declare HOME_DIRECTORY=~ 

####################################
# List of Commands to be Executed  #
####################################
declare -r COMMANDS=(
    # my .vimrc
    "curl https://gist.githubusercontent.com/sblack4/e5a8dda8c8b0f78984657c05f6712ae3/raw/c21eb0fa7d0b4e3e550ce484fd5773fe40ed5a21/.vimrc >> $HOME_DIRECTORY/.vimrc",

    # my .bashrc
    "curl https://gist.githubusercontent.com/sblack4/e5a8dda8c8b0f78984657c05f6712ae3/raw/c21eb0fa7d0b4e3e550ce484fd5773fe40ed5a21/.bashrc >> $HOME_DIRECTORY/.bashrc",

    # install my favs
    "yum install -y vim wget mlocate"
)
####################################


function loop_through_commands() {
    for command in "${COMMANDS[@]}"
    do
        if [ $INTERACTIVE ]; then 
            echo "Execute the below command? Type n to skip"
            echo "    $command"
            read ouput 
            if [$output == "n"]; then
                continue
            fi 
        fi 

        eval_command $command
    done

}

# takes in command to be executed, 
#   and then executes it 
# @param {string} bash command
function eval_command() {
    local command=$1
    local command_out=$( command 2>&1 )
    local command_rc=$?

    { # try
        echo "Running $command..."
        eval $command
        echo "Success, $command_out"
    } || { # catch
        echo "Command '$command' failed "
        echo "stder $command_rc"
    }
}

function usage() {
cat << EOF
Usage: $0 [-ih] [-d directory]
    -d $HOME_DIRECTORY   set up in $HOME_DIRECTORY
    -i                   interactive
    -h                   displays help / usage  
EOF
}

get_opts() {
    while [ "$1" != "" ]; do
    case $1 in
        -d | --directory ) 
                    shift # shift to get following arg
                    HOME_DIRECTORY=$1
                    ;;

        -i | --interactive )  
                    INTERACTIVE=1
                    ;;

        -e | --errors ) 
                    stop_on_error
                    ;;

        -h | --help )
                    usage
                    exit
                    ;;

        * )         usage
                    exit 1
    esac
    shift
    done
}

main() {

    get_opts "$@"

    loop_through_commands

    exit 0
}

main "$@"
