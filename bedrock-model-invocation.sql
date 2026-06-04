/* 
    This query displays events related to Bedrock.
    
    It displayes MODEL INVOCATIONS (Detect unauthorized model usage). 
    It looks for InvokeModel/InvokeModelWithResponseStream calls.
        
    Note: Add filter Criteria in the where clause to filter the result set. Without a filter criteria, this query will scann all 
    the data and will result to very slow query.
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
    eventSource = 'bedrock.amazonaws.com'
    AND eventName IN ('InvokeModel', 'InvokeModelWithResponseStream')
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
ORDER BY eventTime DESC;


