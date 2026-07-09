FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# نصب ابزارهای پایه
RUN apt-get update && apt-get install -y curl wget socat tzdata && \
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime

# نصب پنل سنایی
RUN curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh > install.sh && \
    chmod +x install.sh && \
    echo "y" | ./install.sh

# تنظیم پورت و اجرای پنل در حالت وب (نکته اصلی اینجاست)
# ما به صورت مستقیم فایل اجرایی را صدا می‌زنیم و پارامترها را تنظیم می‌کنیم
CMD /usr/local/x-ui/x-ui setting -port 2052 && /usr/local/x-ui/x-ui start
