
/*This query will show if AWS Support has taken over the AWSServiceRoleForSupport Role, for Data Sovereignty requirements.
Replace <EDS ID> with your Event Data Store Id number.*/


select
    eventTime,  eventSource,  eventName,  awsRegion,  sourceIPAddress, userAgent,  userIdentity.type as userIdtype,  element_at(resources, 1
    ).accountId as ressourceAccountID, element_at(resources, 1
    ).arn as ressourceARN, eventType, eventCategory, managementEvent, recipientAccountId, requestParameters, responseElements 
from
    <EDS ID>
where
    eventSource = 'sts.amazonaws.com' 
    and userAgent = 'support.amazonaws.com'
