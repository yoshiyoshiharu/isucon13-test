#!/bin/bash

set -e

USERS=("yoshiyoshiharu" "KoyamaShimpei" "taiwork")
REPOSITORY_NAME="git@github.com:yoshiyoshiharu/isucon14-qualify.git"

# authorized_keysにgithubに登録しているssh公開鍵を登録する
for user in ${USERS[@]}; do
  echo $(curl -fs "https://github.com/${user}.keys") >> ~/.ssh/authorized_keys
done
echo "authorized_keysにGithubのSSH公開鍵を登録しました"

# git initからremoteとの紐づけまで
git init
git remote add origin $REPOSITORY_NAME
git pull -u origin master
