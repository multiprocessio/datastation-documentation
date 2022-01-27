# Querying BigQuery with DataStation

Requires DataStation 0.7.0+.

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

Let's pull population data from a public BigQuery dataset. Enter the
following query and hit play!

```sql
SELECT
 *
FROM
 `bigquery-public-data`.census_bureau_usa.population_by_zip_2010
ORDER BY population DESC
LIMIT 10
```

![Run BigQuery query](/tutorials/run-bigquery-query.gif)

Interesting! But random US zipcodes don't mean very much. So let's
grab a public CSV of zipcode data that does include the city and state
information.

## Load zipcode metadata

Create an new HTTP panel, enter the following URL, and hit play.

```
https://raw.githubusercontent.com/scpike/us-state-county-zip/master/geo-data.csv
```

![Load data over HTTP](/tutorials/run-bigquery-http-panel.gif)

## Join the two datasets

Now that we have the top 10 zipcodes by population and a list of
zipcodes with names, we can join the two datasets to find the city
names of the zipcodes with the greatest population.

Create a new panel and select the Program type. Select SQL as the
language. Enter the following query and hit run.

```sql
SELECT population, city || ', ' || state
FROM DM_getPanel(0)
  LEFT JOIN DM_getPanel(1) ON t_0.zipcode = t_1.zipcode
WHERE t_1.zipcode IS NOT NULL
ORDER BY population DESC;
```

Note: DataStation doesn't allow you to pick table aliases. They
automatically become `t_N` where `N` is the string passed to
`DM_getPanel()`.

![Join zipcode data](/tutorials/bigquery-join-zipcodes.gif)

# Graph the results

Create a new panel. Change the type to Graph. Select the previous
Database panel as the panel source. Then select the X and Y columns
you'd like to graph.

Finally, click the play button to generate the graph. You can download
the graph as a PNG by clicking the download button.

![Graph database results](/tutorials/graph-bigquery-database-results.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.
