FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# نصب پیش‌نیازها
RUN apt-get update && apt-get install -y curl wget socat tzdata && \
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime

# نصب پنل سنایی
RUN curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh > install.sh && \
    chmod +x install.sh && \
    echo "y" | ./install.sh

# ترفند برای نگه داشتن کانتینر روشن: 
# اجرای پنل و سپس نگه داشتن یک پردازش بیکار (tail) تا کانتینر خاموش نشود
CMD /usr/local/x-ui/x-ui start && tail -f /dev/null
