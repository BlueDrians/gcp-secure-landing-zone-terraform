#!/usr/bin/env bash
set -euo pipefail

if ! command -v terraform >/dev/null 2>&1; then
  echo "Terraform is not installed. Please install Terraform first."
  exit 1
fi

terraform fmt -recursive -check

pushd environments/dev >/dev/null
terraform init -backend=false
terraform validate
popd >/dev/null

echo "Terraform format and validation completed successfully."
