/* This query shows counts of all Data events by Day of the Week. 
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    day_of_week(eventTime
    ) as weekday,  COUNT(*
    ) as eventCount
FROM
    $EDS_ID
WHERE
    eventTime > '2022-01-01 00:00:00' 
    AND eventTime < '2022-01-01 00:00:00' 
    AND eventCategory = 'Data'
GROUP
    BY day_of_week(eventTime
    )ORDER BY day_of_week(eventTime
    )