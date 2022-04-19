# Database Panels

These panels allow you to query databases either locally or through an
SSH proxy. You must first configure a [data
source](../Data_Sources.md) for the database you want to connect
to. Then you can create a database panel and select the data source
you created.

![Basic database panel](/tutorials/basic-database-panel.png)

# Reading from other panels

MySQL, PostgreSQL and SQLite panels support the `DM_getPanel($panel)`
function. You can either pass a panel index or the panel name. If you
pass the panel name it must be quoted as a string literal.

The result of calling `DM_getPanel($panel)` is a temporary table is
created with the data from that panel. You can reference that table
with the entire `DM_getPanel($panel)` call or with the `t_$panel`
table alias. Multiple `DM_getPanel` calls for the same panel will not
result in reloading of the panel into a temporary table.

## DM_getPanel result format requirements

You can only call `DM_getPanel($panel)` on a panel that returns an
array of objects. If the array of objects is nested within the panel
result then you can specify a path to the array of objects in the
second argument of the `DM_getPanel` call.

For example if you have a JSON data structure like this in one panel:

```
{
  "data": {
    "data": [
      {"id": 1, "name": "Corah"},
      {"id": 3, "name": "Minh"}
    ]
  },
  "total": 2
}
```

You could run a SQL query against that panel like:

```
SELECT * FROM DM_getPanel(0, 'data.data')
```

## Macros

All panels that have a panel body can use macros. So for panels that
don't support the `DM_getPanel` function call (panels that are not
MySQL, PostgreSQL or SQLite) you can still use macros to fetch another
panel's result.

Read more about macros [here](./Macros.md).

# Connecting via SSH proxy

If you define an [SSH connections](../SSH_Connections.md) you will be
able to select the server to proxy your database connection through an
SSH tunnel.

![Basic database panel via server](/tutorials/basic-database-panel-via-server.png)

# PostgreSQL

If you are not running your PostgreSQL with TLS, you will need to
disable `sslmode` in your connection. Append `?sslmode=disable` to the
database address. For example if you are running PostgreSQL locally
you might set the database address to `localhost?sslmode=disable`.

# Supported Databases

Traditional SQL

* PostgreSQL [Tutorial](../tutorials/Query_PostgreSQL_with_DataStation.md)
* MySQL [Tutorial](../tutorials/Query_MySQL_with_DataStation.md), MariaDB
* SQLite [Tutorial](../tutorials/Query_SQLite_with_DataStation.md)
* SQL Server [Tutorial](../tutorials/Query_SQL_Server_with_DataStation.md)
* Oracle [Tutorial](../tutorials/Query_Oracle_with_DataStation.md)
* CockroachDB [Tutorial](../tutorials/Query_CockroachDB_with_DataStation.md)

Warehouse

* Google BigQuery [Tutorial](../tutorials/Query_BigQuery_with_DataStation.md)
* AWS Athena [Tutorial](../tutorials/Query_AWS_Athena_with_DataStation.md)
* Snowflake

Document
* Elasticsearch [Tutorial](../tutorials/Query_Elasticsearch_with_DataStation.md)
* CrateDB

Apps
* Airtable [Tutorial](../tutorials/Query_Airtable_with_DataStation.md)

Time Series

* ClickHouse[Tutorial](../tutorials/Query_ClickHouse_with_DataStation.md)
* YugabyteDB [Tutorial](../tutorials/Query_Yugabyte_with_DataStation.md)
* Cassandra, Scylla [Tutorial](../tutorials/Query_Scylla_with_DataStation.md)
* QuestDB
* TimescaleDB

Metrics

* Prometheus [Tutorial](../tutorials/Query_Prometheus_with_DataStation.md)
* Influx 2 (Flux) [Tutorial](../tutorials/Query_Influx_(2.x)_with_DataStation_(Flux).md), Influx 1 (InfluxQL) [Tutorial](../tutorials/Query_Influx_(1.x)_with_DataStation_(InfluxQL).md)
