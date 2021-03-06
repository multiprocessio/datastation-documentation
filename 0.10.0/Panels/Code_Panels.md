# Code Panels

Code panels allow you to run code in a few major languages:
JavaScript, Deno, Ruby, R, Julia, Python, PHP, and SQL.

![Basic code panel](/tutorials/basic-code-panel.png)

Like every other panel, code panels must have a result. You can set
the result using the `DM_setPanel` function. And you can fetch another
panel's result using the `DM_getPanel` function.

SQL code panels are the exception. Their result is
set automatically to the result of their SQL query. You cannot use
`DM_setPanel` in a SQL code panel.

# Fetching another panel's result

All code panels can grab another panel's result with the `DM_getPanel`
function. This function takes one argument which is either the integer
index of the panel (from top to bottom starting with `0`), or the
panel's name.

Let's say you have a [file panel](./File_Panels.md) that reads a CSV
file from disk (the [Hudson River Plant
dataset](https://catalog.data.gov/dataset/hudson-river-park-flora-plantings-beginning-1997)). And
say the panel's name is `Load plant data`.

![Load plant data from CSV file](/tutorials/file-plant-data.png)

Once you have run the file panel, you can grab that data in a code
panel using `DM_getPanel('Load plant data')`:

![Transform plant data no set](/tutorials/transform-plant-data-no-set.png)

# Setting a panel result

`DM_setPanel` sets the current panel's result. It accepts one argument. The argument must be serializable. Serialization happens automatically. Some kinds of objects that aren't serializable are circular data structures.

Building off the last example, the whole code panel should like like this:

![Transform plant data](/tutorials/transform-plant-data.png)

## Result format

Panel results can be of any format, as long as the value is
serializable. But when setting a panel you intend to have read from a
Table, Graph, or panel that supports SQL, there is a single accepted data format.

Table and Graph panels can only read from a panel that formats data as
an array of objects. Each object-element must be a mapping of column
name to column value. For example:

```json
[
  { "age": 1, "name": "Eliza" },
  { "age": 3, "name": "Javier" }
]
```

# Modifying the default program implementation

For most languages, DataStation looks in your `$PATH` environment
variable for an implementation of the language you pick in the code
panel. The SQL option is an exception, you don't need
anything installed to use it.

If an implementation by the name it looks doesn't exist, the panel
will fail with an error when you run the panel.

But maybe you have multiple instances of `python` on your machine. You
can specify an absolute path you want to use for each language
implementation in settings under the "Language Path Overrides" section.

In this screenshot you can see the Deno, Julia, R, and Ruby language
paths are not absolute. They will be looked up in `$PATH`. However,
JavaScript, PHP and Python are absolute paths that will not be looked
up in `$PATH`.

![Language path overrides](/tutorials/language-path-overrides.png)

Changes take effect the next time you run the code panel.

If you ever mess up these settings, you can always revert back to the
default by hitting the "Reset button".

# Importing 3rd party libraries

DataStation uses the language implementation you have already
installed on your system. This means you can import any libraries you
already have installed too.

Furthermore, this means that even when DataStation doesn't support a
particular API or database, you can install a language-level package
on your system so you can write your own custom code to make requests
or queries to any system.

# SQL

SQL code panels provide a way of running SQL queries solely against
other panels, without the need for any external database or data
sources configured. You don't need to set up a data source to use
it. It is useful in situations where you don't have a database but the
most natural way to express a join or filter is in SQL rather than
code.

Under the hood this is implemented with SQLite.

SQL panels can refer to the results of other panels by using
`DM_getPanel($number)` where `$number` is the zero-indexed panel you
want to grab. Or, like other languages, you can also refer by name
`DM_getPanel('$panelName')` where `$panelName` is the name of the
panel you want to grab.

The panel you refer to must have a result that is in the array of
objects format.

Building off the above plant example, here's how you could calculate
most common plants with a SQL code panel.

![Basic SQL code panel](/tutorials/basic-sql-code.png)
