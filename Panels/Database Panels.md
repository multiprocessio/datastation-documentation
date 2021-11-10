# Database Panels

These panels allow you to query databases either locally or through an
SSH proxy. You must first configure a [data source](../Data
Sources.md) for the database you want to connect to. Then you can
create a new panel and select the Database type and data source you
created.

## Supported Databases

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

## Connecting via SSH proxy

Queries can be proxied through an SSH tunnel by checking the **With
Server** option on the data source definition or panel details. Once
selected, you will be prompted to pick from one of the [SSH
connections](../SSH Connections.md) you set up previously.

## Oracle

Oracle requires an additional setup step. You must download the
[instant
client](https://www.oracle.com/database/technologies/instant-client/winx64-64-downloads.html)
from their site and unzip it. Add the enclosed directory to your
`$PATH` environment variable and restart DataStation.
