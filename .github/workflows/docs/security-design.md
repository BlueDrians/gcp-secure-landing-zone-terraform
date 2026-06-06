# Security Design

## Security Objectives

The security objective is to create a baseline that follows secure-by-design principles:

- Minimize unnecessary exposure
- Use identity separation
- Keep audit logs searchable
- Make administrative access intentional
- Prevent accidental open ingress

## Network Security

### Custom VPC

The project creates a custom VPC with `auto_create_subnetworks = false`. This avoids automatically created subnets in every region and gives the architect explicit control over IP ranges and segmentation

### Private Subnet

The subnet enables Private Google Access so workloads without public IP addresses can still reach supported Google APIs and services

### Cloud NAT

Cloud NAT is used for outbound internet access from private workloads. This supports a more secure pattern than assigning public IP addresses to every VM

### Firewall Baseline

The firewall rules include:

- Allow internal traffic within the landing zone subnet
- Allow SSH only from an approved admin CIDR
- Explicit deny-all ingress baseline with low priority

For production, the admin access rule should be replaced or restricted using:

- Identity-Aware Proxy TCP forwarding
- Corporate VPN range
- Bastion host pattern
- Just-in-time access process

## IAM Security

The IAM module creates a dedicated workload service account and grants only logging and metric writing roles. Admin group access is intentionally set to viewer-level observability roles in this starter baseline

For production, consider:

- Separate groups for platform admin, security admin, network admin, and billing viewer
- Avoid primitive roles like Owner, Editor, and Viewer where possible
- Use IAM Conditions for time-bound or resource-bound access
- Use Workload Identity Federation for CI/CD

## Logging and Audit

The logging module exports Cloud Audit Logs and error-level logs into BigQuery. This helps support:

- Audit investigation
- Incident review
- Operational troubleshooting
- Compliance evidence collection

## Monitoring

The monitoring module creates a high CPU alert policy for Compute Engine. This is a starter example and should be extended with workload-specific SLIs and SLOs

## Secret Management

No secrets should be committed to this repository. For real workloads, store sensitive values in Secret Manager and reference them from runtime services or CI/CD securely

## Production Hardening Backlog

- Add organization policies
- Add VPC Service Controls for sensitive projects
- Add Security Command Center findings export
- Add Cloud KMS baseline
- Add centralized organization-level logging
- Add automated IaC scanning using Checkov, tfsec, or OPA
