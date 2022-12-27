/* This query identifies buckets across an Organization with requests that rely on ACLs. This can help when migrating away from legacy ACLs to IAM Policies.

Replace <EDS ID> with your Event Data Store ID number.
*/

SELECT DISTINCT
    element_at(requestParameters, 'bucketName') AS Bucket,
    awsRegion AS Region,
    recipientAccountId AS AccountID
FROM
    <EDS_ID> 
WHERE
	element_at(additionalEventData, 'aclRequired') = 'Yes'
ORDER BY
	recipientAccountId,
    awsRegion