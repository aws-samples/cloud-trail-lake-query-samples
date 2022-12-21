/* This query returns Aurora PostgreSQL databases with Availability zone information.
Replace <EDS ID> with your Event Data Store Id number.
*/


SELECT
    element_at(requestParameters, 'dBInstanceIdentifier'
    ) as DBInstance, element_at(requestParameters, 'engine'
    ) as Engine, element_at(requestParameters, 'engineVersion'
    ) as DBEngineVersion,  element_at(requestParameters, 'availabilityZone'
    ) as AvailabilityZone
FROM
    $EDS_ID 
WHERE
    element_at(requestParameters, 'engine'
    ) = 'aurora-postgresql' 
    and eventname = 'CreateDBInstance' 
    and eventTime >='2021-01-01 00:00:00' 
    and eventTime < '2022-01-01 00:00:00'