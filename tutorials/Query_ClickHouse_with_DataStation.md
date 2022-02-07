# Querying ClickHouse with DataStation

# Data source setup

First create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select ClickHouse
in the Vendor dropdown.

![Creating a ClickHouse data source](/tutorials/create-clickhouse-data-source.png)

## Host field

If you are connecting to `localhost:8123` (the default), you can
leave the host field blank. If your port is 8123 then you can always
omit the colon and port and just specify the address.

## Other fields

Next fill in the database, username, and password fields if
necessary. Leaving these fields blank is ok too.

## SSH Proxy [Optional]

If you want connect to a ClickHouse database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-clickhouse-database-panel.gif)

## Run a query

Enter your query and hit play!

![Run ClickHouse query](/tutorials/run-clickhouse-query.gif)

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-clickhouse-panel-results.png)

# Graph the results

Create a new panel. Change the type to Graph. Select the previous
Database panel as the panel source. Then select the X and Y columns
you'd like to graph.

Finally, click the play button to generate the graph. You can download
the graph as a PNG by clicking the download button.

![Graph database results](/tutorials/graph-clickhouse-database-results.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.
