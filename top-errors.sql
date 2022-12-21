/* This query lists the top Error messages for the specified time range
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    errorCode,  errorMessage,  COUNT(*
    ) as eventCount
FROM
    $EDS_ID
WHERE
    eventTime > '2022-01-01 00:00:00' 
    AND eventTime < '2022-01-01 00:00:00' 
    AND (errorCode is not null 
        or errorMessage is not null
    )
GROUP
    BY errorCode, errorMessageORDER BY eventCount DESCLIMIT 10;