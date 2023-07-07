/*

This query returns historical changes of security groups. This is useful when you are auditing / investigating
changes made to security groups.

*/

-- This part of the query returns AuthorizeSecurityGroupIngress events
SELECT
    element_at(requestParameters, 'groupId') AS securityGroup,
    eventName,
    eventTime,
    element_at(requestParameters, 'ipPermissions') AS securityGroupRule,
    userIdentity.arn AS user,
    sourceIPAddress,    
    eventSource
FROM
    <event_data_store_id>
WHERE
    eventTime >= '2023-07-06 00:00:00'
    AND eventTime <= '2023-07-08 00:00:00'
    AND eventName = 'AuthorizeSecurityGroupIngress'     

UNION ALL

-- This part of the query returns ModifySecurityGroupRulesRequest events
SELECT
    json_extract_scalar(element_at(requestParameters, 'ModifySecurityGroupRulesRequest'), '$.GroupId') securityGroup,
    eventName,
    eventTime,
    element_at(requestParameters, 'ModifySecurityGroupRulesRequest') securityGroupRule,
    userIdentity.arn AS user,
    sourceIPAddress,    
    eventSource
FROM
    <event_data_store_id>
WHERE
	eventTime >= '2023-07-06 00:00:00'
    AND eventTime <= '2023-07-09 00:00:00'
	AND eventName = 'ModifySecurityGroupRules'
ORDER BY securityGroup,
    eventTime