# Protected Workload Zone (PWZ) — Definition

## Purpose
The PWZ is a protected subnet intended to host regulated workloads that must not be directly reachable from the public Internet.

## Components (current)
- Subnet: snet-pwz-workload
- NSG: nsg-pwz-workload
- VM: pwz-vm1
- Enforcement point: Subnet-level NSG only (no NIC-level NSG)

## Security Contract (Intent)
The following are forbidden in PWZ:
- Any inbound NSG rule that allows traffic from Internet (0.0.0.0/0, *, Internet)
- Any public IP association to workloads in PWZ
- Any direct administrative inbound access from Internet (e.g., 22/3389)

The following are allowed:
- Internal / private connectivity patterns
- Private admin access paths (to be designed)
- Outbound connectivity per workload needs

## Why subnet-level enforcement
Subnet-level enforcement provides consistent zone policy and avoids drift created by per-NIC rule exceptions.
