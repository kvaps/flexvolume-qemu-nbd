FROM ubuntu:16.04
RUN apt-get update \
 && apt-get -y install jq open-iscsi tgt \
 && apt-get clean
ADD install.sh sheepdog-iscsi /
CMD ["/install.sh"]
