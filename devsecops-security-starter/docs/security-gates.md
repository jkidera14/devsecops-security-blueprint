# Security gates and release policy

| Control | Initial blocking policy | Owner | Evidence |
|---|---|---|---|
| Secret scan | Confirmed secret blocks merge; rotate/revoke if exposed | Repository owner | Gitleaks output and incident ticket |
| SAST | High/critical actionable findings block release | AppSec / code owner | CodeQL or Semgrep report |
| Dependencies | High/critical known vulnerabilities block by policy | App owner | Audit report, lockfile, remediation PR |
| Container | High/critical findings block unless an approved exception applies | Platform owner | Trivy report and image digest |
| IaC | High/critical misconfiguration blocks | Cloud owner | Checkov/Trivy report |
| Kubernetes | Privileged or unsafe workload configuration blocks | Platform owner | Schema and policy scan |
| Tests | Required tests pass | Engineering | CI job reports |
| Production | Protected branch, approved environment, immutable artifact, rollback plan | Release owner | Deployment record |

## Exception policy
Every exception needs a unique ID, finding, risk rationale, compensating control, owner, creation date, expiry date, and remediation issue. Expired exceptions fail release. Exceptions should be narrow and must not disable a scanner globally.

## False positives
Reproduce the finding, determine reachability and context, document why it is not exploitable, get owner approval, and use the smallest supported suppression. Reassess when code or dependencies change.
