#!/bin/bash

# 数据库文件路径
DB_PATH="data.db"

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
SET value = '$hide_files'
WHERE key = 'hide_files';

UPDATE x_meta
SET hide = ''
WHERE hide IS NOT NULL AND hide != '';

UPDATE x_meta
SET readme = ''
WHERE readme IS NOT NULL AND readme != '';
EOF

echo "更新完成！"
