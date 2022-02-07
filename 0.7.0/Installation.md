# Installation

DataStation can run as either a desktop application or as a server
application. You will need to have an OIDC provider if you want to run
the server application. The server application comes with the ability
to run and email reports daily, weekly, or monthly. It also comes with
support for read-only dashboards.

# Desktop

Pre-built binaries are provided for 64-bit x86 machines running macOS,
Windows, and Linux.

## MacOS

Download [datastation-darwin-x64-0.7.0.zip](https://github.com/multiprocessio/datastation/releases/download/0.7.0/datastation-darwin-x64-0.7.0.zip) and unzip. You will need to right-click
the application to click Open so you can run the untrusted
application.

## Windows

Download [datastation-win32-x64-0.7.0.zip](https://github.com/multiprocessio/datastation/releases/download/0.7.0/datastation-win32-x64-0.7.0.zip) and unzip. If you get a warning saying
"Don't run", click "More info" and click "Run anyway". There may be a
few second long security scan the first time you run.

## Linux

Download [datastation-linux-x64-0.7.0.zip](https://github.com/multiprocessio/datastation/releases/download/0.7.0/datastation-linux-x64-0.7.0.zip) and unzip.

## Other

Other systems and architectures may be supported but you will need to
build them yourself. Follow [instructions in the repo](https://github.com/multiprocessio/datastation/blob/main/HACKING.md).

## Light mode/Dark mode

To toggle light or dark mode in the desktop application, you'll need
go to the View menu and click Settings. Switch to the mode you want
and then quit DataStation and start it again.

# Server

Prerequisites:
* x86_64 Linux machine
* Nodejs 16+
* PostgreSQL 11+

Download [datastation-server-x64-0.7.0.zip](https://github.com/multiprocessio/datastation/releases/download/0.7.0/datastation-server-x64-0.7.0.zip).

```
curl -LO https://github.com/multiprocessio/datastation/releases/download/0.7.0/datastation-server-x64-0.7.0.zip
unzip datastation-server-*.zip
./build/release/install.sh
```

This install script will create a new `datastation` Linux user if it
does not exist and will create a systemd service for DataStation and a
systemd timer for DataStation exports.

## Configuration

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
