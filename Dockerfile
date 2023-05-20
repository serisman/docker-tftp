FROM alpine:latest

ENV TFTPD_BIND_ADDRESS="0.0.0.0:69"
ENV TFTPD_EXTRA_ARGS=""

RUN apk --update --no-cache add tftp-hpa
RUN adduser -D tftp

EXPOSE 69/udp
VOLUME /tftp

ENTRYPOINT ["in.tftpd"]
#CMD ["-L", "-vvv", "--address", "$TFTPD_BIND_ADDRESS", "--secure", "/tftp"]
CMD ["-L", "-vvv", "-u", "tftp", "--secure", "/tftp"]
