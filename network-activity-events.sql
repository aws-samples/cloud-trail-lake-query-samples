/* 

AWS CloudTrail network activity for VPC endpoints is an event type that captures actions transmitted through a 
Virtual Private Cloud Endpoint.
 
This query displays all network activities that traverses VPC endpoints.

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