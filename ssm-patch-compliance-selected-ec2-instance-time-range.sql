/* The following query has a filter for EC2 instance where you can replace <instance id> 
in the below query with your own EC2 instance ID to identity patch compliance status for the specific instance. 
The query has a filter for eventTime as well.  You can search patch compliance status based on specific time ranges.

In the query below, replace config_event_data_store_ID with your own event data store ID.
*/

SELECT
  replace(eventData.resourceId, 'AWS::SSM::ManagedInstanceInventory/') as InstanceId,eventData.accountId, eventData.awsRegion, eventTime,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'Installed'), FoundItem -> json_extract(FoundItem, '$.Id')) as Installed,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'InstalledOther'), FoundItem -> json_extract(FoundItem, '$.Id')) as InstalledOther,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'InstalledPendingReboot'), FoundItem -> json_extract(FoundItem, '$.Id')) as InstalledPendingReboot,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'Missing'), FoundItem -> json_extract(FoundItem, '$.Id')) as Missing,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'Failed'), FoundItem -> json_extract(FoundItem, '$.Id')) as Failed
FROM (
    SELECT eventData, map_values(cast(json_extract(json_parse(eventJson), '$.eventData.configuration.AWS:ComplianceItem.Content.Patch') as map(varchar, json))) as PatchResult,
  eventTime
    FROM config_event_data_store_ID
    WHERE eventData.resourceType = 'AWS::SSM::PatchCompliance' 
  AND replace(eventData.resourceId, 'AWS::SSM::ManagedInstanceInventory/') = '<instance id such as i-123456789012>'
  AND eventTime > '2023-06-23 00:00:00'
  AND eventTime < '2023-06-25 12:00:00'
) where PatchResult is not null;