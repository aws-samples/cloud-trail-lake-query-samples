/* 
This query returns EC2 instances information created across the organization during specific window time.
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT recipientAccountId, awsRegion, eventID, element_at(responseElements, 'instancesSet') as instances
FROM <EDS ID>
WHERE eventName='RunInstances'
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
