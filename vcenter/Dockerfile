FROM java:8
MAINTAINER wenford.li <26597925@qq.com>

ARG DISTRO_NAME=/opt/vcenter

RUN mkdir -p $DISTRO_NAME
COPY vcenter $DISTRO_NAME
WORKDIR $DISTRO_NAME

EXPOSE 6868

ENV PATH=$PATH:$DISTRO_NAME/bin

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["vc.sh", "start-foreground"]
