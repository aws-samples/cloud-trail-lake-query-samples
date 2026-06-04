/* 
    This query displays events related to Bedrock.
    
    It displayes DATA EXFILTRATION INDICATORS. 
    It Look for knowledge base and agent-related activity (potential data access).
        
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
    AND eventName IN (
        'Retrieve',
        'RetrieveAndGenerate',
        'GetKnowledgeBase',
        'ListKnowledgeBases',
        'GetDataSource',
        'ListDataSources',
        'GetAgent',
        'ListAgents',
        'InvokeAgent'
    )
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
ORDER BY eventTime DESC;


