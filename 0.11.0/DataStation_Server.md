# DataStation Server CE

NOTE: The Server system and these instructions are in early
stages. There may be bugs and it would help if you report them on
Github or Discord.

DataStation can run as a server giving you access to all your projects
from any machine that can connect to the server. All scripts and
queries run on the server rather than on your laptop.

This is useful if you frequently switch machines or if you want to
work on DataStation projects as a team.

The server supports OpenID authentication. The Community Edition does
not have an advanced concept of users. It will hook into your OpenID
system but does not come with access control beyond existing
validating with your OpenID provider.

However, coming shortly will be support for read-only dashboards built
on top of your projects. And coming shortly will also be the ability
to schedule recurring runs and exports of your projects to email.

# Prerequisites

* x86_64 Linux machine
* Nodejs 16

# Install

Download [datastation-server-x64-0.10.1.tar.gz](https://github.com/multiprocessio/datastation/releases/download/0.10.1/datastation-server-x64-0.10.1.tar.gz).

```
curl -LO https://github.com/multiprocessio/datastation/releases/download/0.10.1/datastation-server-x64-0.10.1.tar.gz
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
does not exist and will create a systemd service for DataStation.

It will start a `datastation` systemd service but it will not succeed
because you will need to edit the config file manually.

# Configuration

Next edit `/etc/datastation/config.yaml` and replace the defaults with your own settings.

```yaml
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
```

Make sure to replace the `sessionSecret` with some random string.

## Privileged ports

If you want to run the server on ports below 1024 (i.e. privileged
ports like 80 and 443), you will need to give `node` bind
capabilities:

```bash
$ setcap 'cap_net_bind_service=+ep' $(which node)
```

## Authentication

If you want to disable authentication, you can omit the entire
`openId` section. But this is very dangerous! Since DataStation runs
scripts on the server if you disable authentication and make your
server public then anyone has access to do anything on the server.

Any OpenID provider should work, but only Google auth has been tested.

## Applying settings

Once you are done editing settings, restart the systemd service:
`systemctl restart datastation`.

# Upgrade

To upgrade an existing DataStation Server instance simply overwrite
the files in the tar archive. For example if you first used the
install script that comes with DataStation, it moves the datastation
directory into `/usr/share/datastation`.

So you can just delete that directory and then `mv datastation
/usr/share/datastation`.

Finally, restart the systemd service `systemctl restart datastation`.

Migrations are automatically run on startup.

# Logs

You can view DataStation logs by running `journalctl -efu
datastation`.
