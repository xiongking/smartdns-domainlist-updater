#!/bin/sh

# GitHub 仓库的 Raw 文件基础 URL
BASE_URL="https://raw.githubusercontent.com/xiongking/smartdns-domainlist-updater/main"
DEST_DIR="/etc/smartdns/domain-set"

curl -sS "${BASE_URL}/oversea_domainlist.conf" -o "${DEST_DIR}/oversea_domainlist.conf"
curl -sS "${BASE_URL}/domestic_domainlist.conf" -o "${DEST_DIR}/domestic_domainlist.conf"

pkill -f '/usr/sbin/smartdns -f -c /etc/smartdns/smartdns.conf'

sleep 1

nohup /usr/sbin/smartdns -f -c /etc/smartdns/smartdns.conf >/dev/null 2>&1 &
