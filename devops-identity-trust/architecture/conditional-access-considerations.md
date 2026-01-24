# Conditional Access Considerations for Workload Identities

## Intended Control
In a production enterprise tenant, Conditional Access for workload identities would be used to restrict the Azure DevOps pipeline identity to:
- Non-interactive authentication only
- Token issuance only from Azure DevOps
- Azure Resource Manager access only

## Current Limitation
This lab environment uses a personal Microsoft tenant, which does not support Conditional Access policies for workload identities.

## Compensating Controls Implemented
- Workload identity federation (OIDC) with no secrets or certificates
- Azure DevOps–scoped service connection
- No interactive sign-in capability
- Permissions constrained at subscription/resource group scope

## Future Enforcement
In a production tenant, this design would be enforced using Conditional Access policies targeting the workload identity.
