/* 
This query creates an athena table named awsconfig. 

Use this query to create a table that can be used to get an aggregated count of AWS Config configuration items. 
    
To use this query, Replace <event_data_store_id> with your Event Data Store Id, and replace LOCATION with path to the bucket where your AWS Config snapshot is delivered.
*/

CREATE EXTERNAL TABLE awsconfig (
	fileversion string,
	configSnapshotId string,
	configurationitems ARRAY < STRUCT < configurationItemVersion: STRING,
	configurationItemCaptureTime: STRING,
	configurationStateId: BIGINT,
	awsAccountId: STRING,
	configurationItemStatus: STRING,
	resourceType: STRING,
	resourceId: STRING,
	resourceName: STRING,
	ARN: STRING,
	awsRegion: STRING,
	availabilityZone: STRING,
	configurationStateMd5Hash: STRING,
	resourceCreationTime: STRING > >
)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
LOCATION 's3://config-bucket-PATH';