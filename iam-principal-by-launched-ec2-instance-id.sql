/* 
This query confirms who (principal Id) has launched an EC2 instance.
Replace <EDS ID> with your Event Data Store Id number and the <i-b188560f> with the EC2 instance that you are looking for.
*/

SELECT userIdentity.principalid, eventName, eventTime, recipientAccountId, awsRegion 
FROM <EDS ID>
WHERE responseElements IS NOT NULL AND
element_at(responseElements, 'instancesSet') like '%"instanceId":"i-b188560f"%' 
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
AND eventName='RunInstances'
