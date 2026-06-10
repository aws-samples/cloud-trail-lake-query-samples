/* This query identifies the source StackSet for an operation performed using StackSets with Service-Managed permissions.
Replace <$EDS_ID> with your Event Data Store Id number
Replace <$EVENT_ID> with the eventID of the beginning event
Replace eventTime dates to scope the search to a specific time range
*/


SELECT
    userIdentity.principalId,
    element_at(requestParameters, 'stackSetName') as stackSetName,
    eventName,
    eventTime,
    sourceIPAddress
FROM
    $EDS_ID 
WHERE
    eventName LIKE '%StackSet'
    AND eventTime > '2024-10-20 00:00:00'  
    AND eventTime < '2024-10-25 00:00:00'
    AND element_at(requestParameters, 'stackSetName') IN (
        SELECT
            regexp_replace(
                element_at(requestParameters, 'stackName'),
                '^StackSet-|(-[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$'
            ) AS stackName
        FROM 
            $EDS_ID
        WHERE 
            eventName LIKE '%Stack'
            AND userIdentity.principalId IN (
                SELECT 
                    userIdentity.principalid
                FROM
                    $EDS_ID
                WHERE
                    eventID = $EVENT_ID
            )
    )