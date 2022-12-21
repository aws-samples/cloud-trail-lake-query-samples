/* This query returns raw records for all "scan" DunamoDB management events.
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    *
FROM
    $EDS_ID 
WHERE
    eventsource = 'dynamodb.amazonaws.com'  
    AND eventname = 'scan'