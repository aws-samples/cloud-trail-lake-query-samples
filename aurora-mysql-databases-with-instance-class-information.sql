/* This query returns Aurora MySQL databases with Instance class information created from beginning of 2022. 
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    element_at(requestParameters, 'dBInstanceIdentifier' 
    ) as DBInstance, element_at(requestParameters, 'dBInstanceClass' 
    ) as InstanceClass, element_at(requestParameters, 'engine' 
    ) as Engine, eventTime as DateTime
FROM
    $EDS_ID 
WHERE
    element_at(requestParameters, 'engine' 
    ) = 'aurora-mysql'  
    and eventname = 'CreateDBInstance'  
    and eventTime >='2022-01-01 00:00:00'