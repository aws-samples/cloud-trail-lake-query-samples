/* 
    This query displays events related to Bedrock.
    
    It displayes CreateInference event. This event can be commonly used by an unauthorized user. Use this query to investigate
    if the events are authorized. 

    Note: 
    1. Add filter Criteria in the where clause to filter the result set. Without a filter criteria, this query will scann all 
    the data and will result to very slow query.
    2. Notice the eventSource is bedrock-mantle.amazonaws.com rather than bedrock.amazonaws.com because requests sent 
    to OpenAI/Anthropic-compatible are logged with eventSource bedrock-mantle.amazonaws.com in CloudTrail.
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
    eventSource = 'bedrock-mantle.amazonaws.com'
    AND eventName IN ('CreateInference')
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
ORDER BY eventTime DESC;


