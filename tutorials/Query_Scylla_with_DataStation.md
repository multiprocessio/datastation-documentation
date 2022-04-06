# Run Scylla in Docker and query with DataStation

This tutorial walks through running Scylla in Docker and querying the
database in DataStation.

# Database initialization [Optional]

If you want to follow along with this tutorial verbatim, in your
terminal start Scylla in Docker:

```bash
$ cid=$(docker run -d -p 9042:9042 scylladb/scylla --smp 1 --authenticator PasswordAuthenticator --broadcast-address 127.0.0.1 --listen-address 0.0.0.0 --broadcast-rpc-address 127.0.0.1)
```

Then use the started container id to create a new keyspace via
`cqlsh`, using the default credentials, within the container (you may
need to wait a few seconds for the container to initialize before
running this):

```bash
$ docker exec "$cid" cqlsh -u cassandra -p cassandra -e "CREATE KEYSPACE test WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};"
```

# Data source setup

Now inside DataStation create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select ScyllaDB
in the Vendor dropdown.

![Creating a Scylla data source](/tutorials/create-scylla-data-source.png)

## Host field

If you are connecting to `localhost:9042` (the default), you can
leave the host field blank. If your port is 9042 then you can always
omit the colon and port and just specify the address.

## Other fields

Next fill in the username and authentication fields if
necessary. Leaving these fields blank is ok too.

## SSH Proxy [Optional]

If you want connect to a Scylla database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-scylla-database-panel.gif)

## Run a query

Copy the following query and hit play!

```sql
SELECT * FROM system.local;
```

![Run Scylla query](/tutorials/run-scylla-query.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-scylla-panel-results.png)

# Display results

After running the query, a table button will appear below the panel
next to the New Panel button. Click it to generate a table based on
this panel.

![Render results](/tutorials/graph-scylla-database-results.gif)

Note: when the query panel changes in the future you'll need to
manually re-run the table panel.
