/* 

This query displays the CloudTrail Lake logs in a flatten table format. This query expands the following objecs: 
userIdentity, userIdentity.sessionContext, userIdentity.sessionContext.attributes, userIdentity.sessionContext.sessionIssuer, 
userIdentity.sessionContext.webidfederationData, and tlsDetails. This query is useful when you are trying to display all 
attributes in an object.

Limitation: This query does not expand Array object.

Note: Add filter Criteria in the where clause to filter the result set. Without a filter criteria, this query will scann all 
the data and will result to very slow query.

*/

SELECT
    eventVersion,
    userIdentity.principalID,
    userIdentity.arn,
    userIdentity.accountID,
    userIdentity.accessKeyID,
    userIdentity.username,
    userIdentity.sessionContext.attributes.creationDate,
    userIdentity.sessionContext.attributes.mfaAuthenticated,
    userIdentity.sessionContext.sessionIssuer.type,
    userIdentity.sessionContext.sessionIssuer.principalID,
    userIdentity.sessionContext.sessionIssuer.arn,
    userIdentity.sessionContext.sessionIssuer.accountID,
    userIdentity.sessionContext.sessionIssuer.username,
    userIdentity.sessionContext.webidfederationData.federatedProvider,
    userIdentity.sessionContext.webidfederationData.attributes,
    userIdentity.sessionContext.sourceIdentity,
    userIdentity.sessionContext.ec2RoleDelivery,
    userIdentity.sessionContext.ec2IssuedInVPC,
    userIdentity.invokedBy,
    userIdentity.identityProvider,
    eventTime,
    eventSource,
    eventName,
    awsRegion,
    sourceIpAddress,
    userAgent,
    errorCode,
    errorMessage,
    requestParameters,
    responseElements,
    additionalEventData,
    requestID,
    eventID,
    readOnly,
    resources,
    eventType,
    apiVersion,
    managementEvent,
    recipientAccountID,
    sharedEventID,
    annotation,
    vpcEndPointID,
    serviceEventDetails,
    addendum,
    edgeDeviceDetails,
    insightDetails,
    eventCategory,
    tlsDetails.tlsVersion,
    tlsDetails.cipherSuite,
    tlsDetails.clientProvidedHostHeader,
    sessionCredentialFromConsole,
    eventJson,
    eventJsonChecksum
FROM
    <event_data_store_id>
WHERE eventTime >= '${date_filter}'
    AND eventTime <= '${date_filter}'
    -- Add filter Criteria in the where clause to filter the result set.
    -- Without a filter criteria, this query will scann all the data and will result to very slow query.