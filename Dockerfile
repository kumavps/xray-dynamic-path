FROM --platform="amd64" alpine:latest

WORKDIR /root

RUN set -ex \
	&& apk add --no-cache tzdata ca-certificates \
	&& mkdir -p /var/log/xray /usr/share/xray \
	&& wget -O /usr/bin/xray https://github.com/dharak36/Xray-core/releases/download/v1.0.0/xray.linux.64bit \
    && chmod +x /usr/bin/xray \
	&& wget -O /usr/share/xray/geosite.dat https://github.com/v2fly/domain-list-community/releases/latest/download/dlc.dat \
	&& wget -O /usr/share/xray/geoip.dat https://github.com/v2fly/geoip/releases/latest/download/geoip.dat

ENV TZ=Asia/Jakarta

CMD [ "/usr/bin/xray", "-config", "/etc/xray/config.json" ]
