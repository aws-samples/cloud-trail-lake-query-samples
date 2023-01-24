/* 
This query returns AWS API activity performed by an IAM user access key and from which IP address during specific time window ordered by AWS service.
Replace <EDS ID> with your Event Data Store Id number and <AKIAIOSFODNN7EXAMPLE> with the IAM user access keys.
*/

SELECT eventSource,eventName,sourceIPAddress,eventTime,errorCode
FROM <EDS ID>
WHERE userIdentity.accessKeyId = 'AKIAIOSFODNN7EXAMPLE'
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
order by eventTime;
