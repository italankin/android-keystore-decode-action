FROM alpine:3.13.1

RUN apk add --no-cache gnupg

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
