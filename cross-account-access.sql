/* This query returns results where cross-account access was granted. 
Replace <EDS ID> with your Event Data Store Id number.
*/


SELECT
    userIdentity.principalid, eventName, eventSource, userIdentity.accountId, recipientAccountId, requestParameters, eventTime
FROM
    $EDS_ID 
WHERE
    eventTime > '2022-04-30 00:00:00'  
    AND eventTime < '2022-06-01 00:00:00'  
    AND userIdentity.accountId != recipientAccountId