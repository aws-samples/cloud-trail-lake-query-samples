/* This query identifies the top callers of the AWS IAM service based on their number of API calls. It
   can help you identity which principals are calling IAM the most and if these principals may be close 
   to service limits.
    
    To use this query, Replace <EDS ID> with your Event Data Store Id.
*/


SELECT
	COUNT(*) AS apiCount, eventName, recipientAccountId, userIdentity.principalid
FROM
	<event_data_store_id> 
WHERE
	userIdentity.principalid IS NOT NULL AND eventTime >= '2022-01-08 00:00:00'
    AND
	    eventSource='iam.amazonaws.com'
GROUP BY
	eventName, recipientAccountId, userIdentity.principalid
ORDER BY
	apiCount DESC
