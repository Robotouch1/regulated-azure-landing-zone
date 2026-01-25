## Enterprise Implementation Note
Azure DevOps Environments with Approvals & Checks were the preferred enforcement point.
In this lab tenant, Environments approvals were not available due to plan/entitlement limitations.
A ManualValidation approval gate was implemented in YAML to demonstrate the same change-control intent.
## Separation of duties (enterprise model)
In an enterprise, the pipeline triggerer and approver are different roles (e.g., developer triggers; platform/security approves).
This lab uses a single-user DevOps org, so the approval step demonstrates the mechanism rather than organizational separation.
