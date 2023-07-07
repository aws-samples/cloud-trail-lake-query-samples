/* 

This query returns the historical changes on the public access block policy of s3 buckets. This query is useful when you are 
trying to audit public access block changes or trying to find buckets that are exposed in the internet.

If you are trying to find the current bucket policy that are allowing public access, look at the result set of this query.
Check each bucket and  check if the blockPublicPolicy = false.

*/

SELECT
	element_at(requestParameters, 'bucketName') AS bucketName,
    json_extract_scalar(element_at(requestParameters, 'PublicAccessBlockConfiguration'), '$.RestrictPublicBuckets') AS restrictPublicBuckets,
    json_extract_scalar(element_at(requestParameters, 'PublicAccessBlockConfiguration'), '$.BlockPublicPolicy') AS blockPublicPolicy,
    element_at(requestParameters, 'PublicAccessBlockConfiguration') AS publicAccessBlockConfiguration,
    eventName,
    eventTime,
    requestParameters,
    userIdentity.arn AS user,
    responseElements
FROM
    <event_data_store_id>
WHERE
    eventTime >= '2023-07-07 00:00:00'
    AND eventSource = 's3.amazonaws.com'
    and element_at(requestParameters, 'bucketName') = 'demo-20230707'
    and eventName IN ('PutPublicAccessBlock', 'DeletePublicAccessBlock', 'PutBucketPublicAccessBlock')    
ORDER BY
	bucketName,
    eventTime DESC
    