# استفاده از نسخه سبک اوبونتو
FROM ubuntu:22.04

# نصب پیش‌نیازهای پنل سنایی
RUN apt-get update && apt-get install -y curl wget systemd && \
    curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh | bash

# تنظیم پورت پیش‌فرض
EXPOSE 2052

# اجرای پنل در لحظه استارت
CMD ["/usr/local/x-ui/x-ui", "start"]
