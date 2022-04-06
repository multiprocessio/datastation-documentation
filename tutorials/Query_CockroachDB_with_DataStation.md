# Run CockroachDB in Docker and query with DataStation

This tutorial walks through running CockroachDB in Docker, creating a
table and loading it with data, and finally querying the database in
DataStation.

# Database initialization [Optional]

If you want to follow along with this tutorial verbatim, in your
terminal start CockroachDB in Docker:

```bash
$ cid=$(docker run -d -p 26257:26257 -p 8080:8080 cockroachdb/cockroach start-single-node --insecure)
```

First we create a database and set up a basic employee table.

```bash
$ docker exec -it $cid cockroach sql --insecure
#
# Welcome to the CockroachDB SQL shell.
# All statements must be terminated by a semicolon.
# To exit, type: \q.
#
# Server version: CockroachDB CCL v21.2.8 (x86_64-unknown-linux-gnu, built 2022/04/05 01:47:17, go1.16.6) (same version as client)
# Cluster ID: cf2a5188-d004-4a1b-9e3f-6c6a8c8e4d95
#
# Enter \? for a brief introduction.
#
root@:26257/defaultdb> CREATE DATABASE demo;
CREATE DATABASE


Time: 12ms total (execution 11ms / network 0ms)

root@:26257/defaultdb> CREATE USER demo;
CREATE ROLE


Time: 163ms total (execution 162ms / network 0ms)

root@:26257/defaultdb> GRANT ALL ON DATABASE demo TO demo;
GRANT


Time: 41ms total (execution 41ms / network 0ms)

root@:26257/defaultdb> CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  birth_date DATE NOT NULL,
  first_name STRING NOT NULL,
  last_name STRING NOT NULL,
  gender STRING NOT NULL,
  hire_date DATE NOT NULL
);
CREATE TABLE


Time: 12ms total (execution 12ms / network 0ms)
```

Now we can use CockroachDB's great `IMPORT INTO` syntax to read a
remote gzipped CSV and insert all its rows into the table we just
created:

```

root@:26257/defaultdb> IMPORT INTO employees (
  emp_no,
  birth_date,
  first_name,
  last_name,
  gender,
  hire_date
) CSV DATA ('https://s3-us-west-1.amazonaws.com/cockroachdb-movr/datasets/employees-db/csv/employees.csv.gz');
```

And we're done!

# Data source setup

Now inside DataStation create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select CockroachDB
in the Vendor dropdown.

![Creating a CockroachDB data source](/tutorials/create-cockroachdb-data-source.png)

## Host field

If you are connecting to `localhost:26257` (the default), you can
leave the host field blank. If your port is 26257 then you can always
omit the colon and port and just specify the address.

However: when you are connecting to any PostgreSQL wire-compatible
database in DataStation (including CockroachDB) and you are connecting
without TLS, you must explicitly opt out of TLS by specifying the
query argument `?sslmode=disable`.

## Other fields

The database is the one we just created, `demo`. The username is
`demo`. And there is no password.

![Filled CockroachDB data source](/tutorials/cockroachdb-data-source-filled.png)

## SSH Proxy [Optional]

If you want connect to a CockroachDB database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-cockroachdb-database-panel.gif)

## Run a query

Enter in `SELECT COUNT(1) as "count", gender FROM employees GROUP BY gender` and hit play!

![Run CockroachDB query](/tutorials/run-cockroachdb-query.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-cockroachdb-panel-results.png)

# Graph the results

After running the query, a graph button will appear below the panel
next to the New Panel button. Click it to generate a graph based on
this panel.

DataStation tries to guess which columns to graph but it doesn't
always get it right. Select the name and age columns for the x and y
dimensions respectively.

![Graph database results](/tutorials/graph-cockroachdb-database-results.gif)

Note: when the query panel changes in the future you'll need to
manually re-run the graph panel.