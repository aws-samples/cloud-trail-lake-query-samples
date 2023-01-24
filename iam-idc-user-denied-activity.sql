/* 
This query returns denied activity based errorCode response and the AWS services performed by the IAM Identity Center user during specific window time.
Replace <EDS ID> with your Event Data Store Id number and the IAM Identity Center user <alice@example.com>.
*/

SELECT recipientAccountId, awsRegion, eventSource, eventName, readOnly, errorCode, errorMessage, eventTime, eventID
FROM <EDS ID>
WHERE userIdentity.principalId LIKE '%alice@example.com'
AND (errorCode = 'AccessDenied' OR errorCode LIKE '%Unauthorized%')
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
