/* 
This query helps to confirm which IAM role was assumed by an IAM user access keys during specific window time.
Replace <EDS ID> with your Event Data Store Id number and <AKIAIOSFODNN7EXAMPLE> with the IAM user access keys.
*/

SELECT requestParameters,responseElements
FROM <EDS ID>
WHERE eventName = 'AssumeRole'
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
AND userIdentity.accessKeyId = 'AKIAIOSFODNN7EXAMPLE';
