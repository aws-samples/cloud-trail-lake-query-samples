/* 
    This query displays events related to Bedrock and is useful when investigating potential unauthorized bedrock usage
    
    It displayes InvokeModel, InvokeModel/InvokeModelWithResponseStream, Converse, and ConverseStream. 
    1. InvokeModel and InvokeModel/InvokeModelWithResponseStream are commonly used for MODEL INVOCATIONS and can be used to investigate unauthorized model usage.
    2. Converse and ConverseStream are commonly used for chatbots, agents, text app, etc and can be use to investigate unauthorized usage.
        
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
    AND eventName IN ('InvokeModel', 'InvokeModelWithResponseStream', 'Converse', 'ConverseStream')
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
ORDER BY eventTime DESC;


