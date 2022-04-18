# File Panels

File panels allow you to import files into DataStation from
disk. Every time the panel is run the file is read again.

# With Server

If you define an [SSH connections](./SSH_Connections.md) you will be
able to select the server to read your file remotely over SSH.

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
