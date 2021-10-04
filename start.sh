#!/bin/bash
# permissions


# 检查config配置文件，并创建
if [ ! -e "/config/qBittorrent/config/qBittorrent.conf" ] ;  then 
mkdir -p /config/qBittorrent/config/
cp /usr/local/qbittorrent/defaults/qBittorrent.conf  /config/qBittorrent/config/qBittorrent.conf
fi



git clone https://${git_token}:x-oauth-basic@github.com/666wcy/new_q6.git
mkdir /upload/
mv /new_q6/upload/* /upload/
chmod 0777 /upload/ -R
rm -rf /new_q6


nohup yes "" | main --webui-port=8080  --profile=/config  &

python3 /upload/nginx.py
nginx -c /etc/nginx/nginx.conf
nginx -s reload

python3 /upload/config.py
python3 /upload/dingshi.py