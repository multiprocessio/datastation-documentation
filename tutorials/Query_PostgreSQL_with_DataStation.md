# Run PostgreSQL in Docker and query with DataStation

This tutorial walks through running PostgreSQL in Docker, creating a
table and loading it with data from a CSV, and finally querying the
database in DataStation.

# Database initialization [Optional]

If you want to follow along with this tutorial verbatim, in your
terminal start PostgreSQL in Docker:

```bash
$ cid=$(docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres)
```

Now create a table for some address data.

```bash
$ docker exec $cid psql -U postgres -c 'CREATE TABLE addresses (id BIGINT, location_id BIGINT, address_1 TEXT, address_2 TEXT, city TEXT, state_province TEXT, postal_code TEXT, country TEXT);'
CREATE TABLE
```

Then download a [CSV of sample
addresses](https://raw.githubusercontent.com/codeforamerica/ohana-api/master/data/sample-csv/addresses.csv)
from Github, copy it into the Docker container, and load the addresses
into this new table.

```bash
$ curl -LO https://raw.githubusercontent.com/codeforamerica/ohana-api/master/data/sample-csv/addresses.csv
$ docker cp ./addresses.csv $cid:/tmp/addresses.csv
$ docker exec $cid psql -U postgres -c "COPY addresses FROM '/tmp/addresses.csv' DELIMITER ',' CSV HEADER;"
COPY 21
```

And we're done!

# Data source setup

Now inside DataStation create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you can easily find it later. And select
PostgreSQL in the Vendor dropdown.

![Creating a PostgreSQL data source](/tutorials/create-postgresql-data-source.png)

## Host field

If you are running the host on `localhost:5432` (the default) and you
have SSL set up, you can leave the host field blank.

Additional notes:

* If SSL is not on then you can set the host field to
  `?sslmode=disable`. This is a shorthand for
  `localhost?sslmode=disable` which is a shorthand for
  `localhost:5432?sslmode=disable`.
* If the port is 5432 then you can always omit the colon and port

In this case since we are not running with TLS we must specify
`?sslmode=disable`.

## Other fields

Next we set the database to `postgres`, the username to `postgres`,
and the password to `postgres` (we specified this when we started the
Docker container).

![Filled out PostgreSQL data source](/tutorials/postgresql-data-source-filled.png)

## SSH Proxy [Optional]

If you want connect to a PostgreSQL database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-postgresql-database-panel.gif)

## Run a query

Enter your query and hit play!

![Run PostgreSQL query](/tutorials/run-postgresql-query.gif)

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-postgresql-panel-results.png)

# Display results

After running the query, a table button will appear below the panel
next to the New Panel button. Click it to generate a table based on
this panel.

![Render results](/tutorials/graph-postgresql-database-results.gif)

From here you can do more analysis or export results to clipboard, a
file, HTTP server, etc.
