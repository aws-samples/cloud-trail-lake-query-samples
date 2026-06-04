/* 
    This query displays events related to Bedrock.
    
    It displayes MODEL ACCESS & CONFIGURATION CHANGES. 
    It Look if someone enabled new models or changed access.
        
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
        'GetFoundationModelAvailability',
        'PutFoundationModelEntitlement',
        'CreateFoundationModelAgreement',
        'DeleteFoundationModelAgreement',
        'PutUseCaseForModelAccess',
        'ListFoundationModelAgreementOffers'
    )
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
ORDER BY eventTime DESC;


