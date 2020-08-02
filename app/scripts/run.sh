#!/bin/bash


# ugly but readable lel
# if variable is not empty
if ! [ -z "$CERTFILE" ]; then
    certFile="-certFile $CERTFILE"
fi

if ! [ -z "$DB" ]; then
    db="-db $DB"
fi

if ! [ -z "$HTTPS" ]; then
    https="-https"
fi

if ! [ -z "$KEYFILE" ]; then
    keyFile="-keyFile $KEYFILE"
fi

if ! [ -z "$LISTENIP" ]; then
    listenip="-listenip $LISTENIP"
fi

if ! [ -z "$LISTENPORT" ]; then
    listenport="-listenport $LISTENPORT"
fi

if ! [ -z "$REVERSEPROXY" ]; then
    reverseProxy="-reverseProxy"
fi

if ! [ -z "$REVERSEPROXYPORT" ]; then
    reverseProxyPort="-reverseProxyPort $REVERSEPROXYPORT"
fi

if ! [ -z "$SSHPORT" ]; then
    sshport="-sshport $SSHPORT"
fi

hostname="-hostname $(hostname -f)"

if [ -z "$(ls -A /cert)" ]; then
  echo "[*] Creating fresh certificate"
  openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /cert/cert.crt -keyout /cert/cert.key -subj "/C=US/ST=HackHack/L=HackHack/O=HackHack/CN=www.example.com" >/dev/null 2>&1
else
  echo "[*] Cert exists"
fi

echo [*] "using following settings: "$hostname $https $keyFile $certFile $db $listenip $listenport $reverseProxy $reverseProxyPort $sshport
/app/c2_community-linux-64 $hostname $https $keyFile $certFile $db $listenip $listenport $reverseProxy $reverseProxyPort $sshport
