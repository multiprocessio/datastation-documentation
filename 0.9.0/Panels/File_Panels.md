# File Panels

File panels allow you to import files into DataStation from
disk. Every time the panel is run the file is read again.

![Load CSV data](/tutorials/file-plant-data-no-server.png)

# Results

When DataStation understands the file format (because it recognized
the file extension or because you overrode the file content type) it
will try to put data in array of objects format.

The exceptions to this are JSON files (they can be any structure) and
when you override the content type to be plain text.

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
