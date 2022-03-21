# Querying AWS Athena with DataStation

Requires DataStation 0.8.0+.

# Database initialization [Optional]

If you want to follow along with this tutorial verbatim, create two S3
buckets. One is for storing data we will query. The other is for
storing the query result. Athena requires you to give it a bucket for
storing results.

My two buckets are called `s3://datastation-tests` and
`s3://datastation-test-results` respectively. You'll have to pick your
own names.

![S3 buckets](/tutorials/aws-athena-buckets.png)

## Data

Create a csv and upload it to the bucket for storing data we will query:

```
$ cat users.csv
name,age
Garry,43
Mina,39
Karl,50
Nile,41
Emma,52
$ aws s3 cp users.csv s3://datastation-tests
```

Swap out `datastation-tests` with the name of your bucket.

## Athena definition

Now go to Athena and create a new table and database.

The create table statement for this file is:

```
CREATE EXTERNAL TABLE `basic_users`(
  `name` string, 
  `age` int)
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ',' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://datastation-tests'
TBLPROPERTIES (
  'has_encrypted_data'='false', 
  'transient_lastDdlTime'='1646067804')
```

## API access

Finally, make sure you have an `AWS_ACCESS_KEY_ID` and
`AWS_SECRET_ACCESS_KEY` with all relevant permissions.

If you are creating an account solely for read-only access to Athena,
you can copy these permissions and modify them for own buckets:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "glue:GetDatabase",
                "s3:GetObject",
                "athena:GetWorkGroup",
                "athena:StartQueryExecution",
                "glue:GetTables",
                "athena:StopQueryExecution",
                "athena:GetQueryExecution",
                "athena:GetQueryResults",
                "s3:ListBucket",
                "glue:GetTable"
            ],
            "Resource": [
                "arn:aws:glue:us-east-1:693079658475:table/testdata/*",
                "arn:aws:glue:us-east-1:693079658475:database/testdata",
                "arn:aws:glue:us-east-1:693079658475:catalog",
                "arn:aws:s3:::datastation-tests",
                "arn:aws:s3:::datastation-test-results",
                "arn:aws:s3:::datastation-test-results/*",
                "arn:aws:s3:::datastation-tests/*",
                "arn:aws:athena:*:693079658475:workgroup/primary"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:ListBucketMultipartUploads",
                "s3:AbortMultipartUpload",
                "s3:ListBucketVersions",
                "s3:CreateBucket",
                "s3:ListBucket",
                "s3:DeleteObject",
                "s3:GetBucketLocation",
                "s3:ListMultipartUploadParts"
            ],
            "Resource": [
                "arn:aws:s3:::datastation-test-results",
                "arn:aws:s3:::datastation-test-results/*"
            ]
        }
    ]
}
```

# Data source setup

Now in DataStation, create a new data source in the left sidebar.

![Creating a new data source](/tutorials/create-data-source.gif)

Give it a nice name so you easily can find it later. And select Athena
in the Vendor dropdown.

![Creating an Athena data source](/tutorials/create-athena-data-source.png)

Fill in database as `testdata`, output bucket as the bucket you
created for query results, and region, access key id and secret access
key according to your region and user.

![Filled out Athena data source](/tutorials/athena-data-source-filled.png)

# Panel setup

Now create a new panel and select the Database type.

![Create database panel](/tutorials/create-athena-database-panel.gif)

## Run a query

Enter the following query and hit play!

```sql
SELECT * FROM basic_users;
```

![Run Athena query](/tutorials/run-athena-query.gif)

# Graph the results

There is a graph button below the query panel, beside the New Panel
button. Click it to generate a graph panel pointed at the query panel.

![Graph database results](/tutorials/graph-athena-database-results.gif)
