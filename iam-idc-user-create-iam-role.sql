/* 
This query returns API IAM CreateRole called by the IAM Identity Center user during specific window time.
Replace <EDS ID> with your Event Data Store Id number and the IAM Identity Center user <alice@example.com>.
*/

SELECT recipientAccountId, awsRegion, eventID, eventTime, errorCode, errorMessage
FROM $EDS_ID
WHERE userIdentity.principalId LIKE '%alice@example.com'
AND eventName='CreateRole'
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
