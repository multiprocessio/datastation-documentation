# DataStation Documentation 0.8.0

DataStation is an open-source data IDE for developers. It allows you
to easily build graphs and tables with data pulled from SQL databases,
logging databases, metrics databases, HTTP servers, and all kinds of
text and binary files. Need to join or munge data? Write embedded
scripts as needed in Python, JavaScript, Ruby, R, or Julia. All in one
application.

# Tutorials

* [Installation](./Installation.md)
* Query databases
  * Relational
    * [MySQL](../tutorials/Query_MySQL_with_DataStation.md)
      * Same applies for MariaDB, Percona; just swap vendor
    * [PostgreSQL](../tutorials/Query_PostgreSQL_with_DataStation.md)
      * Same applies for CockroachDB, TimescaleDB, YugaByte, CrateDB, QuestDB; just swap vendor
    * [Oracle](../tutorials/Query_Oracle_with_DataStation.md)
    * [SQL Server](../tutorials/Query_SQL_Server_with_DataStation.md)
    * [SQLite](../tutorials/Query_SQLite_with_DataStation.md)
  * Warehouse
    * [BigQuery](../tutorials/Query_BigQuery_with_DataStation.md)
    * Snowflake (supported; but no tutorial yet)
  * Document
    * [Elasticsearch](../tutorials/Query_Elasticsearch_with_DataStation.md)
  * Time Series
    * [Scylla](../tutorials/Query_Scylla_with_DataStation.md)
      * Same applies for Cassandra; just swap Vendor
    * [ClickHouse](../tutorials/Query_ClickHouse_with_DataStation.md)
  * Metrics
    * [Prometheus](../tutorials/Query_Prometheus_with_DataStation.md)
    * [Influx 2.x (Flux)](../tutorials/Query_Influx_(2.x)_with_DataStation_(Flux).md)
    * [Influx 1.x (InfluxQL)](../tutorials/Query_Influx_(1.x)_with_DataStation_(InfluxQL).md)
  

# Reference

* [Installation](./Installation.md)
* Panels
  * [Database Panels](./Panels/Database_Panels.md)
  * [Code Panels](./Panels/Code_Panels.md)
  * [HTTP Panels](./Panels/HTTP_Panels.md)
  * [File Panels](./Panels/File_Panels.md)
* [Data Sources](./Data_Sources.md)
* [SSH Connections](./SSH_Connections.md)
