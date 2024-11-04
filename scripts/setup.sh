#!/bin/bash

set -e

USERS=("yoshiyoshiharu" "KoyamaShimpei" "taiwork")
REPOSITORY_NAME="git@github.com:yoshiyoshiharu/isucon14-qualify.git"
GIT_USER_NAME=yoshiyoshiharu
GIT_USER_EMAIL=haruki.osaka.u@gmail.com

# authorized_keysにgithubに登録しているssh公開鍵を登録する
for user in ${USERS[@]}; do
  echo $(curl -fs "https://github.com/${user}.keys") >> ~/.ssh/authorized_keys
done
echo "authorized_keysにGithubのSSH公開鍵を登録しました"

# git initからremoteとの紐づけまで
git init
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL
git config --global core.editor "vim"
git remote add origin $REPOSITORY_NAME
