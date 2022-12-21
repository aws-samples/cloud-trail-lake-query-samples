/* This query modifications to CloudTrail trails.
Replace <EDS ID> with your Event Data Store Id number.
*/


SELECT
    eventName, element_at(requestParameters,'name' 
    ), userIdentity.principalid, eventTime
FROM
    $EDS_ID 
WHERE
    eventTime > '2022-01-01 00:00:00'  
    AND eventTime < '2022-01-01 00:00:00'  
    AND ( eventName = 'CreateTrail'  
        or eventName = 'UpdateTrail'  
        or eventName = 'DeleteTrail'  
        or eventName = 'StartLogging'  
        or eventName = 'StopLogging'  
    )