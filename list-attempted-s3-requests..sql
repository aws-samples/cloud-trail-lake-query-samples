/* This query Shows wich identity is making the most GetObject requests from S3 and what it is downloading, including error detail and attempted unauthorized accesses.
Replace <EDS ID> with your Event Data Store Id number.*/

SELECT
    userIdentity.principalId, errorMessage, element_at(requestParameters, 'bucketName' 
    ) as bucket, element_at(requestParameters, 'key' 
    ) as objectKey, count(* 
    ) as attempts
FROM
    <event_data_store_id> 
WHERE
    eventTime > '2022-01-01 00:00:00'  
    AND eventTime < '2022-01-30 00:00:00'  
    AND eventSource = 's3.amazonaws.com' 
    AND eventName = 'GetObject'
GROUP
    BY userIdentity.principalId, errorMessage, requestParametersORDER BY attempts desc