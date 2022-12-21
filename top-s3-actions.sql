/* This query lists the count of data events by API actions for a specified S3 bucket
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    eventName, COUNT(*
    ) as requestCount
FROM
    $EDS_ID
WHERE
    eventSource = 's3.amazonaws.com' 
    AND eventCategory = 'Data' 
    AND eventTime > '2022-01-01 00:00:00' 
    AND eventTime < '2022-01-01 00:00:00' 
    AND element_at(requestParameters, 'bucketName'
    ) = 'my-bucket-name'
GROUP
    BY eventNameORDER BY requestCount DESC