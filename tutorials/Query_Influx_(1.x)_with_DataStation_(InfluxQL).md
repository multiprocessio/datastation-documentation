# Run Influx 1.x in Docker and query (InfluxQL) with DataStation

This tutorial walks through running Influx 1.x in Docker, loading it
with data, and finally querying it in DataStation using InfluxQL.

# Database initialization [Optional]

If you want to follow along with this tutorial verbatim, in your
terminal start Influx 1.x in Docker:

```bash
$ docker run -p 8086:8086 influxdb:1.7
```

Now download the
[latest-observations.lp](https://github.com/influxdata/influxdb2-sample-data/blob/master/noaa-ndbc-data/latest-observations.lp)
file from Influx's sample data repo.

Load it into Influx with curl:

```bash
$ curl -XPOST "http://localhost:8086/query" --data-urlencode "q=CREATE DATABASE test"
{"results":[{"statement_id":0}]}
$ curl -XPOST 'http://localhost:8086/write?db=test' --data-binary @./noaa-ndbc-data-sample.lp
```

# Data source setup

Now inside DataStation create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select Influx
in the Vendor dropdown.

![Creating a Influx data source](/tutorials/create-influx-data-source.png)

## Host field

If you are connecting to `localhost:8086` (the default), you can
leave the host field blank. If your port is 8086 then you can always
omit the colon and port and just specify the address.

## Other fields

In this case the database is `test` based on how we started the Docker
container.

Next fill in the username and authentication fields if
necessary. Leaving these fields blank is ok too.

![Filled Influx data source](/tutorials/influx-data-source-filled.png)

## SSH Proxy [Optional]

If you want connect to a Influx database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-influx-database-panel.gif)

## Run a query

Copy the following query and hit play!

```influxql
SELECT MEAN(avg_wave_period_sec) FROM ndbc
```

![Run Influx query](/tutorials/run-influx-query.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-influx-panel-results.png)

# Display results

After running the query, a table button will appear below the panel
next to the New Panel button. Click it to generate a table based on
this panel.

![Render results](/tutorials/graph-influx-database-results.gif)

Note: when the query panel changes in the future you'll need to
manually re-run the table panel.
