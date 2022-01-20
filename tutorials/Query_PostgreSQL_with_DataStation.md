# Query PostgreSQL with DataStation

# Data source setup

First create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you can easily find it later. And select
PostgreSQL in the Vendor dropdown.

![Creating a PostgreSQL data source](/tutorials/create-postgresql-data-source.png)

## Host field

If you are running the host on localhost:5432 (the default) and you
have SSL set up, you can leave the host field blank.

Additional notes:

* If SSL is not on then you can set the host field to
  `?sslmode=disable`. This is a shorthand for
  `localhost?sslmode=disable` which is a shorthand for
  `localhost:5432?sslmode=disable`.
* If the port is 5432 then you can always omit the colon and port

## Other fields

Next set your database, username, and password.

![Filled out PostgreSQL data source](/tutorials/postgresql-data-source-filled.png)

## SSH Proxy [Optional]

If you want connect to a MySQL database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-database-panel.png)

Enter your query and hit play!

![Run PostgreSQL query](/tutorials/run-postgresql-query.png)

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-panel-results.png)

# Graph the results

Create a new panel. Change the type to Graph. Select the previous
Database panel as the panel source. Then select the X and Y columns
you'd like to graph. Defaults are chosen for you.

Finally, click the play button to generate the graph. You can download
the graph as a PNG by clicking the download button.

![Graph database results](/tutorials/graph-database-results.png)
