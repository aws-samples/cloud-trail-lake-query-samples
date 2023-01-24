/* 
This query returns activity based on mutable APIs and the AWS services performed by the IAM Identity Center user during specific window time.
Replace <EDS ID> with your Event Data Store Id number and the IAM Identity Center user <alice@example.com>.
*/

SELECT eventSource, eventName, eventTime, eventID, errorCode
FROM <EDS ID>
WHERE userIdentity.principalId LIKE '%alice@example.com'
AND readOnly = false
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
