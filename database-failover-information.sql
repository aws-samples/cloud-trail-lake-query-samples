/* This query returns database failover information: Returns Region, DB, user, and time of a failover event for a database
Replace <EDS ID> with your Event Data Store Id number.
*/


SELECT
    awsRegion as AWSRegion,  element_at(requestParameters, 'dBClusterIdentifier'
    ) as DBCluster, userIdentity.sessionContext.sessionIssuer.userName as UserName, eventTime as FailoverTime
FROM
    $EDS_ID 
WHERE
    eventName = 'FailoverDBCluster'