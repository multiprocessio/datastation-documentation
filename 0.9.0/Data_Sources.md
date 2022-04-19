# Data Sources

A data source is a definition of database credentials. You must fill
out a data source to connect to a database using [Database
panels](./Panels/Database_Panels.md). You do not need to define a data
source for files and HTTP endpoints.

![A PostgreSQL data source](/tutorials/basic-data-source.png)

Once you have created a data source, you can create a [Database
panel](./Panels/Database_Panels.md) to run queries against the data
source.

# With Server

If you define an [SSH connection](./SSH_Connections.md) you will be
able to select the server to proxy your database connection through an
SSH tunnel.

![A PostgreSQL data source with proxy](/tutorials/basic-data-source-proxy.png)
