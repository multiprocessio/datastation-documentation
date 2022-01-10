# Database Panels

These panels allow you to query databases either locally or through an
SSH proxy. You must first configure a [data source](../Data_Sources.md) for the database you want to connect to. Then you can
create a new panel and select the Database type and data source you
created.

# Supported Databases

Traditional SQL

* MySQL
* [Oracle](#oracle)
* Microsoft SQL Server
* PostgreSQL
* SQLite

Analytics

* Snowflake
* ClickHouse

Document

* Elasticsearch

Metrics
  * Prometheus
  * Influx

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
