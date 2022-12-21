/* This query analyzes CloudTrail Events and identifies any calls that result in errors.
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    userIdentity.arn,eventTime,eventSource,eventName,awsRegion,sourceIPAddress,userAgent,errorCode,errorMessage,requestParameters,readOnly,resources,recipientAccountId,tlsDetails
FROM
    <event-data-store-ID>
WHERE
    errorCode IS NOT NULL  
    AND eventTime > '2022-01-01 00:00:00'  
    AND eventTime < '2022-01-01 00:00:00'