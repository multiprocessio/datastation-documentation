# Querying Oracle with DataStation

# Data source setup

First create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select Oracle
in the Vendor dropdown.

![Creating a Oracle data source](/tutorials/create-oracle-data-source.png)

## Host field

If you are connecting to `localhost:1521` (the default), you **must
still set the field to `localhost`**.

Note: there is a bug before 0.7.0 where the address cannot be blank
for Oracle data sources.

If your port is 1521 then you can always omit the colon and port and
just specify the address.

## Other fields

Next set your database, username, and password.

![Filled out Oracle data source](/tutorials/oracle-data-source-filled.png)

## SSH Proxy [Optional]

If you want connect to a Oracle database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-oracle-database-panel.gif)

Enter your query and hit play!

Additional notes:
* Do not include a trailing semicolon on the last statement otherwise
  the query will fail.
* Statements that do not return rows (like `CREATE` or `INSERT`
  statements) will succeed but show an error. Ignore the error. This
  is a bug. [See
  #154](https://github.com/multiprocessio/datastation/issues/154) to
  follow the issue.

![Run Oracle query](/tutorials/run-oracle-query.gif)

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-oracle-panel-results.png)

# Graph the results

Create a new panel. Change the type to Graph. Select the previous
Database panel as the panel source. Then select the X and Y columns
you'd like to graph.

Finally, click the play button to generate the graph. You can download
the graph as a PNG by clicking the download button.

![Graph database results](/tutorials/graph-oracle-database-results.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.
