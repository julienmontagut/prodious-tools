#!/bin/zsh

# VSCode Remote Container Settings
VSCODE_CONTAINER_DIR=".devcontainer"
PRODIOUS_CONTAINER_ID="dotnet-service"

source ./git-root.sh
git-root
pwd
exit

# While there is a TODO: use git root
while [[ -d ../.git ]]; do
    cd ..
    cd $(git rev-parse --show-toplevel)
done

# Handles the devcontainer update
if [ -d $VSCODE_CONTAINER_DIR ]; then
    # Whenever the container exists we checkout to master and pull
    GITROOT=$(pwd)
    cd $VSCODE_CONTAINER_DIR
    git checkout master
    git pull
    cd $GITROOT
else
    # Whenever the container does not exist we clone it in a subfolder
    git clone "git@github.com:julienmontagut/prodious-container-$PRODIOUS_CONTAINER_ID.git" $VSCODE_CONTAINER_DIR
fi
