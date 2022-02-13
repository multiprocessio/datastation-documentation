# Run Yugabyte in Docker and query with DataStation

# Database initialization [Optional]

If you want to follow along with this tutorial literally, in your
terminal start Yugabyte in Docker:

```bash
$ cid=$(docker run -d -p 5433:5433 yugabytedb/yugabyte:latest bin/yugabyted start)
```

Yugabyte comes with some great sample data and a [great
guide](https://docs.yugabyte.com/latest/quick-start/explore/ysql/) for
loading this data, so we'll follow that.

First we create a database and set up some tables.

```bash
$ docker exec -it $cid ysqlsh
ysqlsh (11.2-YB-2.11.2.0-b0)
Type "help" for help.

yugabyte=# CREATE DATABASE yb_demo;
CREATE DATABASE
You are now connected to database "yb_demo" as user "yugabyte".
yb_demo=# \i share/schema.sql;
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
```

Now the Yugabyte guide suggests loading data for four different tables
but for this guide let's just load one table.

```bash
yb_demo=# \i share/products.sql;
...
INSERT 0 1
```

And we're done!

# Data source setup

Now inside DataStation create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select Yugabyte
in the Vendor dropdown.

![Creating a Yugabyte data source](/tutorials/create-yugabyte-data-source.png)

## Host field

If you are connecting to `localhost:5433` (the default), you can
leave the host field blank. If your port is 5433 then you can always
omit the colon and port and just specify the address.

However:! when you are connecting to any PostgreSQL wire-compatible
database in DataStation (including Yugabyte) and you are connecting
without TLS, you must explicitly opt out of TLS by specifying the
query argument `?sslmode=disable`.

## Other fields

The database is the one we just created, `yb_demo`. And the default
username and password for the Yugabyte docker image is `yugabyte` and
`yugabyte`.

![Filled Flux data source](/tutorials/yugabyte-data-source-filled.png)

## SSH Proxy [Optional]

If you want connect to a Yugabyte database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-yugabyte-database-panel.gif)

## Run a query

Enter in `SELECT category, COUNT(1) AS count FROM products GROUP BY
category ORDER BY COUNT(1) DESC` and hit play!

![Run Yugabyte query](/tutorials/run-yugabyte-query.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-yugabyte-panel-results.png)

# Graph the results

After running the query, a graph button will appear below the panel
next to the New Panel button. Click it to generate a graph based on
this panel.

DataStation tries to guess which columns to graph but it doesn't
always get it right. Select the name and age columns for the x and y
dimensions respectively.

![Graph database results](/tutorials/graph-yugabyte-database-results.gif)

Note: when the query panel changes in the future you'll need to
manually re-run the graph panel.
