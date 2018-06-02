FROM ubuntu:16.04

RUN apt-get update \
 && apt-get -y install tgt \
 && apt-get clean

ENTRYPOINT [ "/usr/sbin/tgtd" ]
CMD [ "-f" ]
