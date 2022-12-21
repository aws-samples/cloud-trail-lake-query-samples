/* This query returns details when a RDS DB was deleted without taking final snapshot.
Replace <EDS ID> with your Event Data Store Id number.
*/


SELECT
    element_at(requestParameters, 'dBClusterIdentifier' 
    ) as DBCluster, userIdentity.sessionContext.sessionIssuer.userName as UserName, eventTime as DeletedTime
FROM
    $EDS_ID 
WHERE
    eventName = 'DeleteDBCluster'  
    and element_at(requestParameters, 'skipFinalSnapshot' 
    ) = 'true'