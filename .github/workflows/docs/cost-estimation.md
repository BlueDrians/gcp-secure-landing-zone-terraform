# Cost Estimation

## Cost Drivers

This landing zone is minimal, but the following services can generate cost:

| Service | Cost Driver | Notes |
|---|---|---|
| Cloud NAT | NAT gateway usage and processed data | Can generate cost even for lab environments |
| BigQuery | Log storage and query processing | Cost depends on log volume and query usage |
| Cloud Logging | Log ingestion and retention | Depends on enabled logs and workload volume |
| Cloud Monitoring | Metrics and notification usage | Basic metrics are usually small, but custom metrics can add cost |
| Compute Engine | Not provisioned by default | Alert policy is created, but no VM is deployed in this baseline |

## Lab Cost-Control Tips

- Use low budget amount such as USD 10-50 for demo
- Keep log retention short, for example 30 days
- Destroy the environment after testing
- Avoid deploying workloads with public IPs or large egress
- Query BigQuery logs only when needed

## Example Budget Assumption

| Item | Value |
|---|---|
| Environment | Dev / Lab |
| Monthly Budget | USD 50 |
| Budget Thresholds | 50%, 80%, 100% |
| Retention | 30 days |
| Region | asia-southeast2 |

## Presales Cost Conversation

When discussing this solution with a customer, clarify:

1. Number of environments: dev, staging, production
2. Expected workload egress through Cloud NAT
3. Log volume and retention requirements
4. Whether audit logs must be centralized at project, folder, or organization level
5. Required compliance retention period
6. Whether additional security services are required
