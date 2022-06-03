# Google Sheets + SQL: Querying Google Sheets with DataStation

Requires DataStation 0.10.0+.

# Database initialization [Optional]

If you want to follow along with this tutorial verbatim, create a new
sheet and import the CSV of world population data you can get from
[this page](https://worldpopulationreview.com/).

![World population Google sheet](/tutorials/google-sheets-world-population.png)

# Google Service Account

Enable the [Sheets API](https://console.cloud.google.com/apis/library/sheets.googleapis.com).

![Enable Sheets API](/tutorials/enable-sheets-api.png)

If you don't already have a Google Service Account, [make
one](https://console.cloud.google.com/iam-admin/serviceaccounts/create).

![New Google service account](/tutorials/google-service-account.png)

Then download the service account JSON from the Keys page of the
service account.

![Download service account JSON](/tutorials/download-service-account-json.png)

Finally, share the sheet you just created with the service account email you just created.

![Share Sheet with service account](/tutorials/share-sheet-with-service-account.png)

# Data source setup

Now inside DataStation create a new Google Sheets data source in the left sidebar.

![Creating a new data source](/tutorials/create-google-sheet-data-source.gif)

Give it a nice name so you can easily find it later.

![Creating a Google Sheets data source](/tutorials/create-google-sheets-data-source.png)

Copy the service account JSON file contents you just downloaded into
the service account JSON field.

![Filled out Google Sheets data source](/tutorials/google-sheets-data-source-filled.png)

# Panel setup

Copy the sheet ID from the URL of the Google Sheet.

![Copy sheet ID](/tutorials/copy-sheet-id.png)

Now create a new Database panel and enter the ID.

![Create Google Sheets database panel](/tutorials/create-sheets-database-panel.gif)

And run the panel to fetch the data!

![Run Google Sheets panel](/tutorials/run-google-sheets-query.gif)

## SQL query on top

Now that the data is loaded in DataStation we can use DataStation's
scripting abilities to run a program using the Google Sheets data. We'll
run a SQL program that counts the number of applied applicants.

Let's build a graph of world population over time. Since the
population by year is given in columns we can write a few `UNION`
queries to get the total population at each recorded decade:

```
SELECT SUM(pop1970) AS population, '1970' AS decade FROM DM_getPanel('Grab population sheet')
UNION
SELECT SUM(pop1980) AS population, '1980' AS decade FROM DM_getPanel('Grab population sheet')
UNION
SELECT SUM(pop1990) AS population, '1990' AS decade FROM DM_getPanel('Grab population sheet')
UNION
SELECT SUM(pop2000) AS population, '2000' AS decade FROM DM_getPanel('Grab population sheet')
UNION
SELECT SUM(pop2010) AS population, '2010' AS decade FROM DM_getPanel('Grab population sheet')
UNION
SELECT SUM(pop2020) AS population, '2020' AS decade FROM DM_getPanel('Grab population sheet')
UNION
SELECT SUM(pop2030) AS population, '2030' AS decade FROM DM_getPanel('Grab population sheet')
```

Create a new Code panel, select SQL as the language, enter this query and
hit run.

![SQL on top of Google Sheets](/tutorials/sql-google-sheets.gif)

# Graph the results

After running the query, a graph button will appear below the panel
next to the New Panel button. Click it to generate a graph based on
this panel.

![Graph results](/tutorials/graph-google-sheets.gif)

From here you can do more analysis or export results to clipboard, a
file, HTTP server, etc.
