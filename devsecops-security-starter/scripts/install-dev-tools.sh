#!/usr/bin/env bash
set -euo pipefail
echo "This helper assumes Ubuntu/Debian or WSL. Review commands before running."
sudo apt-get update
sudo apt-get install -y git curl unzip python3-pip
python3 -m pip install --user pre-commit detect-secrets
echo "Install Terraform, Gitleaks, Trivy, Checkov, Semgrep, and kubeconform using their official installation instructions."
echo "Then run: git config core.hooksPath .githooks"
