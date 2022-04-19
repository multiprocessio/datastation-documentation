# File Panels

File panels allow you to import files into DataStation from
disk. Every time the panel is run the file is read again.

![Load CSV data](/tutorials/file-plant-data-no-server.png)

# With Server

If you define an [SSH connection](../SSH_Connections.md) you will be
able to select the server to read your file remotely over SSH.

![Load CSV data from server](/tutorials/file-plant-data-from-server.png)

# Supported file formats

Data

* JSON, JSON Newline, Concatenated JSON
* CSV, TSV
* Apache parquet
* XLSX
* ODS
* Apache ORC
* Apache Avro

Logs

* Apache2 Access Logs
* Apache2 Error Logs
* Nginx Access Logs
* Newline-delimited JSON
* Newline-delimited Custom Regex
