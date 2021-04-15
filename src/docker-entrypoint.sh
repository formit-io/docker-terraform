#!/bin/bash -e

echo "Terraform version $(terraform --version)"
echo "Terragrunt version $(terragrunt --version)"

exec "$@"