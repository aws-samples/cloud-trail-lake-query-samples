/* 

This query displays Network Activities events that traverses VPCe Endpoints and that are Access Denied events. 
The Access Denied events are typically due to VPCe policy failure. This script will provide visibility on the events
trying to access resources via VPCe.

Note: Add filter Criteria in the where clause to filter the result set. Without a filter criteria, this query will scann all 
the data and will result to very slow query.

*/

SELECT count(*) as VPCAccessDenied,
    userIdentity.arn,
    userIdentity.accountid,
    eventName,
    errorMessage,
    vpcEndpointId,
    vpcEndpointAccountId,
    sourceIPAddress
FROM <Event data store Id>
WHERE eventCategory = 'NetworkActivity'
    AND errorCode = 'VpceAccessDenied' 
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
GROUP BY 
    userIdentity.arn,
    userIdentity.accountid,
    eventName,
    errorMessage,
    vpcEndpointId,
    vpcEndpointAccountId,
    sourceIPAddress
ORDER BY eventName DESC