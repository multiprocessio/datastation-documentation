# Run Influx 2.x in Docker and query (Flux) with DataStation

This tutorial walks through running Influx 2.x in Docker, loading it
with data, and finally querying it in DataStation using Flux.

# Database initialization [Optional]

If you want to follow along with this tutorial literally, in your
terminal start Influx 2.x in Docker:

```bash
$ docker run -p 8086:8086 -e "DOCKER_INFLUXDB_INIT_USERNAME=test" -e "DOCKER_INFLUXDB_INIT_PASSWORD=testtest" -e "DOCKER_INFLUXDB_INIT_MODE=setup" -e "DOCKER_INFLUXDB_INIT_ORG=test" -e "DOCKER_INFLUXDB_INIT_BUCKET=test" -e "DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=test" influxdb:2.0
```

Now download the
[latest-observations.lp](https://github.com/influxdata/influxdb2-sample-data/blob/master/noaa-ndbc-data/latest-observations.lp)
file from Influx's sample data repo.

Load it into Influx with curl:

```bash
$ curl -XPOST 'http://localhost:8086/api/v2/write?org=test&bucket=test&precision=ns' --header 'Authorization: Token test' --data-binary @./noaa-ndbc-data-sample.lp
```

# Data source setup

Now inside DataStation create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select Influx
(Flux) in the Vendor dropdown.

![Creating a Flux data source](/tutorials/create-flux-data-source.png)

## Host field

If you are connecting to `localhost:8086` (the default), you can
leave the host field blank. If your port is 8086 then you can always
omit the colon and port and just specify the address.

## Other fields

In this case we need to set the organization to `test` and the API key
to `test` based on how we started the Docker container.

![Filled Flux data source](/tutorials/flux-data-source-filled.png)

## SSH Proxy [Optional]

If you want connect to a Influx database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-flux-database-panel.gif)

## Run a query

Copy the following query and hit play!

```flux
from(bucket: "test")
|> range(start: -1000000h)
|> filter(fn: (r) =>
  (r._measurement == "ndbc" and r._field == "avg_wave_period_sec"))
|> group(columns: ["_measurement", "_start", "_stop", "_field"], mode: "by")
|> keep(columns: ["_measurement", "_start", "_stop", "_field", "_time", "_value"])
|> mean()
|> map(fn: (r) =>
  ({r with _time: 1970-01-01T00:00:00Z}))
|> rename(columns: {_value: "mean", "_time": "time"})
|> drop(columns: ["result", "table"])
|> yield(name: "0")
```

![Run Flux query](/tutorials/run-flux-query.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-flux-panel-results.png)

# Display results

After running the query, a table button will appear below the panel
next to the New Panel button. Click it to generate a table based on
this panel.

![Render results](/tutorials/graph-flux-database-results.gif)

Note: when the query panel changes in the future you'll need to
manually re-run the table panel.
