resource "massdriver_artifact" "azure_service_bus_topic" {
  field    = "azure_service_bus_topic"
  name     = "Azure Service Bus endpoint"
  artifact = jsonencode(
    {
      data = {
        infrastructure = {
          ari      = azurerm_servicebus_namespace.main.id
          endpoint = azurerm_servicebus_namespace.main.endpoint
        }
        security = {
          iam = {
            "publish" = {
              scope = azurerm_servicebus_namespace.main.id
              role  = "Azure Service Bus Data Sender"
            }
            "subscribe" = {
              scope = azurerm_servicebus_namespace.main.id
              role  = "Azure Service Bus Data Receiver"
            }
          }
        }
      }
      specs = {
        azure = {
          region = azurerm_servicebus_namespace.main.location
        }
      }
    }
  )
}
