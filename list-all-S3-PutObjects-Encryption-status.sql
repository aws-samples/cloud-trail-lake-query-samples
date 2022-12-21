/* This query lists the encryption status of Objects uploaded to S3 buckets in the descending order of event time.
Replace <EDS ID> with your Event Data Store Id number.*/

/*Pre-reqs:
Activate data events for S3 and perform upload operations in the S3 bucket which has encryption enabled/disabled and upload object with encryption enabled/disabled. 
*/

select
    recipientAccountId, eventTime, element_at(requestParameters,'bucketName'
    ) AS S3BUCKET , element_at(requestParameters,'key'
    ) AS S3OBJECT, element_at(requestParameters,'x-amz-server-side-encryption'
    ) AS ReqENCRYPTION,element_at(responseElements,'x-amz-server-side-encryption'
    ) AS RespENCRYPTION 
from
    $EDS_ID 
where
    eventName='PutObject' order by eventTime desc