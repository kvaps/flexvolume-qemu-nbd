FROM alpine
ADD install.sh nbd /
CMD ["/install.sh"]
