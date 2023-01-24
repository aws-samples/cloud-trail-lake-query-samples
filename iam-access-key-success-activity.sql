/* 
This query obtain successful activity performed by IAM user access key during specific window time grouped by AWS services and API.
Replace <EDS ID> with your Event Data Store Id number and the <AKIAIOSFODNN7EXAMPLE> with the IAM user access keys.
*/

SELECT count (*) as NumberEvents, eventSource, eventName
FROM <EDS ID>
WHERE eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
AND userIdentity.accessKeyId = 'AKIAIOSFODNN7EXAMPLE'
AND errorcode IS NULL
GROUP by eventSource, eventName
order by NumberEvents desc;
