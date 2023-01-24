/* 
This query helps to confirm successful activity performed by IAM role during specific window time.
Replace <EDS ID> with your Event Data Store Id number and the <arn:aws:iam::555555555555:role/alice> with the IAM role ARN.
*/

SELECT eventSource, eventName, eventTime, eventID, errorCode 
FROM <EDS ID> 
WHERE eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
AND useridentity.type = 'AssumedRole'
AND useridentity.sessioncontext.sessionissuer.arn = 'arn:aws:iam::555555555555:role/alice';
