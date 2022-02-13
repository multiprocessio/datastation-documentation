# Run SQL Server in Docker and query with DataStation

This tutorial walks through running SQL Server in Docker, creating a
table and loading it with data from a CSV, and finally querying the
database in DataStation.

# Database initialization [Optional]

If you want to follow along with this tutorial literally, in your
terminal start SQL Server in Docker:

```bash
$ cid=$(docker run -d -p 1433:1433 -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong(%)Password" mcr.microsoft.com/mssql/server)
```

Now create a table for some address data (it may take a few retries to
run this command while SQL Server is initializing).

```bash
$ docker exec -t $cid /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "yourStrong(%)Password"
1> CREATE DATABASE test
2> GO
1> USE test
2> GO
1> CREATE TABLE addresses (id BIGINT, location_id BIGINT, address_1 VARCHAR(MAX), address_2 VARCHAR(MAX), city VARCHAR(MAX), state_province VARCHAR(MAX), postal_code VARCHAR(MAX), country VARCHAR(MAX))
2> GO
```

Then download a [CSV of sample
addresses](https://raw.githubusercontent.com/codeforamerica/ohana-api/master/data/sample-csv/addresses.csv)
from Github, copy it into the Docker container, and load the addresses
into this new table.

```bash
$ curl -LO https://raw.githubusercontent.com/codeforamerica/ohana-api/master/data/sample-csv/addresses.csv
$ docker cp ./addresses.csv $cid:/tmp/addresses.csv
$ docker exec -t $cid /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "yourStrong(%)Password"
1> USE test
2> GO
1> BULK INSERT addresses FROM '/tmp/addresses.csv' WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK)
2> GO

(21 rows affected)
```

And we're done!

# Data source setup

Now inside DataStation create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you can easily find it later. And select
SQL Server in the Vendor dropdown.

![Creating a SQL Server data source](/tutorials/create-sqlserver-data-source.png)

## Host field

If you are connecting to `localhost:1433` (the default), you can
leave the host field blank. If your port is 1433 then you can always
omit the colon and port and just specify the address.

## Other fields

Next we set the database to `test`, the username to `SA`, and the
password to `yourStrong(%)Password` (we specified this when we started
the Docker container).

![Filled out SQL Server data source](/tutorials/sqlserver-data-source-filled.png)

## SSH Proxy [Optional]

If you want connect to a SQL Server database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-sqlserver-database-panel.gif)

## Run a query

Enter your query and hit play!

![Run SQL Server query](/tutorials/run-sqlserver-query.gif)

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-sqlserver-panel-results.png)

# Display results

After running the query, a table button will appear below the panel
next to the New Panel button. Click it to generate a table based on
this panel.

![Render results](/tutorials/graph-sqlserver-database-results.gif)

Note: when the query panel changes in the future you'll need to
manually re-run the table panel.
