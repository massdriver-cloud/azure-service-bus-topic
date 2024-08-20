## Azure Service Bus Topic

Azure Service Bus Topics provide a high-performance, reliable, and secure messaging platform for applications. Topics enable scalable and decoupled publish/subscribe communication, allowing multiple subscribers to receive asynchronous messages from a single publisher.

### Design Decisions

1. **Namespace Creation**: The module creates an Azure Service Bus Namespace that isolates the messaging environment.
2. **Resource Configuration**:
   - **Service Bus Topic**: Configured to enable batched operations, express messaging, partitioning, duplicate detection, and message ordering based on user input.
   - **Service Bus Subscription**: Configured with maximum delivery count, batched operations, and session-based messaging.
3. **Security**:
   - Roles are assigned to manage publishing and subscribing privileges.
   - Enforced TLS 1.2 as the minimum version for secure communication.
4. **Monitoring and Alerts**:
   - Automated setup for server error and latency metric alerts.
   - Integration with an alarm channel for actionable notifications.

### Runbook

#### Unable to Connect to Azure Service Bus Namespace

To troubleshoot connectivity issues to the Azure Service Bus Namespace, use the Azure CLI:

```sh
# Verify the existence of the Service Bus Namespace
az servicebus namespace show --name <NAMESPACE-NAME> --resource-group <RESOURCE-GROUP-NAME>
```

You should expect to see details of the namespace if it exists. If not, it might be a configuration or provisioning issue.

#### Messages are Not Being Received by Subscribers

To troubleshoot subscription issues, check the subscription's status and message count:

```sh
# Check the subscription status and message count
az servicebus topic subscription show --resource-group <RESOURCE-GROUP-NAME> --namespace-name <NAMESPACE-NAME> --topic-name <TOPIC-NAME> --name <SUBSCRIPTION-NAME>
```

#### High Server Latency Observed

If you observe high server latency, you can verify the metric by checking the configured alert:

```sh
# Check metric alerts
az monitor metrics list --resource <SERVICE-BUS-NAMESPACE-ID> --metric ServerSendLatency --interval PT1M --aggregation Average
```

You should expect the latency statistics that can pinpoint the cause of high server latency.

#### Subscription Messages are Getting Dead-Lettered

To identify issues where messages are being dead-lettered, inspect the dead-letter sub-queue:

```sh
# Peek dead-letter messages
az servicebus topic subscription deadletter message peek --resource-group <RESOURCE-GROUP-NAME> --namespace-name <NAMESPACE-NAME> --topic-name <TOPIC-NAME> --subscription-name <SUBSCRIPTION-NAME>
```

You should see the messages that have been dead-lettered, which can provide insights into why they were not processed successfully.

