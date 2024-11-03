#!/bin/sh
set -ex

# 環境変数
mysql_slow_log="/var/log/mysql/mysql-slow.log"
nginx_access_log="/var/log/nginx/access.log"
systemctl_app="isupipe-ruby.service"

# ログをクリア
sudo truncate -s 0 "${mysql_slow_log}"
sudo truncate -s 0 "${nginx_access_log}"

# サービスの再起動
sudo systemctl restart nginx
sudo systemctl restart mysql
sudo systemctl restart "${systemctl_app}"

echo "MySQLとNginxのログクリアおよびサービスの再起動が完了しました"
