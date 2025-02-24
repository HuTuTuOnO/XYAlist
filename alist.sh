#!/bin/bash

# 默认值
default_version="1.0.0"
default_site_title="Alist"
default_logo="https://cdn.jsdelivr.net/gh/alist-org/logo@main/logo.svg"
default_customize_head=""

# 提示用户输入
read -p "请输入 version (默认: $default_version): " version
version=${version:-$default_version}

read -p "请输入 site_title (默认: $default_site_title): " site_title
site_title=${site_title:-$default_site_title}

read -p "请输入 logo (默认: $default_logo): " logo
logo=${logo:-$default_logo}

read -p "请输入 customize_head (默认: 空): " customize_head
customize_head=${customize_head:-$default_customize_head}

# 下载 B 文件
wget -O /modify.sh "https://ghfast.top/https://raw.githubusercontent.com/HuTuTuOnO/XYAlist/main/modify.sh"

# 修改 B 文件
sed -i "s|\$version|$version|g" /modify.sh
sed -i "s|\$site_title|$site_title|g" /modify.sh
sed -i "s|\$logo|$logo|g" /modify.sh
sed -i "s|\$customize_head|$customize_head|g" /modify.sh

# 修改权限
chmod +x /modify.sh

# 检查是否已在 crontab 中
crontab_entry="*/10 0,15-23 * * * /modify.sh"
(crontab -l | grep -Fxq "$crontab_entry") || (crontab -l 2>/dev/null; echo "$crontab_entry") | crontab -
