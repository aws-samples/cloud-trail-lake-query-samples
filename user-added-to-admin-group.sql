/* This query returns when some user was made admin and who did it (added to any groups with name containing word ‘admin’). Helps identifying privilege escalation related issues.
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    userIdentity.principalid, eventName, eventTime, element_at(requestParameters,'userName'  
    ) AS username, element_at(requestParameters,'groupName'  
    ) AS groupname
FROM
    $EDS_ID
WHERE
    eventTime > '2022-04-30 00:00:00'  
    AND eventTime < '2022-11-01 00:00:00'  
    AND eventName = 'AddUserToGroup'  
    AND element_at(requestParameters,'groupName'  
    ) like '%admin%'