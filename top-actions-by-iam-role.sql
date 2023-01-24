/* 
This query count activity performed by an IAM role during specific time period grouped by AWS services and APIs.
Replace <EDS ID> with your Event Data Store Id number and the <arn:aws:iam::555555555555:role/alice> with the IAM role ARN.
*/

SELECT count (*) as NumberEvents, eventSource, eventName
FROM <EDS ID> 
WHERE eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00' 
AND useridentity.type = 'AssumedRole' 
AND useridentity.sessioncontext.sessionissuer.arn = 'arn:aws:iam::555555555555:role/alice'
GROUP by eventSource, eventName
order by NumberEvents desc;
