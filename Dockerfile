FROM ubuntu:22.04

# نصب پیش‌نیازها
RUN apt-get update && apt-get install -y curl wget socat

# نصب پنل سنایی و اجرای مستقیم
RUN curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh | bash

# در اینجا به جای systemd، خودِ فایل اجرایی را مستقیم صدا می‌زنیم
# توجه: x-ui معمولاً در /usr/local/x-ui/ قرار دارد
CMD ["/usr/local/x-ui/x-ui"]
