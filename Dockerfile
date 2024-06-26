FROM ubuntu:22.04
ENV TZ=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's#http://.*ubuntu.com#http://mirrors.aliyun.com#g' /etc/apt/sources.list && \
    apt update --allow-insecure-repositories --allow-unauthenticated && \
    apt install xvfb wget x11vnc psmisc -y --allow-unauthenticated && \
    apt-get install -y libglib2.0-0 libatomic1 libxrandr2 libxkbcommon0 libxkbcommon-dev libxkbcommon-x11-0 libxcb-glx0 libxcb-xkb1 libxcb-randr0 libxcb-icccm4 libxcb-shm0 libxcb-render0 libxcb-image0 libxcb-xfixes0 libxcb-shape0  libxcb-sync1 libxcb-render-util0 libxcb-keysyms1 libfontconfig1 libfreetype6 libdbus-1-3 libfontconfig1 libfreetype6 libdbus-1-3  libnss3 libnspr4  libx11-xcb1 libgbm1 libpango-1.0-0 libcairo2 libatk1.0-0  libasound2 libatk-bridge2.0-0 --allow-unauthenticated && \
    apt-get install -y locales xfce4 fcitx5 fcitx5-chinese-addons dbus-x11  --allow-unauthenticated && \
    locale-gen zh_CN.UTF-8 && \
    update-locale LANG=zh_CN.UTF-8 && \
    apt-get install -y ttf-wqy-zenhei ttf-wqy-microhei xfonts-wqy  --allow-unauthenticated

# start startxfce4

ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:en_US:en \
    LC_ALL=zh_CN.UTF-8 \
    XMODIFIERS=@im=fcitx \
    GTK_IM_MODULE=fcitx  \
    QT_IM_MODULE=fcitx


RUN mkdir /root/wxbot
WORKDIR /root/wxbot/

RUN wget  https://pic.wonderkun.cc/attachments/wechat-beta_1.0.0.145_amd64.fixed.deb -O /tmp/wechat-beta_1.0.0.145_amd64.fixed.deb
COPY ./start.sh ./
RUN  chmod +x start.sh
RUN dpkg -i /tmp/wechat-beta_1.0.0.145_amd64.fixed.deb

CMD ["/root/wxbot/start.sh"]