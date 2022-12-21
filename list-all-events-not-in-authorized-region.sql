/* This query can be used if there are requirements to use only a subsets of AWS regions.  
It lists any events which involve non authorized regions which may help to identify non-compliance scenarios. 
Replace <EDS ID> with your Event Data Store Id number and replace <region>, <accountid> with the desired region and your account id.*/




select
    awsRegion, eventType, eventTime, eventName 
from
    <event_data_store_id> 
where
    awsRegion not in ('region','region' 
    )  
    and recipientAccountId='<accountid>': select
        awsRegion, eventType, eventTime, eventName  
    from
        <event_data_store_id>  
    where
        awsRegion not in ('<region>','<region>' 
        )  
        and recipientAccountId='<accountid>'