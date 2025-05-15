/* 

This query displays Network Activities events that traverses VPCe Endpoints and that are Access Denied events in S3. 
The Access Denied events are typically due to VPCe policy failure. This script will provide visibility on the events
trying to access your s3 bucket via VPCe.

Note: Add filter Criteria in the where clause to filter the result set. Without a filter criteria, this query will scann all 
the data and will result to very slow query.

*/

SELECT userIdentity.username,
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
    AND eventSource = 's3.amazonaws.com' 
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