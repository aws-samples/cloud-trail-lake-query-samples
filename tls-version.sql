/* This query shows all API requests where the specified TLS version was not used.
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    eventName,  awsRegion,  sourceIPAddress,  recipientAccountId,  tlsDetails.tlsversion
FROM
    $EDS_ID
WHERE
    eventTime > '2022-01-01 00:00:00' 
    AND eventTime < '2022-01-01 00:00:00' 
    AND tlsDetails.tlsversion != 'TLSv1.3'
