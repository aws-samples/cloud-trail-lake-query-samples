/* 
This query returns information about API IAM PutRolePolicy called by the IAM Identity Center user during specific window time.
Replace <EDS ID> with your Event Data Store Id number and the IAM Identity Center user <alice@example.com>.
*/

SELECT recipientAccountId, eventID, eventTime, element_at(requestParameters, 'roleName') as roleName, element_at(requestParameters, 'policyDocument') as policyDocument 
FROM $EDS_ID
WHERE userIdentity.principalId LIKE '%alice@example.com'
AND eventName='PutRolePolicy'
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
