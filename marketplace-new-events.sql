/* 
    This query displays events related to Marketplace and is useful when investigating potential unauthorized Marketplace activities
    
    1. This query displayes requestParameters and responseElements which contains the agreementRequest details.
    2. This query pulls events such as 'CreateAgreementRequest', 'AcceptAgreementRequest', 'CancelAgreement', 'AcceptAgreementApprovalRequest',
        'RejectAgreementApprovalRequest', 'Subscribe', 'Unsubscribe'. These are common events that are useful to look at during an
        active security incident and investigate if the events are legitimate and authorized.        
            
    Note: Add filter Criteria in the where clause to filter the result set. Without a filter criteria, this query will scann all 
    the data and will result to very slow query.
*/

SELECT
    eventTime,
    eventName,
    userIdentity.arn AS userArn,
    userIdentity.type AS identityType,
    sourceIPAddress,
    requestParameters,
    responseElements,
    userAgent,
    awsRegion,
    errorCode,
    errorMessage
FROM
    <Event data store Id>
WHERE
    eventSource eventSource IN (
        'agreement-marketplace.amazonaws.com',
        'aws-marketplace.amazonaws.com'
    )
    AND eventName IN (
        'CreateAgreementRequest',
        'AcceptAgreementRequest',
        'CancelAgreement',
        'AcceptAgreementApprovalRequest',
        'RejectAgreementApprovalRequest',
        'Subscribe',
        'Unsubscribe'
    )
    AND eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
ORDER BY eventTime DESC;


