/* This query returns tag history for resources.
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    awsRegion, eventSource, json_extract_scalar(eventjson, '$.requestParameters.resourcesSet.items[0].resourceId' 
    ) as resourceId, eventTime, eventName, json_extract_scalar(eventjson, '$.requestParameters.tagSet.items[0].key' 
    ) as key, json_extract_scalar(eventjson, '$.requestParameters.tagSet.items[0].value' 
    ) as value, useridentity.arn as identityarn 
from
    $EDS_ID 
where
    eventTime > '2022-01-01 00:00:00'  
    and eventName in ('CreateTags','DeleteTags' 
    )order by resourceId,key,eventTime desc