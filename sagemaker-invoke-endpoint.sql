/* 
    This query displays events related to Sagemaker.
    
    It displayes InvokeEndpoint and InvokeEndpointAsync which are used for standard invocations
    and InvokeEndpointWithResponseStream which is commonly used for GEN AI and LLM usecases.
    
        
    Note: 
    1. Add filter Criteria in the where clause to filter the result set. Without a filter criteria, this query will scann all 
    the data and will result to very slow query.
    2. eventSource filter is wildcard because sources can be from sagemaker or runtime.sagemaker 
*/

SELECT
    eventTime,
    eventName,
    userIdentity.arn AS userArn,
    userIdentity.type AS identityType,
    sourceIPAddress,
    userAgent,
    awsRegion,
    errorCode,
    errorMessage
FROM
    <Event data store Id>
WHERE
    eventSource LIKE '%sagemaker.amazonaws.com'
    AND eventName IN ('InvokeEndpoint', 'InvokeEndpointAsync', 'InvokeEndpointWithResponseStream')
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
ORDER BY eventTime DESC;


