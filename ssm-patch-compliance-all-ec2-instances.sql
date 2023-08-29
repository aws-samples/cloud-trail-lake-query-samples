/* The SQL query will be run against the configuration items that been collected from the resource type, 
AWS::SSM::PatchCompliance, as part of the config rule ec2-managedinstance-patch-compliance-status-check.

In the query below, replace config_event_data_store_ID with your own event data store ID.
*/

SELECT
  eventData.accountId, eventData.awsRegion, replace(eventData.resourceId, 'AWS::SSM::ManagedInstanceInventory/') as InstanceId, eventTime,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'Installed'), FoundItem -> json_extract(FoundItem, '$.Id')) as Installed,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'InstalledOther'), FoundItem -> json_extract(FoundItem, '$.Id')) as InstalledOther,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'InstalledPendingReboot'), FoundItem -> json_extract(FoundItem, '$.Id')) as InstalledPendingReboot,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'Missing'), FoundItem -> json_extract(FoundItem, '$.Id')) as Missing,
  transform(filter(PatchResult, PatchItem -> cast(json_extract(PatchItem, '$.PatchState') as varchar) = 'Failed'), FoundItem -> json_extract(FoundItem, '$.Id')) as Failed
FROM (
    SELECT eventData, map_values(cast(json_extract(json_parse(eventJson), '$.eventData.configuration.AWS:ComplianceItem.Content.Patch') as map(varchar, json))) as PatchResult,eventTime
    FROM config_event_data_store_ID 
    WHERE eventData.resourceType = 'AWS::SSM::PatchCompliance'
) where PatchResult is not null