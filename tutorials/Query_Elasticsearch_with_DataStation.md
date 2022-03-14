# Run Elasticsearch in Docker and query with DataStation

This tutorial walks through running Elasticsearch in Docker, creating
an index and loading it with documents, and finally querying it in
DataStation.

# Database initialization [Optional]

If you want to follow along with this tutorial verbatim, in your
terminal start Elasticsearch in Docker:

```bash
$ docker run -p 127.0.0.1:9200:9200 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.16.3
```

Then create an index with curl and add some data:

```bash
$ curl -H 'Content-Type: application/json' -XPOST "http://localhost:9200/users/_doc" -d '{"name": "Tiara", "age": 44}'
{"_index":"users","_type":"_doc","_id":"-yI80X4BjZbj9lUqh0G7","_version":1,"result":"created","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":1,"_primary_term":1}
$ curl -H 'Content-Type: application/json' -XPOST "http://localhost:9200/users/_doc" -d '{"name": "Carah", "age": 29}'
{"_index":"users","_type":"_doc","_id":"_CI80X4BjZbj9lUqyUHI","_version":1,"result":"created","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":1,"_primary_term":1}
```

# Data source setup

Now inside DataStation create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select Elasticsearch
in the Vendor dropdown.

![Creating a Elasticsearch data source](/tutorials/create-elasticsearch-data-source.png)

## Host field

If you are connecting to `localhost:9200` (the default), you can
leave the host field blank. If your port is 9200 then you can always
omit the colon and port and just specify the address.

## Other fields

Next fill in the username and authentication fields if
necessary. Leaving these fields blank is ok too.

## SSH Proxy [Optional]

If you want connect to a Elasticsearch database on a remote server through an
SSH proxy, you will need to set up the SSH connection to that server
first. Once you do, you can select that connection in the "Via Server"
dropdown within the data source editor.

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-elasticsearch-database-panel.gif)

## Run a query

Enter your query and hit play!

![Run Elasticsearch query](/tutorials/run-elasticsearch-query.gif)

Note: Ctrl-r is a shortcut for hitting the play button when you are
focused on one panel.

You can always download the results of a panel by hitting the download
button. Or you can reference the results in other panels.

![Download panel results](/tutorials/download-elasticsearch-panel-results.png)

# Graph the results

After running the query, a graph button will appear below the panel
next to the New Panel button. Click it to generate a graph based on
this panel.

DataStation tries to guess which columns to graph but it doesn't
always get it right. Select the name and age columns for the x and y
dimensions respectively.

![Graph database results](/tutorials/graph-elasticsearch-database-results.gif)

Note: when the query panel changes in the future you'll need to
manually re-run the graph panel.
