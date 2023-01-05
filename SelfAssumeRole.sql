/* This query identifies roles that are assuming themselves.

Roles assuming themselves are typically the result of unnecessary operations in code
Self assume role events count towards the STS quota.
    
    To use this query, Replace <event_data_store_id> with your Event Data Store Id.
*/


SELECT
    eventid, eventtime, userIdentity.sessioncontext.sessionissuer.arn as RoleARN, userIdentity.principalId as RoleIdColonRoleSessionName 
from
    <event_data_store_id> 
where
    eventSource = 'sts.amazonaws.com' 
    and eventName = 'AssumeRole' 
    and userIdentity.type = 'AssumedRole' 
    and errorcode IS NULL 
    and userIdentity.sessioncontext.sessionissuer.arn = element_at(resources,1
    ).arn
