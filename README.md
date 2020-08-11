# Alpine based hak5c² container

This image packs the amazing Hak5C² software into a secure and light weight alpine-linux based docker container. It is a fork based on https://github.com/LindezaGrey/hak5c2 using more strict docker-compose style and the ability to work with self-signed certs.

## Quick Start
Create _.env_ file in the same directory with the following content and modify values as needed:

```sh
DB=/db/c2.db
HTTPS=True
KEYFILE=/cert/cert.key
CERTFILE=/cert/cert.crt
# change what's needed after this line
HOSTNAME=c2.example.com
LISTENIP=0.0.0.0
LISTENPORT=8080
SSHPORT=2022
# If set, Cloud C2 will work behind a reverse proxy like nginx proxy-companion
REVERSEPROXY=
REVERSEPROXYPORT=
```

Run using docker-compose

```sh
docker-compose up
```

Copy the Setup token which is displayed during setup, otherwise, if startet with _-d_ grep it later:

```sh
docker logs hak5c2 | grep "token"
```

Now you will be able to access the webinterface by navigating to <IP/Hostname>:443.

In case you want to start over fresh remove the files in the _c2DB_ and the _certs_ folder and restart the container. The files will be regenerated now.  


## Deployment options

There are three TLS Options:
* Self signed cert using the cetificate files created during container launch predefined through the _.env_ files
* Reverseproxy using the _.env_ config Options
* LetsEncrypt cert by deleting the predefined _KEYFILE_ and _CERTFILE_ values. -> Keep in Mind that port 80/tcp and 443/tcp need to be reachable (mind NAT and firewalls) for the certificate generation by the LetsEncrypt bot. Also a valid domain is needed.

Of course an unencrypted deployment is possible by removing the _HTTPS_ variable.
