/* 
This query returns IAM Identity Center users who has authenticated into IAM Identity Center portal during specific window time.
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT userIdentity.username, eventTime, recipientAccountId, awsRegion, sourceIPAddress, eventID
FROM FROM <EDS ID>
WHERE eventSource = 'sso.amazonaws.com'
AND eventName = 'Authenticate'
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
