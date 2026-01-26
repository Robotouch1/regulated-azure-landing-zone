# Investigation Guide — NSG Internet Exposure (v2)

## What this alert means
A change was made to an NSG security rule that appears to allow inbound traffic from the internet
to a sensitive destination port. This can indicate accidental exposure or unauthorized change.

## Immediate triage
1. Confirm the NSG and rule in the `entity` / `ResourceId` field.
2. Review the change actor:
   - `Caller` (who made the change)
   - Time of change (`TimeGenerated`)
3. Validate exposure:
   - Source is `*`, `0.0.0.0/0`, or `Internet`
   - Direction is `Inbound`
   - Access is `Allow`
   - Destination port includes `22`, `3389`, `80`, `443`, or `*`

## Containment actions (if unauthorized)
- Remove or disable the risky NSG rule immediately.
- If the change is ongoing, consider restricting permissions (RBAC/PIM) for NSG modification.
- If applicable, block via Azure Policy and require an exemption workflow.

## Validation questions
- Was this change part of an approved change request?
- Is there a front-door component (WAF/App Gateway/Front Door) that should be the only public entry?
- Does this NSG apply to a subnet/NIC containing sensitive resources (private endpoints, management subnets)?

## Evidence to capture
- Sentinel incident summary + events
- KQL results showing the NSG rule write event
- NSG inbound rules screenshot (before + after remediation)
- Activity log entry for security rule write/delete
