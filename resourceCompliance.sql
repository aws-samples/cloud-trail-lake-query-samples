/* 
This query returns the PutEvaluation result for Config rules.

Essentially providing the same information returned by the overall resource compliance CI type.
    
To use this query, Replace <event_data_store_id> with your Event Data Store Id.
*/

SELECT
    eventTime,awsRegion, recipientAccountId, element_at(additionalEventData, 'configRuleName'  
    ) as configRuleName, json_extract_scalar(json_array_get(element_at(requestParameters,'evaluations' 
        ),0 
        ),'$.complianceType' 
    ) as Compliance, json_extract_scalar(json_array_get(element_at(requestParameters,'evaluations' 
        ),0 
        ),'$.complianceResourceType' 
    ) as ResourceType, json_extract_scalar(json_array_get(element_at(requestParameters,'evaluations' 
        ),0 
        ),'$.complianceResourceId' 
    ) as ResourceName
FROM
    <event_data_store_id>
WHERE
    eventName='PutEvaluations'  
    AND eventTime > '2023-11-16 00:00:00'  
    AND eventTime < '2023-11-17 00:00:00' 
    And json_extract_scalar(json_array_get(element_at(requestParameters,'evaluations' 
        ),0 
        ),'$.complianceType' 
    ) IN ('COMPLIANT','NON_COMPLIANT'
    ) 