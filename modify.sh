#!/bin/bash

# 数据库文件路径
DB_PATH="/opt/alist/data/data.db"

# 更新数据库
sqlite3 $DB_PATH <<EOF
UPDATE x_setting_items
SET value = '$version'
WHERE key = 'version';

UPDATE x_setting_items
SET value = '$site_title'
WHERE key = 'site_title';

UPDATE x_setting_items
SET value = '$logo'
WHERE key = 'logo';

UPDATE x_setting_items
SET value = (SELECT value || ' <style>div.hope-c-PJLV.hope-c-PJLV-ikSuVsl-css { display: none; }</style>' FROM x_setting_items WHERE key = 'customize_head')
WHERE key = 'customize_head';
EOF

echo "更新完成！"
