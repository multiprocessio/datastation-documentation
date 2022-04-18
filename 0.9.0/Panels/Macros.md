# Macros

Not all panels operate on code with the `DM_getPanel` function call
available. To work around this, DataStation allows you to templatize
any panel body (and sometimes other fields) using Jinja-like
macros. The primary purpose of these macros is to read some panel
results.

A panel's macros are evaluated when you run the panel. But they happen
before the panel's primary action. For example if you have macros in
an HTTP panel body, they are evaluated before submitting the request.

# DM_getPanel macro

The primary thing you have access to in a macro is a `DM_getPanel`
call. It's very similar to the non-macro `DM_getPanel` call. The
difference is that all of the rows are always loaded into memory at
once. This makes macros not excellent for passing around massive
amounts of data.

Also, you can only pass strings to this macro function. You cannot do
`{{ DM_getPanel(0) }}`. You must surround the argument with quotes.

# Iterating over panel results

Here is an example macro referencing the first panel that is an array
of objects containing at least two fields: `name` and `age`.

```
{% for row in DM_getPanel("0") %}{{ row.name }}: {{ row.age }}{% if not forloop.Last %}, {% endif %}{% endfor %}
```

# Converting a result to JSON

If you want to convert a panel result to JSON you can use the `json`
filter:

```
{{ DM_getPanel("0") | json }}
```
