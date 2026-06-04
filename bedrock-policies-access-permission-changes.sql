/* 
    This query displays events related to Bedrock.
    
    It displayes SUSPICIOUS IAM/ACCESS PATTERN CHANGES.
    It looks for changes to Bedrock model access, policies, or permissions.
        
    Note: Add filter Criteria in the where clause to filter the result set. Without a filter criteria, this query will scann all 
    the data and will result to very slow query.
*/

SELECT
    eventTime,
    eventName,
    userIdentity.arn AS userArn,
    sourceIPAddress,
    requestParameters,
    responseElements
FROM
    <EVENT_DATA_STORE_ID>
WHERE
    eventSource = 'bedrock.amazonaws.com'
    AND eventName IN (
        'CreateModelCustomizationJob',
        'CreateProvisionedModelThroughput',
        'DeleteModelInvocationLoggingConfiguration',
        'PutModelInvocationLoggingConfiguration',
        'CreateGuardrail',
        'DeleteGuardrail',
        'UpdateGuardrail',
        'TagResource',
        'UntagResource'
    )
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
ORDER BY eventTime DESC;
