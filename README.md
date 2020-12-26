# azmonitoring

Two Azure resources groups. One for analytical resources and one for monitoring.

## Infra Directory

Stores infra as code for two resource groups: 
1. rg-ana
    - Used for analytical resources
    - Deploys diagnostic settings as child resource of each analytics resource
1. rg-mon
    - Used for monitoring resources
    - Monitoring resources include alerts, action groups and a workspace
    - The list of monitoring resources can be expanded with dashboards, workbooks and other centralized resources

>**Important**: resources that enable monitoring like diagnostic settings or monitoring solutions should be deployed with the solution, and not with the monitoring resource group.