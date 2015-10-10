#!/usr/bin/bash

read -p "git user name: " -e USER_NAME
if [[ -z $USER_NAME ]]; then
    echo -e "You must provide git user name to proceed"
    exit 1
fi

read -p "git user email: " -e USER_EMAIL
if [[ -z $USER_EMAIL ]]; then
    echo -e "You must provide git user email to proceed"
    exit 1
fi

DIR=$("pwd")
ln -s "$DIR/.gitignore" ~/.gitignore
cat .gitconfig | sed "s/{USER_NAME}/$USER_NAME/g; s/{USER_EMAIL}/$USER_EMAIL/g" > ~/.gitconfig
