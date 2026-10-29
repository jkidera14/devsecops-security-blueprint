#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
fail=0
run_check() {
  echo
  echo "==> $*"
  if "$@"; then echo "PASS: $*"; else echo "FAIL: $*"; fail=1; fi
}
if command -v gitleaks >/dev/null 2>&1; then
  run_check gitleaks dir --config security/gitleaks.toml .
else
  echo "SKIP: gitleaks not installed"
fi
if command -v pre-commit >/dev/null 2>&1; then
  run_check pre-commit run --all-files
else
  echo "SKIP: pre-commit not installed"
fi
if command -v trivy >/dev/null 2>&1; then
  run_check trivy config --config security/trivy.yaml --severity HIGH,CRITICAL .
else
  echo "SKIP: trivy not installed"
fi
if command -v terraform >/dev/null 2>&1; then
  run_check terraform fmt -check -recursive
else
  echo "SKIP: terraform not installed"
fi
exit "$fail"
