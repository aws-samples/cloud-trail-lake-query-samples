/* 
This query obtain response element for a given CloudTrail event Id.
Replace <EDS ID> with your Event Data Store Id number and the CloudTrail event Id <3270e016-59a1-4448-8dd1-d27a4796502d>
*/

SELECT responseElements
FROM <EDS ID>
WHERE eventID = '3270e016-59a1-4448-8dd1-d27a4796502d';
