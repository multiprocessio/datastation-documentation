# Querying SQLite with DataStation

# Database initialization [Optional]

If you want to follow along with this tutorial verbatim, in your
terminal create a SQLite database and enter this sample data:

```bash
$ sqlite3 ~/test.sqlite
SQLite version 3.36.0 2021-06-18 18:58:49
Enter ".help" for usage hints.
sqlite> create table test(name text, age int);
sqlite> insert into test values ('Kara', 24), ('Mike', 30);
```

# Data source setup

Now inside DataStation, create a new data source in the left sidebar.

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

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-sqlite-database-panel.gif)

## Run a query

Enter your query and hit play!

![Run SQLite query](/tutorials/run-sqlite-query.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-sqlite-panel-results.png)

# Graph the results

There is a graph button below the query panel, beside the New Panel
button. Click it to generate a graph panel pointed at the query panel.

![Graph database results](/tutorials/graph-sqlite-database-results.gif)

Note: when the query panel changes in the future you'll need to
manually re-run the graph panel.
