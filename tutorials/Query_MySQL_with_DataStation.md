# Run MySQL in Docker and query with DataStation

This tutorial walks through running MySQL in Docker, creating a
table and loading it with data from a CSV, and finally querying the
database in DataStation.

# Database initialization [Optional]

If you want to follow along with this tutorial literally, in your
terminal start MySQL in Docker:

```bash
$ cid=$(docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql)
```

Now create a table for some address data (it may take a few retries to
run this command while MySQL is initializing).

```bash
$ docker exec $cid mysql -uroot -proot mysql --execute 'CREATE TABLE addresses (id BIGINT, location_id BIGINT, address_1 TEXT, address_2 TEXT, city TEXT, state_province TEXT, postal_code TEXT, country TEXT);'
mysql: [Warning] Using a password on the command line interface can be insecure.
```

Then download a [CSV of sample
addresses](https://raw.githubusercontent.com/codeforamerica/ohana-api/master/data/sample-csv/addresses.csv)
from Github, copy it into the Docker container, and load the addresses
into this new table.

```bash
$ curl -LO https://raw.githubusercontent.com/codeforamerica/ohana-api/master/data/sample-csv/addresses.csv
$ docker cp ./addresses.csv $cid:/tmp/addresses.csv
$ docker exec $cid mysql --local-infile=1 -uroot -proot mysql --execute "SET GLOBAL local_infile=1; LOAD DATA LOCAL INFILE '/tmp/addresses.csv' INTO TABLE addresses FIELDS TERMINATED BY ',' ENCLOSED BY '""' IGNORE 1 ROWS;"
mysql: [Warning] Using a password on the command line interface can be insecure.
```

And we're done!

# Data source setup

Now inside DataStation create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you can easily find it later. And select
MySQL in the Vendor dropdown.

![Creating a MySQL data source](/tutorials/create-mysql-data-source.png)

## Host field

If you are connecting to `localhost:3306` (the default), you can
leave the host field blank. If your port is 3306 then you can always
omit the colon and port and just specify the address.

## Other fields

Next we set the database to `mysql`, the username to `root`, and the
password to `root` (we specified this when we started the Docker
container).

![Filled out MySQL data source](/tutorials/mysql-data-source-filled.png)

## SSH Proxy [Optional]

If you want connect to a MySQL database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-mysql-database-panel.gif)

## Run a query

Enter your query and hit play!

![Run MySQL query](/tutorials/run-mysql-query.gif)

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-mysql-panel-results.png)

# Display results

After running the query, a table button will appear below the panel
next to the New Panel button. Click it to generate a table based on
this panel.

![Render results](/tutorials/graph-mysql-database-results.gif)

Note: when the query panel changes in the future you'll need to
manually re-run the table panel.
