/* 
This query count and group activity based on APIs and the AWS services performed by the IAM Identity Center user during specific window time.
Replace <EDS ID> with your Event Data Store Id number and the IAM Identity Center user <alice@example.com>.
*/

SELECT eventSource, eventName, COUNT(*) AS apiCount 
FROM <EDS ID>
WHERE userIdentity.principalId LIKE '%alice@example.com'
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
GROUP BY eventSource, eventName 
ORDER BY apiCount DESC
