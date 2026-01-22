```text
             ┌──────────────────────────┐
             │        Internet          │
             └───────────┬──────────────┘
                         │
                 (no direct inbound)
                         │
        ┌────────────────▼─────────────────┐
        │      sub-prod-workload           │
        │             VNet                 │
        │                                   │
        │  ┌──────────────┐   ┌──────────┐ │
        │  │ snet-workload │   │ snet-PE  │ │
        │  │ (VM/App)      │   │ (Private │ │
        │  │ NSG enforced  │   │ Endpoints│ │
        │  └──────┬───────┘   └─────┬────┘ │
        │         │                 │      │
        └─────────┼─────────────────┼──────┘
                  │                 │
                  │ logs/changes    │ runtime/PE traffic (later)
                  ▼                 ▼
        ┌─────────────────────────────────────┐
        │    sub-platform-security            │
        │  Log Analytics Workspace + Sentinel │
        └─────────────────────────────────────┘
