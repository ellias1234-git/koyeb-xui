#!/bin/bash
# این اسکریپت بعد از اولین اجرا، تنظیمات پنل رو انجام میده

XUI_BIN="/usr/local/x-ui/x-ui"
DB_PATH="/etc/x-ui/x-ui.db"

# ساخت دیتابیس پیش‌فرض اگه نباشه
if [ ! -f "$DB_PATH" ]; then
    $XUI_BIN setting -username admin -password admin -port 2052 -webBasePath /
    echo "Default admin created: admin/admin"
    echo "⚠️  Please change these in the panel!"
fi

# اجرای اصلی
exec $XUI_BIN run
