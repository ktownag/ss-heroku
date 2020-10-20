FROM debian:sid

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget unzip qrencode\
    && apt install -y shadowsocks-libev\
    && apt install -y nginx\
    && apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates\
    && curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -\
    && sudo apt -y install nodejs yarn\
    && apt autoremove -y

COPY wwwroot.tar.gz /wwwroot/wwwroot.tar.gz
RUN git clone https://github.com/elecV2/elecV2P.git /wwwroot/elec
COPY conf/ /conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD /entrypoint.sh
