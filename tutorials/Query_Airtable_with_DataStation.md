# Airtable + SQL: Querying Airtable with DataStation

Requires DataStation 0.8.0+.

# Database initialization [Optional]

If you want to follow along with this tutorial verbatim, create a new
base in Airtable and enter some basic data.

![New Airtable base](/tutorials/airtable-base.png)

# Airtable API token

If you don't already have an Airtable API token, go to
[airtable.com/account](https://airtable.com/account), generate and
save it.

![Generate Airtable API token](/tutorials/airtable-api-token.png)

# Data source setup

Now inside DataStation create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you can easily find it later. And select
Airtable in the Vendor dropdown.

![Creating a Airtable data source](/tutorials/create-airtable-data-source.png)

Then enter your Airtable API token.

![Filled out Airtable data source](/tutorials/airtable-data-source-filled.png)

# Panel setup

Now create a new panel and select the Database type. You can fill in
Base ID, Table ID, and View ID manually or you can just paste your
Airtable URL into the Base ID column and it will fill out the rest.

![Create database panel](/tutorials/create-airtable-database-panel.gif)

## Run a query

When querying Airtable you can leave the filter blank to select all
rows or you can use [Airtable's filter
language](https://support.airtable.com/hc/en-us/articles/360003695134)
to fetch only a subset of rows in a table.

![Run Airtable query](/tutorials/run-airtable-query.gif)

## SQL query on top

Now that the data is loaded in DataStation we can use DataStation's
scripting abilities to run a program using the Airtable data. We'll
run a SQL program that counts the number of applied applicants.

Create a new Code panel, select SQL as the language, enter this query and
hit run.

```
SELECT "Notes", COUNT(1) n FROM DM_getPanel(0) GROUP BY "NOTES"
```

![SQL on top of Airtable](/tutorials/sql-airtable.gif)

From here you can generate graphs, do more analysis, or export results
to a file or HTTP server.
