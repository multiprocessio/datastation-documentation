# Transform data with Python in DataStation

Let's build a graph of the countries with the most popular domain
names.

# Top domains

We can get a list of the 10 million top domains
[here](https://www.domcop.com/top-10-million-domains). Download the
CSV and unzip it.

Open a project in DataStation and create a File panel. Load this
file. Give the panel a useful name.

![Get domains](/tutorials/transform-with-python-get-domains.gif)

# Countries

And we can get a list of all countries and country-level TLDs
[here](https://github.com/dr5hn/countries-states-cities-database/blob/master/csv/countries.csv).

Create a new HTTP panel and enter the Raw URL for that CSV on
Github. Give the panel a useful name.

![Get countries](/tutorials/transform-with-python-get-countries.gif)

# Join

Now we can write a simple Python script to read the results of both
panels and join them together.

## Reading a panel result

DataStation allows you to read other panels by calling the
`DM_getPanel` function. This function takes a panel position (starting
at the top at `0`) or a panel name. Panel names should be enclosed in
quotes, panel positions should not.

## Setting a panel result

Every panel must return a result so in Code
panels you must call `DM_setPanel` with a value for the result of the
panel. While this result doesn't need to be any type in particular, if
we want the result to be readable by Graph (and many other) panels it
will need to be an array of objects.

Create a new Code panel, give the panel a useful name, and enter the
following script:

```python
countries = DM_getPanel('Countries')
topdomains = DM_getPanel('Top Domains')

topcountries = {}
for d in topdomains:
  if int(d['Rank']) > 1000:
    break
  
  for c in countries:
    if d['Domain'].endswith(c['tld']):
      if c['Name'] not in topcountries:
        topcountries[c['Name']] = 0
      topcountries[c['Name']] += 1

sortcountries = [(c, topcountries[c]) for c in sorted(topcountries, key=topcountries.get, reverse=True)]
DM_setPanel(sortcountries)
```

![Joining data](/tutorials/transform-with-python-join-data.gif)

# Graph

Now we have a result we can graph. Create a new Graph panel and point
it at the previous Code panel.

![Graphing the result](/tutorials/transform-with-python-graph-result.gif)
