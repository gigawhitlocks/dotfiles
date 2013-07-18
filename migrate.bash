#!/bin/bash

function backup {
    # recursively generates filename.bak backups
    # on file as first arg

    if [ -e $1.bak ]; then
        backup $1.bak;
    fi
    echo "mv $1 $1.bak";
    mv $1 $1.bak;
}

function symlink_dotfile {
    # creates a symlink from the current directory
    # to ~/.argument

    if [ -e "$HOME/.$1" ]; then
        backup "$HOME/.$1";
    fi
    echo "ln -s $(pwd)/$1; $HOME/.$1";
    ln -s $(pwd)/$1 $HOME/.$1;

}

# if no cmd line args
if [ ${#@} -eq 0 ]; then # what the fuck, bash? 

    # symlink all directories to ~/.directory_name
    for i in $(ls -l | grep -e "^d" | awk -F" " '{print $9;}'); do
        symlink_dotfile $i
    done

# if one cmd line arg
elif [ ${#@} -eq 1 ]; then
    if [ ! -e "$(pwd)/$@" ]; then
	mv $HOME/.$@ $(pwd)/$@
    fi
    symlink_dotfile $@
else
    echo -e "Usage: ./migrate.bash\nWithout arguments creates symlinks to all folders in this directory in the home folder at .directory_name and if called with one argument,
    moves ~/.argument to ./argument and creates a symlink from ~/.argument to ./argument"; 
fi
