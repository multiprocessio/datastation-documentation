# SSH Connections

An SSH connection is all the configuration needed to connect to a
server running SSH. Once a connection is set up, it can be used in
[file panels](./Panels/File_Panels.md), [HTTP
panels](./Panels/HTTP_Panels.md), and [database
panels](./Panels/Database_Panels.md) to access remote data.

You can connect using either a username/password combination or an SSH
private key file.

![Basic SSH connection](/tutorials/basic-ssh-connection.png)

# Defaults

DataStation picks a default value for the `Username` and `Private Key`
fields if the field is left blank.

The default value for `Username` is the current system username, i.e. `$USER` on Linux and macOS.

The default value for `Private Key` is the first among these 3 files that exists: `~/.ssh/id_rsa`, `~/.ssh/id_dsa`, `~/.ssh/id_ed25519`.
