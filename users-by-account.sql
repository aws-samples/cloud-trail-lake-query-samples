/* This query returns all requests by user by account for the specified time period. Ordered by request count. 
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    userIdentity.principalid, useridentity.accountId, count(* 
    ) as eventCount 
FROM
    $EDS_ID 
WHERE
    userIdentity.principalid IS NOT NULL  
    AND eventTime > '2022-01-01 00:00:00'  
    AND eventTime < '2022-01-01 00:00:00'
GROUP
    BY userIdentity.principalid, useridentity.accountId ORDER BY EventCount DESC