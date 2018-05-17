FROM java:8
MAINTAINER wenford.li <26597925@qq.com>

ARG DISTRO_NAME=/opt/vlock

RUN mkdir -p $DISTRO_NAME
COPY vlock $DISTRO_NAME
WORKDIR $DISTRO_NAME

EXPOSE 3000 3001

ENV PATH=$PATH:$DISTRO_NAME/bin

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["vl.sh", "start-foreground"]
