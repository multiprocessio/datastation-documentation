# Querying Elasticsearch with DataStation

# Data source setup

First create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select Elasticsearch
in the Vendor dropdown.

![Creating a Elasticsearch data source](/tutorials/create-elasticsearch-data-source.png)

## Host field

If you are connecting to `localhost:9200` (the default), you can
leave the host field blank. If your port is 9200 then you can always
omit the colon and port and just specify the address.

## Other fields

Next fill in the username and authentication fields if
necessary. Leaving these fields blank is ok too.

## SSH Proxy [Optional]

If you want connect to a Elasticsearch database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-elasticsearch-database-panel.gif)

## Run a query

Enter your query and hit play!

Note: there is a bug in DataStation before 0.7.0 that when the query
is blank no results may be returned. Simply set a query that is
guaranteed to include all results. For example `age:>0`.

![Run Elasticsearch query](/tutorials/run-elasticsearch-query.gif)

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-elasticsearch-panel-results.png)

# Pull out nested values

Graph and Table panels in DataStation cannot work with nested values
at the moment. So you'll need to add a new code panel and write a
transformation to pull out the `_source` values.

![Transform panel results](/tutorials/transform-elasticsearch-panel-results.gif)

# Graph the results

Create a new panel. Change the type to Graph. Select the previous
Database panel as the panel source. Then select the X and Y columns
you'd like to graph.

Finally, click the play button to generate the graph. You can download
the graph as a PNG by clicking the download button.

![Graph database results](/tutorials/graph-elasticsearch-database-results.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.
