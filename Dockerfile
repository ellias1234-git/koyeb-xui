FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PORT=2052

# نصب پیش‌نیازها
RUN apt-get update && apt-get install -y \
    curl wget tzdata ca-certificates \
    sudo net-tools iproute2 \
    && rm -rf /var/lib/apt/lists/*

# ساخت fake systemctl که فقط ok برمی‌گردونه
RUN printf '#!/bin/sh\nexit 0\n' > /usr/bin/systemctl && \
    chmod +x /usr/bin/systemctl

# ساخت fake service
RUN printf '#!/bin/sh\nexit 0\n' > /usr/sbin/service && \
    chmod +x /usr/sbin/service

# دانلود و نصب 3x-ui
RUN curl -sL https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh \
    -o /tmp/install.sh && \
    chmod +x /tmp/install.sh && \
    echo "y" | bash /tmp/install.sh && \
    rm /tmp/install.sh

# تنظیم پورت پیش‌فرض پنل
RUN if [ -f /usr/local/x-ui/bin/config.json ]; then \
        sed -i 's/"port": [0-9]*/"port": '${PORT}'/' /usr/local/x-ui/bin/config.json; \
    fi

# ساخت دایرکتوری‌های لازم
RUN mkdir -p /usr/local/x-ui/bin /usr/local/x-ui /etc/x-ui

WORKDIR /usr/local/x-ui

EXPOSE 2052

# اجرای مستقیم باینری x-ui (بدون systemctl)
CMD ["./x-ui", "run"]
