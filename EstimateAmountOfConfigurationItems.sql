/* 
This query returns the estimated amount of Configuration items per resource type.

Use this query to estimate the cost of the AWS Config recorder.  
    
To use this query, Replace <event_data_store_id> with your Event Data Store Id.
*/

SELECT
    recipientAccountId, awsRegion, eventSource, count(* 
    ) as TotalPossibleCI 
FROM
    <event_data_store_id>
Where
    (eventSource like 'eks%' 
        or eventSource like 'ec2%' 
        or eventSource like 'vpc%'
        or eventSource like 'ecs%' 
        or eventSource like 'iam%' 
        or eventSource like 'autoscaling%' 
        or eventSource like 's3%' 
        or eventSource like 'rds%' 
        or eventSource like 'backup%' 
        or eventSource like 'athena%' 
        or eventSource like 'cloudtrail%' 
        or eventSource like 'cloudfront%' 
        or eventSource like 'cloudformation%' 
        or eventSource like 'code%' 
        or eventSource like 'ecr%' 
        or eventSource like 'lambda%' 
        or eventSource like 'efs%' 
    ) 
    and readOnly=False 
    and managementEvent=True 
    and eventTime > '2023-10-01 00:00:00' 
    AND eventTime < '2023-10-30 00:00:00' 
group
    by recipientAccountId, awsRegion, eventSource Order by recipientAccountId desc, TotalPossibleCI desc