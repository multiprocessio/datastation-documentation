# HTTP Panels

HTTP panels allow you to make API requests. You can make GET, POST,
PUT, HEAD, or DELETE requests.

![Basic http panel](/tutorials/basic-http-panel.png)

# Results

When DataStation understands the file format (because it recognized
the URL's file extension or the HTTP response's `Content-Type`
or because you overrode the response content type) it will try to put data
in array of objects format.

The exceptions to this are JSON responses (they can be any structure)
and when you override the content type to be plain text.

# Macros

The URL, headers, and HTTP body in an HTTP panel can include
macros. This allows you to, for example, POST the results of one panel
to a web server.

![Post macro](/tutorials/post-macro.png)

Read more about macros [here](./Macros.md).

# Supported file formats

HTTP panels can handle all the same file formats that [file panels can](./File_Panels.md#supported-file-formats).

# With Server

If you define an [SSH connection](../SSH_Connections.md) you will be
able to select the server to proxy your HTTP request through an SSH
tunnel.

For example, this screenshot demonstrates querying `localhost:8080` on
the remote server.

![Basic http panel with proxy](/tutorials/basic-http-panel-via-server.png)
