#!/bin/bash
emacs_config_dir="$HOME/emacs-config/.emacs.d"
emacs_d="$HOME/.emacs.d"
if [ -d $emacs_d ]
then
    rm -rf $emacs_d
fi
ln -s $emacs_config_dir $emacs_d
