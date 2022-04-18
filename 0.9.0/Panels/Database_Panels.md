# Database Panels

These panels allow you to query databases either locally or through an
SSH proxy. You must first configure a [data
source](../Data_Sources.md) for the database you want to connect
to. Then you can create a database panel and select the data source
you created.

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

# Reading from other panels

MySQL, PostgreSQL and SQLite panels support the `DM_getPanel($panel)`
function. You can either pass a panel index or the panel name. If you
pass the panel name it must be quoted as a string literal.

You can only call `DM_getPanel($panel)` on a panel that returns an
array of objects.

The result of calling `DM_getPanel($panel)` is a temporary table is
created with the data from that panel. You can reference that table
with the entire `DM_getPanel($panel)` call or with the `t_$panel`
table alias. Multiple `DM_getPanel` calls for the same panel will not
result in reloading of the panel into a temporary table.

## Reading nested data from other panels

# Connecting via SSH proxy

Queries can be proxied through an SSH tunnel by checking the **With
Server** option on the data source definition or panel details. Once
selected, you will be prompted to pick from one of the [SSH
connections](../SSH_Connections.md) you set up previously.

# PostgreSQL

If you are not running your PostgreSQL with TLS, you will need to
disable `sslmode` in your connection. Append `?sslmode=disable` to the
database address. For example if you are running PostgreSQL locally
you might set the database address to `localhost?sslmode=disable`.
