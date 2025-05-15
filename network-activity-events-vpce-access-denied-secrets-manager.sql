/* 

This query displays Access Denied, Network Activities events that traverses VPCe Endpoints trying to access Secrets Manager 
resources. The Access Denied events are typically due to VPCe policy failure. This script will provide visibility on the events
trying to access your secrets in Secrets Manager via VPC endpoint.

Note: Add filter Criteria in the where clause to filter the result set. Without a filter criteria, this query will scann all 
the data and will result to very slow query.

*/

SELECT eventTime,
    userIdentity.username,
    userIdentity.accountid,
    eventType,
    eventCategory,
    eventName,
    errorCode,
    errorMessage,
    vpcEndpointId,
    vpcEndpointAccountId,
    sourceIPAddress
FROM <Event data store Id>
WHERE eventCategory = 'NetworkActivity'
    AND eventSource = 'secretsmanager.amazonaws.com'
    AND errorCode = 'VpceAccessDenied' 
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
ORDER BY eventTime