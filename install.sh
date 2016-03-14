#!/bin/bash
emacs_git_dir="~/emacs-config"
emacs_conf_dir="~/.emacs.d"
if [ -d $emacs_conf_dir ]
then
    rm $emacs_conf_dir
    ln -s $emacs_git_dir/.emacs.d $emacs_conf_dir
fi
    
