/* This query results are a list in chronological order of DB reboots that have occured
Replace <EDS ID> with your Event Data Store Id number.
*/


SELECT
    element_at(requestParameters, 'dBInstanceIdentifier'  
    ) as DBInstance, userIdentity.sessionContext.sessionIssuer.userName as UserName, eventTime as RebootTime
FROM
    $EDS_ID 
WHERE
    eventName = 'RebootDBInstance'ORDER BY eventTime DESC