/* The below query returns the list of instances without returning duplicate instance IDs. 
The latest EC2 compliance data are returned. By default, CloudTrail Lake query can return 
multiple EC2 instance compliance data because Config keeps track of historical data.

In the query below, replace config_event_data_store_ID with your own event data store ID.
*/

SELECT
  eventData.accountId, eventData.awsRegion, replace(eventData.resourceId, 'AWS::SSM::ManagedInstanceInventory/') as InstanceId, eventTime, 
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'Installed'), FoundItem -> json_extract(FoundItem, '$.Id')) as Installed,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'InstalledOther'), FoundItem -> json_extract(FoundItem, '$.Id')) as InstalledOther,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'InstalledPendingReboot'), FoundItem -> json_extract(FoundItem, '$.Id')) as InstalledPendingReboot,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'Missing'), FoundItem -> json_extract(FoundItem, '$.Id')) as Missing,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'Failed'), FoundItem -> json_extract(FoundItem, '$.Id')) as Failed
FROM (SELECT eventData, map_values(cast(json_extract(json_parse(eventJson), '$.eventData.configuration.AWS:ComplianceItem.Content.Patch') as map(varchar, json))) as PatchResult,eventTime, rank() over (partition by replace(eventData.resourceId, 'AWS::SSM::ManagedInstanceInventory/') order by eventTime desc) as rnk
    FROM config_event_data_store_ID
    WHERE eventData.resourceType = 'AWS::SSM::PatchCompliance'
) where rnk = 1