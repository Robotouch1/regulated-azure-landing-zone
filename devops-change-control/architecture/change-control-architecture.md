## Azure DevOps Deployment Identity

Azure DevOps pipelines authenticate to Azure using a dedicated Entra ID application (service principal).

RBAC design:
- The pipeline identity has **Contributor** access scoped only to:
  - rg-prod-test
- The identity has **no subscription-level roles**

This ensures:
- least privilege for automated changes
- limited blast radius if the pipeline identity is compromised
- clear attribution of infrastructure changes

