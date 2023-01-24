/* 
This query helps to confirm in which AWS accounts the IAM Identify Center user has federated using which IAM roles during specific window time.
Replace <EDS ID> with your Event Data Store Id number and the IAM Identity Center user <alice@example.com>.
*/

SELECT element_at(serviceEventDetails, 'account_id') as AccountID, element_at(serviceEventDetails, 'role_name') as SSORole, eventID, eventTime
FROM <EDS ID>
WHERE eventSource = 'sso.amazonaws.com'
AND eventName = 'Federate'
AND userIdentity.username = 'alice@example.com'
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00'
