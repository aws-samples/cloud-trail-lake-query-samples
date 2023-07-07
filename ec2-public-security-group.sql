/*

This query returns ec2 security groups with rules that allow public (0.0.0.0/0) access. This query is useful
when you are trying to find all publicly accessible security groups.

*/

-- This part of the query returns AuthorizeSecurityGroupIngress events
SELECT
    eventName,
    userIdentity.arn AS user,
    sourceIPAddress,
    eventTime,
    eventSource,
    element_at(requestParameters, 'groupId') AS securityGroup,
    element_at(requestParameters, 'ipPermissions') AS securityGroupRule
FROM
    <event_data_store_id>
WHERE
    eventTime >= '2023-07-06 00:00:00'
    AND eventTime <= '2023-07-08 00:00:00'
    AND eventName = 'AuthorizeSecurityGroupIngress'    
    AND element_at(requestParameters, 'ipPermissions') LIKE '%0.0.0.0/0%' -- this filter is used to find security group changes with public rules.

UNION ALL

-- This part of the query returns ModifySecurityGroupRulesRequest events
SELECT
    eventName,
    userIdentity.arn AS user,
    sourceIPAddress,
    eventTime,
    eventSource,
    json_extract_scalar(element_at(requestParameters, 'ModifySecurityGroupRulesRequest'), '$.GroupId') securityGroup,
    element_at(requestParameters, 'ModifySecurityGroupRulesRequest') securityGroupRule    
FROM
    <event_data_store_id>
WHERE
	eventTime >= '2023-07-06 00:00:00'
    AND eventTime <= '2023-07-09 00:00:00'
	AND eventName = 'ModifySecurityGroupRules'
    AND element_at(requestParameters, 'ModifySecurityGroupRulesRequest') LIKE '%0.0.0.0/0%'  -- this filter is used to find security group changes with public rules.
ORDER
    BY eventTime DESC