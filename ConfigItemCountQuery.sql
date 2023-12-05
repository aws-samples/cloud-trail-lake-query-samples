/* 
This query will query the table created by ConfigTableCreation.sql to get an aggregated count of Configuration Items. 

Use this query to understand how many changes have happened on each resource type and resourceID. 
    
To use this query, Replace <event_data_store_id> with your Event Data Store Id.
*/

SELECT configurationItem.resourceType,
	configurationItem.resourceId,
	COUNT(configurationItem.resourceId) AS NumberOfChanges
FROM default.awsconfig
	CROSS JOIN UNNEST(configurationitems) AS t(configurationItem)
WHERE "$path" LIKE '%ConfigHistory%'
	AND configurationItem.configurationItemCaptureTime >= '2023-11-01T%'
	AND configurationItem.configurationItemCaptureTime <= '2023-11-21T%'
GROUP BY configurationItem.resourceType,
	configurationItem.resourceId
ORDER BY NumberOfChanges DESC