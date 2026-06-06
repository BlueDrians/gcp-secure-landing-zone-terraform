# Deployment Guide

## Step 1: Prepare Google Cloud Project

Make sure you have:

- Existing Google Cloud project ID
- Billing account ID
- Permission to enable APIs
- Permission to create networking, IAM, logging, monitoring, and budget resources

## Step 2: Authenticate

```bash
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
```

## Step 3: Configure Variables

```bash
cd environments/dev
cp terraform.tfvars.example terraform.tfvars
```

Update the required values:

```hcl
project_id                 = "your-gcp-project-id"
billing_account_id         = "000000-000000-000000"
admin_group_email          = "gcp-admins@example.com"
notification_email_address = "your-email@example.com"
allowed_admin_cidr         = "YOUR_PUBLIC_OR_VPN_CIDR/32"
```

## Step 4: Initialize Terraform

```bash
terraform init
```

## Step 5: Format and Validate

```bash
terraform fmt -recursive
terraform validate
```

## Step 6: Review Plan

```bash
terraform plan
```

Check that the plan only creates expected resources.

## Step 7: Apply

```bash
terraform apply
```

## Step 8: Destroy Lab Resources

For lab usage, destroy resources when finished:

```bash
terraform destroy
```

## Common Issues

| Issue | Possible Cause | Fix |
|---|---|---|
| API enablement fails | Missing permission | Ask for Service Usage Admin or enable APIs manually. |
| Budget creation fails | Missing billing permission | Ask billing admin to grant required access. |
| IAM binding fails | Group email not valid | Use an existing Google Group. |
| Monitoring channel pending | Email verification needed | Verify the notification email. |
