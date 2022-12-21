/* This query returns the most retrieved S3 Objects.
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    element_at(requestParameters, 'bucketName'
    ) as bucketName,  element_at(requestParameters, 'key'
    ) as key,  COUNT(*
    ) as requestCount 
FROM
    $EDS_ID 
WHERE
    eventSource = 's3.amazonaws.com'  
    AND eventCategory = 'Data'  
    AND eventTime > '2022-01-01 00:00:00'  
    AND eventTime < '2022-01-01 00:00:00'  
    AND eventName = 'GetObject' 
GROUP
    BY requestParameters ORDER BY requestCount DESC LIMIT 20;