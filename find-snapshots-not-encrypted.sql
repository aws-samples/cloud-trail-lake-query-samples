/* This query returns snapshots that are created which are not encrypted.  
Replace <EDS ID> with your Event Data Store Id number.
*/


select
    userIdentity.principalid,awsRegion,element_at(requestParameters,'volumeId'  
    ) as volume, json_extract(element_at(requestparameters, 'CreateSnapshotsRequest'  
        ),'$.InstanceSpecification.InstanceId'  
    ) as Instance, element_at(responseElements,'snapshotId'  
    ) as snapshotID 
from
    $EDS_ID
where
    eventName like '%CreateSnapshots%'  
    or eventName like '%CreateSnapshot'  
    and element_at(responseElements,'encrypted'  
    )='false'  
    and eventTime < '2022-01-01 00:00:00'  
    and eventTime > '2022-11-11 00:00:00' 