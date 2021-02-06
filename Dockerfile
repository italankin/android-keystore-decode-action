FROM alpine:3.13.1

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
