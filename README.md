# azure-log-analytics-workspace

This set of Bicep templates deploys a resource group containing an Azure Log Analytics workspace as well as the Logic
Apps Management solution and, optionally, the Microsoft Sentinel solution. Solutions for Microsoft Sentinel itself
cannot (at the time of writing) apparently be feasibly managed via infrastructure as code, so such solutions must for
the moment be deployed manually via the Microsoft Sentinel Content hub.

## Parameters

* `location` - the Azure region to deploy into
* `enableSentinel` (default: `true`) - whether to enable Microsoft Sentinel, which incurs additional costs
* `workloadName` - the workload label to be used in resource names
