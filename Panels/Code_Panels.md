# Code Panels

These panels allow you to write any kind of program with no
limitations. You can read values from previous panels and set your own
value for the code panel result. You can run custom calculations

# Supported languages

* JavaScript
* Python
* Ruby
* R
* Julia

# Importing 3rd party libraries

Since DataStation uses the language already installed, you can import
any libraries you already have installed too.

This means that even when DataStation doesn't support a particular API
or database, you can install a language-level package on your system
so you can write your own custom code to make requests or queries to
any system.

# Communicating between panels

Use `DM_getPanel($number)` or `DM_getPanel('$panelName')` to pull the
results from another panel where `$number` is the index of the panel
(starting from zero) or `$panelName` is the name of the panel you want
to grab. Similarly, use `DM_setPanel($var)` to set the current panel's
result.

Panel results can be of any format. But when setting a panel you
intend to have read from a Table or Graph panel, there is a [single
accepted data format](#table-and-graph-panel-data-format).

# In-Memory SQL

In-memory SQL is a way of running SQL queries solely
against other panels without a running database. It is useful in
situations where you don't have a database but the most natural way to
express a join or filter is in SQL rather than code.

SQL panels can refer to the results of other panels by using
`DM_getPanel($number)` where `$number` is the zero-indexed panel you
want to grab. Or, like other languages, you can also refer by name
`DM_getPanel('$panelName')` where `$panelName` is the name of the
panel you want to grab.

`DM_getPanel` should only be called once. After that it can be
referred to by the alias `t_$number` or `"t_$panelName"`. For example:
`SELECT * FROM DM_getPanel(0) WHERE t_0.age < 12` will fetch all
results from the first panel (zero-indexed) and filter out rows where
the age column is less than 12.

# Table and Graph panel data format

Table and Graph panels must read from a panel that formats data as an
array of objects. Each object-element must be a mapping of column name
to column value. For example: `[{ "age": 1, "name": "Eliza" }, {
"age": 3, "name": "Javier" }]`.

# Overriding program path

If you want to use a version of the language that is not in your `$PATH`
or not the default, you can modify
`$HOME/DataStationProjects/.settings` and modify the `${language}Path`
variable (e.g. `rPath`, `pythonPath`) to point at the program you'd
like to be run.
