/* This query returns summary of regions in use and well as what services are used in these regions.
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    awsRegion, eventSource, COUNT(*  
    ) AS apiCount 
FROM
    $EDS_ID 
WHERE
    eventTime > '2022-04-23 00:00:00'  
    AND eventTime < '2022-11-26 00:00:00' 
GROUP
    BY awsRegion, eventSource ORDER BY apiCount DESC