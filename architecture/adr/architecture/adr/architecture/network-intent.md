# Network Intent and Trust Boundaries

## Overview
This document defines intended network communication patterns for the regulated Azure environment.

The intent is used as a baseline for runtime traffic detection and anomaly identification.

## Subscriptions
- Platform Security Subscription
  - Central Log Analytics Workspace
  - Sentinel
- Production Workload Subscription
  - VNets
  - Private Endpoints
  - NSGs

## Trust Zones

### Internet
- Untrusted
- No direct access to private workloads

### Production VNet
- Trusted internal boundary
- Only explicit inbound paths allowed
- East–west traffic controlled by NSGs

### Private Endpoints
- Storage accounts accessed only via private IPs
- No public network access expected

## Expected Traffic Patterns

| Source | Destination | Ports | Notes |
|------|------------|------|------|
| Prod subnet | Storage private endpoint | 443 | Expected |
| Prod subnet | Internet | 443 | Outbound only |
| Internet | Prod subnet | None | Not expected |

## Detection Philosophy
Any traffic observed outside of this intent represents potential misconfiguration, drift, or malicious activity and should be investigated.
