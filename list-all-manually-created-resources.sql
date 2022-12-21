/*This query gets a list of all resources that have been created manually (i.e outside of CloudFormation or via set list of CI/CD users), along with details on the action taken. 
Replace <EDS ID> with your Event Data Store Id number.*/

SELECT
    userIdentity.arn AS user, userIdentity, eventTime, eventSource, eventName, awsRegion, requestParameters, resources, requestID, eventID
FROM
    <EDS ID>
WHERE
    (eventName LIKE '%Create%' 
        OR eventName LIKE '%Update%' 
        OR eventName LIKE '%Put%' 
        OR eventName LIKE '%Delete%'
    )
    AND resources IS NOT NULL
    AND userIdentity.sessioncontext.sessionissuer.username NOT LIKE 'AWSServiceRole%'
    AND userIdentity.sessioncontext.sessionissuer.username NOT IN (''
    )
    AND sourceIpAddress != 'cloudformation.amazonaws.com'ORDER BY eventTime DESC