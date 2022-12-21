/* This query analyzes CloudTrail Events and identifies any calls that are made to AWS service APIs via the AWS Management Console.
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    userIdentity.arn,eventTime,eventSource,eventName,awsRegion,sourceIPAddress,userAgent,requestParameters,readOnly,recipientAccountId,sessionCredentialFromConsole
FROM
    <event-data-store-ID>
WHERE
    sessionCredentialFromConsole = true  
    AND readOnly = false  
    AND eventTime > '2022-01-01 00:00:00'  
    AND eventTime < '2022-01-01 00:00:00'