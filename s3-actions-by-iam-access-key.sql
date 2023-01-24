/* 
This query obtain S3 bucket and object names affected by an IAM user access kesy during a specifc window time.
Replace <EDS ID> with your Event Data Store Id number and the <AKIAIOSFODNN7EXAMPLE> with the IAM user access keys.
*/

SELECT element_at(requestParameters, 'bucketName') as BucketName, element_at(requestParameters, 'key') as ObjectName, eventName 
FROM <EDS ID>
WHERE (eventName = 'CopyObject' OR eventName = 'DeleteObject' OR eventName = 'DeleteObjects' OR eventName = 'GetObject' OR eventName = 'HeadObject' OR eventName = 'PutObject') 
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
AND userIdentity.accessKeyId = 'AKIAIOSFODNN7EXAMPLE'
