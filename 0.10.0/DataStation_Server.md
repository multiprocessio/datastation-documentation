# DataStation Server CE

# Prerequisites

* x86_64 Linux machine
* Nodejs 16

# Install

Download [datastation-server-x64-0.10.0.tar.gz](https://github.com/multiprocessio/datastation/releases/download/0.10.0/datastation-server-x64-0.10.0.tar.gz).

```
curl -LO https://github.com/multiprocessio/datastation/releases/download/0.10.0/datastation-server-x64-0.10.0.tar.gz
tar xvzf datastation-server-*.tar.gz
```

## First-time

If you are installing DataStation on a server for the first time you
can run the included install script.

This will override the configuration file at
`/etc/datastation/config.yaml` and systemd configurations. So if you
have already created or modified those files do not run this script.

```
./datastation/release/install.sh
```

This install script will create a new `datastation` Linux user if it
does not exist and will create a systemd service for DataStation and a
systemd timer for DataStation exports.

## Upgrade

To upgrade an existing DataStation Server instance, 

# Configuration

Next edit `/etc/datastation/config.yaml` and replace the defaults with your own settings.

```
auth:
  sessionSecret: "some good long random string" # Any strong random string for signing sessions
  openId:
    realm: https://accounts.google.com # Or some other realm
    clientId: "my id"
    clientSecret: "my secret"

server:
  port: 443
  address: localhost
  publicUrl: https://datastation.mydomain.com # The address users will enter into the browser to use the app
  tlsKey: /home/server/certs/datastation.key.pem # Can be left blank and set at the reverse-proxy level if desired
  tlsCert: /home/server/certs/datastation.cert.pem

database:
  address: localhost # Address of your PostgreSQL instance
  username: datastation # Should be a dedicated PostgreSQL user for DataStation
  password: "some good password"
  database: datastation # Should be a dedicated database within PostgreSQL for DataStation
```

And then restart the systemd service: `sudo systemctl restart datastation`.
