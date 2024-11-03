#!/bin/bash

set -e

# authorized_keysにgithubに登録しているssh公開鍵を登録する
users=("yoshiyoshiharu" "KoyamaShimpei" "taiwork")
for user in ${users[@]}; do
  echo $(curl -fs "https://github.com/${user}.keys") >> ~/.ssh/authorized_keys
done
echo "authorized_keysにGithubのSSH公開鍵を登録しました"
