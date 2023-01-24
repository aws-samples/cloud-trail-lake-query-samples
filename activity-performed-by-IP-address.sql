/* 
This query confirms if there were any activity performed from IP address in other AWS accounts in your organization except one during specific window time grouped by AWS account.
Replace <EDS ID> with your Event Data Store Id number, the <192.0.2.76> with the IP address you are looking for and the <555555555555> with the AWS account you want to exclude.
*/

SELECT useridentity.accountid 
FROM <EDS ID> 
WHERE sourceIPAddress = '192.0.2.76'
AND eventTime > '2023-01-01 00:00:00' AND eventTime < '2023-01-07 00:00:00' 
AND useridentity.accountid != '555555555555' 
GROUP by useridentity.accountid;
