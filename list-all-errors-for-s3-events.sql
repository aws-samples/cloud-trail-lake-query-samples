/*This query can be used for troubleshooting purposes as it lists all the error messages for S3 source.  You can use the query for all resources, just modifying the eventSource.
Replace <EDS ID> with your Event Data Store Id number.*/

select
    eventType, eventName, errorMessage 
from
    <event_data_store_id> 
where
    errorMessage is not null  
    and eventSource='s3.amazonaws.com'example: select
        eventType, eventName, errorMessage  
    from
        <event_data_store_id>  
    where
        errorMessage is not null  
        and eventSource='s3.amazonaws.com'