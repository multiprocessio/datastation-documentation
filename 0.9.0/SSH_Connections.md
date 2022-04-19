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

DataStation picks a default value for the Username and Private Key
fields if the field is left blank.

| Field       | Default                                                                                                                             |
|-------------|-------------------------------------------------------------------------------------------------------------------------------------|
| Username    | Current system username (i.e. $USER on Linux and macOS)                                                                             |
| Private Key | Checks each of these 3 files in order and picks the first one exists if any exist: ~/.ssh/id_rsa, ~/.ssh/id_dsa, ~/.ssh/id_ed25519. |
