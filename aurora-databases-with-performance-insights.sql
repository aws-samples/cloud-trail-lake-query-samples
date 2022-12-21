/* This query returns Aurora Postgresql DB instances that have performance insights enabled
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    element_at(requestParameters, 'dBInstanceIdentifier' 
    ) as DBInstance, element_at(requestParameters, 'engine' 
    ) as Engine, element_at(requestParameters, 'engineVersion' 
    ) as DBEngineVersion
FROM
    $EDS_ID 
WHERE
    element_at(requestParameters, 'engine' 
    ) = 'aurora-postgresql'  
    and eventname = 'CreateDBInstance' 
    and element_at(requestParameters, 'enablePerformanceInsights' 
    ) = 'true'