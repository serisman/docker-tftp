FROM alpine:latest

RUN apk --update --no-cache add tftp-hpa
RUN adduser -D tftp

EXPOSE 69/udp
VOLUME /tftp

CMD ["sh", "-c", "busybox syslogd -n -O /dev/stdout & in.tftpd -Lvvv -u tftp --secure /tftp"]
