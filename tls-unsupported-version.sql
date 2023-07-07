/*

This query provides events with TLS version and event source. This query is helpful when you are trying to find
specific version of TLS. Eg: If you’re trying to find events realted to TLSv1 (which will have a end of support on June 28. 2023),
You can include in the filter criteria AND CAST(REPLACE(tlsDetails.tlsVersion, 'TLSv', '') AS DOUBLE) <= 1.1
This filters all TLS connections with 1.1 and below.

*/

SELECT
    eventSource,
    tlsDetails.tlsVersion,
    sourceIPAddress,
    recipientAccountId,
    COUNT(*) AS numOutdatedTlsCalls
FROM
    <event_data_store_id>
WHERE
    eventTime >= '${date_filter}' -- Eg: '2023-06-20 00:00:00'
    AND eventTime <= '${date_filter}' -- Eg: '2023-06-27 00:00:00'
    AND tlsDetails.tlsVersion LIKE 'TLSv%'
    AND CAST(REPLACE(tlsDetails.tlsVersion, 'TLSv', '') AS DOUBLE) <= 1.1
GROUP BY
    eventSource,
    tlsDetails.tlsVersion,
    sourceIPAddress,
    recipientAccountId
ORDER BY
    numOutdatedTlsCalls DESC
