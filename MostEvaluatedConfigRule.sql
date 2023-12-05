/* 
This query returns the amount of times an AWS Config rule has been evaluated.

Use this query to Get a total count for the number of times AWS Config rules have been evaluated. 
    
To use this query, Replace <event_data_store_id> with your Event Data Store Id.
*/

SELECT
    count(*
    ) as TotalEvents, date(eventTime
    ) as datestamp,awsRegion, recipientAccountId, element_at(additionalEventData, 'configRuleName'
    ) as configRuleName, element_at(additionalEventData, 'configRuleArn'
    ) as configRuleArn
FROM 
<event_data_store_id>
WHERE
    eventName= 'PutEvaluations'
    and eventTime > '2022-11-01 00:00:00'
    AND eventTime < '2022-11-22 00:00:00'
group
    by date(eventTime
    ), awsRegion, recipientAccountId, additionalEventData
order 
	by date(eventTime
    ) desc, TotalEvents desc, recipientAccountId