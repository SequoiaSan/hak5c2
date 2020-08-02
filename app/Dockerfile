FROM alpine:latest

ARG version=2.2.0

# Prepare
RUN apk add ca-certificates wget unzip libc6-compat openssl\
    && wget https://downloads.hak5.org/api/devices/cloudc2-community/firmwares/${version} --no-cache \
    && unzip ${version} \
    && mkdir /app /db /cert \
    && mv c2_community-linux-64 /app \
    && rm c2* ${version} \
    && chmod +x /app/* \
    && apk del wget unzip

COPY ./app/scripts/run.sh /app

EXPOSE 2022 443 80

CMD /bin/ash /app/run.sh
