# Regulated Azure Landing Zone  
**Security Architecture Portfolio (NDA-Safe)**

This repository is a portfolio-grade, NDA-safe Azure security architecture project that reflects the type of work performed by a **Senior Security Engineer / Security Architect** in a regulated enterprise (e.g., aerospace, industrial, or critical infrastructure).

The focus is **architecture-first security**, not tool demos:
- guardrails before alerts  
- intent before automation  
- evidence before claims  

No real employer systems, identifiers, or production configurations are used.

---

## How to read this repository

This repository is organized around **security control objectives**, not timelines or individual Azure services.

Each top-level folder represents a **complete security story**:
- what problem is being solved  
- how the control is designed  
- how it is validated  
- what evidence exists  

Each folder can be reviewed independently.

---

## Security pillars demonstrated in this repository

### 1️⃣ `sentinel-alert/`  
**Security monitoring & detection architecture**

This folder demonstrates how centralized logging and Microsoft Sentinel are used to detect **high-risk control-plane and network events**, with an emphasis on:

- AzureActivity as a foundational signal
- High-signal, intent-aware analytics rules
- Zone-based detection logic (protected workloads vs permitted exposure)
- Detection of security-relevant drift (RBAC changes, NSG exposure, diagnostic settings tampering)

**What this shows:**  
Detection engineering grounded in architectural intent, not alert volume.

---

### 2️⃣ `devops-change-control/`  
**DevSecOps guardrails & production change governance**

This folder demonstrates how **production infrastructure changes** are governed in a regulated Azure environment.

It includes:
- Infrastructure-as-code deployments via Azure DevOps
- Manual approval gates for production changes
- Azure Policy deny controls enforcing platform standards
- Evidence captured from pipeline runs and policy enforcement

It also contains **architectural investigation material** related to correlating Azure DevOps approvals into SIEM.  
This material is intentionally documented as **design/attempt**, not a completed control, to transparently capture platform constraints and enterprise-grade next steps.

**What this shows:**  
Strong understanding of **preventive controls**, change governance, and evidence-driven validation.

---

### 3️⃣ `devops-identity-trust/`  
**Pipeline identity & trust boundary design**

This folder focuses on the **identity and trust model for CI/CD pipelines**, including:

- How pipelines authenticate to Azure
- How least-privilege access is enforced
- How trust boundaries are created between approved and unapproved identities

Where tenant limitations exist (e.g., Conditional Access unavailable in a personal tenant), those constraints are **explicitly documented**, along with the enterprise patterns that would be used in production (Conditional Access, PIM, workload identity federation).

**What this shows:**  
Pipeline identities are treated as **first-class security principals**, not just deployment plumbing.

---

## What this repository intentionally avoids

- Real employer names, tenants, or subscriptions  
- Customer data or sensitive telemetry  
- “Toy” labs without architectural context  
- Alert spam without a clear control objective  

Everything here is designed to be **reviewable, explainable, and auditable**.

---

## Intended audience

This repository is designed for:
- Senior cloud security and security architecture interviews
- Hiring managers evaluating design judgment
- Architects reviewing preventive controls, detection strategy, and evidence quality

---

## Disclaimer

This repository is for demonstration purposes only.  
It is not affiliated with Eaton or any other employer and contains no proprietary or confidential information.
