FROM ubuntu:22.04

# جلوگیری از درخواست‌های تعاملی سیستم‌عامل
ENV DEBIAN_FRONTEND=noninteractive

# نصب پیش‌نیازها
RUN apt-get update && apt-get install -y curl wget socat tzdata && \
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# نصب سنایی بدون پرسش سوال
RUN curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh > install.sh && \
    chmod +x install.sh && \
    echo "y" | ./install.sh

# اجرای پنل در پس‌زمینه و نگه داشتن کانتینر روشن
CMD ["/usr/local/x-ui/x-ui", "start"]
