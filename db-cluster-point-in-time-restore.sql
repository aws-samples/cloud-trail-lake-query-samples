/* This query returns source and target of an RDS point in time restore
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    element_at(requestParameters, 'sourceDBClusterIdentifier' 
    ) as Source, element_at(requestParameters, 'dBClusterIdentifier' 
    ) as Target, userIdentity.sessionContext.sessionIssuer.userName as UserName, eventTime as RestoreTime
FROM
    $EDS_ID 
WHERE
    eventName = 'RestoreDBClusterToPointInTime'