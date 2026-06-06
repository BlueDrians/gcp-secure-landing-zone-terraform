# Presales One-Pager: GCP Secure Landing Zone

## Customer Challenge

The customer wants to adopt Google Cloud but needs a secure, repeatable, and governed foundation before deploying production workloads

## Proposed Solution

Implement a Google Cloud landing zone baseline using Terraform. The solution includes secure networking, access control, centralized logging, monitoring alerts, and budget guardrails

## Business Value

- Faster cloud adoption through reusable baseline automation
- Reduced misconfiguration risk through standardized network and IAM patterns
- Better audit readiness through centralized logging
- Improved operational visibility with monitoring alerts
- Better cost control through monthly budget thresholds

## Technical Scope

| Scope Area | Included |
|---|---|
| Infrastructure as Code | Terraform modules and environment configuration |
| Network | Custom VPC, subnet, firewall, Cloud NAT |
| IAM | Admin group bindings and workload service account |
| Logging | Project log sink to BigQuery |
| Monitoring | High CPU alert policy and email notification channel |
| Cost Governance | Billing budget threshold rules |

## Assumptions

- Customer already has Google Cloud organization and billing account
- Initial implementation targets one project and one environment
- Customer provides admin group email and approved admin CIDR
- Production hardening can be added in later phases

## Suggested Implementation Timeline

| Phase | Activity | Duration |
|---|---|---|
| Phase 1 | Requirement confirmation and access preparation | 1-2 days |
| Phase 2 | Terraform deployment and validation | 2-3 days |
| Phase 3 | Security and operations review | 1-2 days |
| Phase 4 | Handover documentation and knowledge transfer | 1 day |

## Future Enhancement

- Organization policy baseline
- Shared VPC
- Centralized organization logging
- Security Command Center integration
- CI/CD deployment with Workload Identity Federation
- Policy-as-code guardrails
