/* This query lists raw records for all EC2 management events.
Replace <EDS ID> with your Event Data Store Id number.
*/

SELECT
    *
FROM
    $EDS_ID 
WHERE
    eventname IN ('AssociateAddress', 'DisassociateAddress', 'CancelReservedInstancesListing', 'CancelSpotInstanceRequests', 'CreateNetworkAcl', 'DeleteNetworkAcl', 'CreateNetworkAclEntry', '''CreateVpc' , 'DeleteVpcPeeringConnection', 'RevokeSecurityGroupIngress' , 'RevokeSecurityGroupEgress', 'DetachInternetGateway', 'PurchaseReservedInstancesOffering', 'ModifyReservedInstances', 'AcceptVpcPeeringConnection', 'RejectVpcPeeringConnection' , 'CreateVpcPeeringConnection' 
    )