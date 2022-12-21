/* This query returns console logins with no MFA. 
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    *
FROM
    $EDS_ID 
WHERE
    eventsource = 'signin.amazonaws.com'  
    AND eventname = 'ConsoleLogin'  
    AND Element_at(additionaleventdata, 'MFAUsed' 
    ) = 'No'