#!/bin/bash

# 默认值
default_version="1.0.0"
default_site_title="Alist"
default_logo="https://cdn.jsdelivr.net/gh/alist-org/logo@main/logo.svg"
default_hide_files=""

# 提示用户输入
read -p "请输入 version (默认: $default_version): " version
version=${version:-$default_version}

read -p "请输入 site_title (默认: $default_site_title): " site_title
site_title=${site_title:-$default_site_title}

read -p "请输入 logo (默认: $default_logo): " logo
logo=${logo:-$default_logo}

read -p "请输入 hide_files (默认: 空): " hide_files
hide_files=${hide_files:-$default_hide_files}

# 下载 B 文件
wget -O /modify.sh "https://gh-proxy.com/https://raw.githubusercontent.com/HuTuTuOnO/XYAlist/main/modify.sh"

# 修改 B 文件
sed -i "s/\$version/$version/" /modify.sh
sed -i "s/\$site_title/$site_title/" /modify.sh
sed -i "s/\$logo/$logo/" /modify.sh
sed -i "s/\$hide_files/$hide_files/" /modify.sh

# 修改权限
chmod +x /modify.sh

# 将 B 文件添加到 crontab
(crontab -l 2>/dev/null; echo "*/10 0,15-23 * * * /modify.sh") | crontab -
