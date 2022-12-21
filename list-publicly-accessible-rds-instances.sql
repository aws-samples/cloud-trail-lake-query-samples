/* This query lists Publicly Accessible RDS Instances. 
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    *
FROM
    $EDS_ID 
WHERE
    eventsource = 'rds.amazonaws.com'  
    AND eventname = 'CreateDBInstance'  
    AND ELEMENT_AT(requestParameters, 'publiclyAccessible' 
    ) = 'true'SELECT
    *
FROM
    $EDS_ID 
WHERE
    eventsource = 'rds.amazonaws.com'  
    AND eventname = 'CreateDBInstance'  
    AND ELEMENT_AT(requestParameters, 'publiclyAccessible' 
    ) = 'true'