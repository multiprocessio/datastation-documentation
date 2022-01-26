# Querying BigQuery with DataStation

# Data source setup

First create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select BigQuery
in the Vendor dropdown.

![Creating a BigQuery data source](/tutorials/create-bigquery-data-source.png)

## Project and service token

Fill in your Google project ID and paste in your service account token
JSON.

![Filled out BigQuery data source](/tutorials/bigquery-data-source-filled.png)

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-bigquery-database-panel.gif)

## Run a query

Enter your query and hit play!

![Run BigQuery query](/tutorials/run-bigquery-query.gif)

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-bigquery-panel-results.png)

# Graph the results

Create a new panel. Change the type to Graph. Select the previous
Database panel as the panel source. Then select the X and Y columns
you'd like to graph.

Finally, click the play button to generate the graph. You can download
the graph as a PNG by clicking the download button.

![Graph database results](/tutorials/graph-bigquery-database-results.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.
