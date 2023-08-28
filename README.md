[![Massdriver][logo]][website]

# azure-service-bus-topic

[![Release][release_shield]][release_url]
[![Contributors][contributors_shield]][contributors_url]
[![Forks][forks_shield]][forks_url]
[![Stargazers][stars_shield]][stars_url]
[![Issues][issues_shield]][issues_url]
[![MIT License][license_shield]][license_url]

Azure Service Bus is a fully managed enterprise message broker with message queues and publish-subscribe topics. Service Bus is used to decouple applications and services from each other, providing load-balancing work across competing works, safely routing and transferring data and control across service and application boundaries, and coordinating transactional work that requires a high-degree of reliability.

---

## Design

For detailed information, check out our [Operator Guide](operator.mdx) for this bundle.

## Usage

Our bundles aren't intended to be used locally, outside of testing. Instead, our bundles are designed to be configured, connected, deployed and monitored in the [Massdriver][website] platform.

### What are Bundles?

Bundles are the basic building blocks of infrastructure, applications, and architectures in [Massdriver][website]. Read more [here](https://docs.massdriver.cloud/concepts/bundles).

## Bundle

<!-- COMPLIANCE:START -->

Security and compliance scanning of our bundles is performed using [Bridgecrew](https://www.bridgecrew.cloud/). Massdriver also offers security and compliance scanning of operational infrastructure configured and deployed using the platform.

| Benchmark                                                                                                                                                                                                                                                       | Description                        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| [![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-service-bus-topic/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=&benchmark=INFRASTRUCTURE+SECURITY) | Infrastructure Security Compliance |

| [![PCI-DSS](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-service-bus-topic/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=&benchmark=PCI-DSS+V3.2) | Payment Card Industry Data Security Standards Compliance |
| [![NIST-800-53](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-service-bus-topic/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=&benchmark=NIST-800-53) | National Institute of Standards and Technology Compliance |
| [![ISO27001](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-service-bus-topic/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=&benchmark=ISO27001) | Information Security Management System, ISO/IEC 27001 Compliance |
| [![SOC2](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-service-bus-topic/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=&benchmark=SOC2)| Service Organization Control 2 Compliance |
| [![HIPAA](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-service-bus-topic/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=&benchmark=HIPAA) | Health Insurance Portability and Accountability Compliance |

<!-- COMPLIANCE:END -->

### Params

Form input parameters for configuring a bundle for deployment.

<details>
<summary>View</summary>

<!-- PARAMS:START -->
## Properties

- **`monitoring`** *(object)*
  - **`mode`** *(string)*: Enable and customize Function App metric alarms. Default: `AUTOMATED`.
    - **One of**
      - Automated
      - Custom
      - Disabled
- **`service`** *(object)*: Configure the Service Bus Namespace.
  - **`region`** *(string)*: Select the Azure region you'd like to provision your Azure Service Bus in. **Cannot be changed after the resource is created.**.
  - **`sku`** *(string)*: Select your desired SKU tier for the Service Bus Namespace. **Cannot be changed after the resource is created.**. Must be one of: `['Standard', 'Premium']`. Default: `Standard`.
- **`subscription`** *(object)*: Configure the Service Bus Subscription.
  - **`batched_operations`** *(boolean)*: Enable support for batched operations for the Service Bus Subscription. Default: `False`.
  - **`max_delivery_count`** *(integer)*: The number if maximum deliveries, ranging 1-2000. Minimum: `1`. Maximum: `2000`. Default: `10`.
  - **`session`** *(boolean)*: Service bus sessions allow ordered handling of unbounded sequences of related messages. **Cannot be changed after the resource is created.**. Default: `False`.
- **`topic`** *(object)*: Configure the Service Bus Topic.
  - **`batched_operations`** *(boolean)*: Enable server-side batched operations for the Service Bus Topic. Default: `True`.
  - **`duplicate_detection`** *(boolean)*: Enable duplicate detection for the Service Bus Topic. **Cannot be changed after the resource is created.**. Default: `False`.
  - **`express`** *(boolean)*: Enable express entities to hold messages in memory temporarily before writing them to persistent storage. Default: `False`.
  - **`support_ordering`** *(boolean)*: Enable ordering support for the Service Bus Topic. Default: `False`.
## Examples

  ```json
  {
      "__name": "Development",
      "service": {
          "sku": "Standard"
      }
  }
  ```

  ```json
  {
      "__name": "Production",
      "service": {
          "sku": "Premium"
      }
  }
  ```

<!-- PARAMS:END -->

</details>

### Connections

Connections from other bundles that this bundle depends on.

<details>
<summary>View</summary>

<!-- CONNECTIONS:START -->
## Properties

- **`azure_service_principal`** *(object)*: . Cannot contain additional properties.
  - **`data`** *(object)*
    - **`client_id`** *(string)*: A valid UUID field.

      Examples:
      ```json
      "123xyz99-ab34-56cd-e7f8-456abc1q2w3e"
      ```

    - **`client_secret`** *(string)*
    - **`subscription_id`** *(string)*: A valid UUID field.

      Examples:
      ```json
      "123xyz99-ab34-56cd-e7f8-456abc1q2w3e"
      ```

    - **`tenant_id`** *(string)*: A valid UUID field.

      Examples:
      ```json
      "123xyz99-ab34-56cd-e7f8-456abc1q2w3e"
      ```

  - **`specs`** *(object)*
<!-- CONNECTIONS:END -->

</details>

### Artifacts

Resources created by this bundle that can be connected to other bundles.

<details>
<summary>View</summary>

<!-- ARTIFACTS:START -->
## Properties

- **`azure_service_bus_topic`** *(object)*: . Cannot contain additional properties.
  - **`data`** *(object)*
    - **`infrastructure`** *(object)*
      - **`ari`** *(string)*: Azure Resource ID.

        Examples:
        ```json
        "/subscriptions/12345678-1234-1234-abcd-1234567890ab/resourceGroups/resource-group-name/providers/Microsoft.Network/virtualNetworks/network-name"
        ```

      - **`endpoint`** *(string)*: Azure Service Bus endpoint and port. Cannot contain additional properties.

        Examples:
        ```json
        "https://local-dev-queues-0001.servicebus.windows.net:443/"
        ```

        ```json
        "sb://local-dev-queues-0001.servicebus.windows.net"
        ```

    - **`security`** *(object)*: Azure Security Configuration. Cannot contain additional properties.
      - **`iam`** *(object)*: IAM Roles And Scopes. Cannot contain additional properties.
        - **`^[a-z]+[a-z_]*[a-z]$`** *(object)*
          - **`role`**: Azure Role.

            Examples:
            ```json
            "Storage Blob Data Reader"
            ```

          - **`scope`** *(string)*: Azure IAM Scope.
  - **`specs`** *(object)*
    - **`azure`** *(object)*: .
      - **`region`** *(string)*: Select the Azure region you'd like to provision your resources in.
<!-- ARTIFACTS:END -->

</details>

## Contributing

<!-- CONTRIBUTING:START -->

### Bug Reports & Feature Requests

Did we miss something? Please [submit an issue](https://github.com/massdriver-cloud/azure-service-bus-topic/issues) to report any bugs or request additional features.

### Developing

**Note**: Massdriver bundles are intended to be tightly use-case scoped, intention-based, reusable pieces of IaC for use in the [Massdriver][website] platform. For this reason, major feature additions that broaden the scope of an existing bundle are likely to be rejected by the community.

Still want to get involved? First check out our [contribution guidelines](https://docs.massdriver.cloud/bundles/contributing).

### Fix or Fork

If your use-case isn't covered by this bundle, you can still get involved! Massdriver is designed to be an extensible platform. Fork this bundle, or [create your own bundle from scratch](https://docs.massdriver.cloud/bundles/development)!

<!-- CONTRIBUTING:END -->

## Connect

<!-- CONNECT:START -->

Questions? Concerns? Adulations? We'd love to hear from you!

Please connect with us!

[![Email][email_shield]][email_url]
[![GitHub][github_shield]][github_url]
[![LinkedIn][linkedin_shield]][linkedin_url]
[![Twitter][twitter_shield]][twitter_url]
[![YouTube][youtube_shield]][youtube_url]
[![Reddit][reddit_shield]][reddit_url]


<!-- markdownlint-disable -->

[logo]: https://raw.githubusercontent.com/massdriver-cloud/docs/main/static/img/logo-with-logotype-horizontal-400x110.svg

[docs]: https://docs.massdriver.cloud?utm_source=azure-service-bus-topic&utm_medium=azure-service-bus-topic&utm_campaign=azure-service-bus-topic&utm_content=azure-service-bus-topic
[website]: https://www.massdriver.cloud?utm_source=azure-service-bus-topic&utm_medium=azure-service-bus-topic&utm_campaign=azure-service-bus-topic&utm_content=azure-service-bus-topic
[github]: https://github.com/massdriver-cloud
[linkedin]: https://www.linkedin.com/company/massdriver/

[contributors_shield]: https://img.shields.io/github/contributors/massdriver-cloud/azure-service-bus-topic.svg?style=for-the-badge
[contributors_url]: https://github.com/massdriver-cloud/azure-service-bus-topic/graphs/contributors
[forks_shield]: https://img.shields.io/github/forks/massdriver-cloud/azure-service-bus-topic.svg?style=for-the-badge
[forks_url]: https://github.com/massdriver-cloud/azure-service-bus-topic/network/members
[stars_shield]: https://img.shields.io/github/stars/massdriver-cloud/azure-service-bus-topic.svg?style=for-the-badge
[stars_url]: https://github.com/massdriver-cloud/azure-service-bus-topic/stargazers
[issues_shield]: https://img.shields.io/github/issues/massdriver-cloud/azure-service-bus-topic.svg?style=for-the-badge
[issues_url]: https://github.com/massdriver-cloud/azure-service-bus-topic/issues
[release_url]: https://github.com/massdriver-cloud/azure-service-bus-topic/releases/latest
[release_shield]: https://img.shields.io/github/release/massdriver-cloud/azure-service-bus-topic.svg?style=for-the-badge
[license_shield]: https://img.shields.io/github/license/massdriver-cloud/azure-service-bus-topic.svg?style=for-the-badge
[license_url]: https://github.com/massdriver-cloud/azure-service-bus-topic/blob/main/LICENSE

[email_url]: mailto:support@massdriver.cloud
[email_shield]: https://img.shields.io/badge/email-Massdriver-black.svg?style=for-the-badge&logo=mail.ru&color=000000
[github_url]: mailto:support@massdriver.cloud
[github_shield]: https://img.shields.io/badge/follow-Github-black.svg?style=for-the-badge&logo=github&color=181717
[linkedin_url]: https://linkedin.com/in/massdriver-cloud
[linkedin_shield]: https://img.shields.io/badge/follow-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&color=0A66C2
[twitter_url]: https://twitter.com/massdriver
[twitter_shield]: https://img.shields.io/badge/follow-Twitter-black.svg?style=for-the-badge&logo=twitter&color=1DA1F2
[youtube_url]: https://www.youtube.com/channel/UCfj8P7MJcdlem2DJpvymtaQ
[youtube_shield]: https://img.shields.io/badge/subscribe-Youtube-black.svg?style=for-the-badge&logo=youtube&color=FF0000
[reddit_url]: https://www.reddit.com/r/massdriver
[reddit_shield]: https://img.shields.io/badge/subscribe-Reddit-black.svg?style=for-the-badge&logo=reddit&color=FF4500

<!-- markdownlint-restore -->

<!-- CONNECT:END -->
