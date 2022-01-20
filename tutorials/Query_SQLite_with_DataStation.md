# Querying SQLite with DataStation

# Data source setup

First create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select SQLite
in the Vendor dropdown.

![Creating a SQLite data source](/tutorials/create-sqlite-data-source.png)

In the database field, specify the file

Next set your database, username, and password.

![Filled out SQLite data source](/tutorials/sqlite-data-source-filled.png)

## Remote connection [Optional]

If you want connect to a SQLite database on a remote server, you will
need to set up the SSH connection to that server first. Once you do,
you can select that connection in the "Via Server" dropdown.

![SQLite data source via server](/tutorials/sqlite-via-server.png)

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-database-panel.png)

Enter your query and hit play!

![Run SQLite query](/tutorials/run-sqlite-query.png)

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
