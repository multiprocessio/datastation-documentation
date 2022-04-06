# Run Prometheus in Docker and query with DataStation

This tutorial walks through running Prometheus in Docker, loading it
with data, and finally querying it in DataStation using PromQL.

# Database initialization [Optional]

If you want to follow along with this tutorial verbatim, in your
terminal create a simple Prometheus config that will tell Prometheus
to scrape itself:

```bash
$ mkdir prometheus
$ echo "
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']" > prometheus/prometheus.yml
```

Then start up Prometheus in Docker:

```bash
$ docker run -p 9090:9090 -v $(pwd)/prometheus:/etc/prometheus prom/prometheus
```

# Data source setup

Now inside DataStation create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select Prometheus
in the Vendor dropdown.

![Creating a Prometheus data source](/tutorials/create-prometheus-data-source.png)

## Host field

If you are connecting to `localhost:8080` (the default), you can
leave the host field blank. If your port is 8080 then you can always
omit the colon and port and just specify the address.

## Other fields

Next fill in the username and authentication fields if
necessary. Leaving these fields blank is ok too.

## SSH Proxy [Optional]

If you want connect to a Prometheus database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-prometheus-database-panel.gif)

## Run a query

Enter your query and hit play!

![Run Prometheus query](/tutorials/run-prometheus-query.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-prometheus-panel-results.png)

# Graph the results

After running the query, a graph button will appear below the panel
next to the New Panel button. Click it to generate a graph based on
this panel.

DataStation tries to guess which columns to graph but it doesn't
always get it right. Select the name and age columns for the x and y
dimensions respectively.

![Graph database results](/tutorials/graph-prometheus-database-results.gif)

Note: when the query panel changes in the future you'll need to
manually re-run the graph panel.
