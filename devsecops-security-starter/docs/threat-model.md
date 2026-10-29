# Threat model starter

## Scope
Adapt this document to the actual application, data classification, deployment model, and trust boundaries.

## Assets
- User credentials, access tokens, sessions and password reset flows
- Customer data and uploaded files
- Database records and backups
- Cloud IAM roles, CI tokens, signing identities and deployment credentials
- Build artifacts, container images, IaC state and logs
- Availability, integrity and reputation of the service

## Trust boundaries
- Browser ↔ public edge / web application
- Web application ↔ API
- API ↔ database, object storage and identity provider
- Developer workstation ↔ Git repository
- GitHub Actions runner ↔ cloud account / registry
- GitOps repository ↔ Argo CD ↔ Kubernetes API
- Application workload ↔ observability platform

## Threats to evaluate
| Threat | Example abuse | Primary controls | Validation evidence |
|---|---|---|---|
| Credential leakage | Secret committed or logged | Gitleaks, secret manager, rotation process | Secret scan and tabletop |
| Broken object authorization | User reads another user's record | Server-side ownership checks, deny-by-default | Negative authorization tests |
| Dependency compromise | Malicious or vulnerable package | Lockfiles, Dependabot, audit, SBOM | CI scan and update PR |
| CI compromise | Untrusted PR obtains cloud credentials | Minimal permissions, OIDC conditions, no secrets for fork PRs | Workflow permission review |
| Artifact tampering | Mutable tag replaced after scan | Digest pinning, signatures, provenance verification | Release attestation checks |
| Cloud privilege escalation | CI role can administer account | Narrow IAM, separate plan/apply roles | IAM policy review |
| Kubernetes escape/misuse | Privileged container or token abuse | Restricted Pod Security, non-root, no privilege escalation | Manifest policy scan |
| Data exfiltration | Public bucket or excessive egress | Private storage, scoped IAM, network controls | Cloud config scan |
| Availability attack | Request flood or exhausted pool | Rate limits, quotas, autoscaling, alarms | Load and resilience tests |
| Logging leakage | Tokens or PII in logs | Structured redacted logging and review | Log test / sample review |

## Risk rating
Use likelihood × impact (1–5 each) and document residual risk. Avoid claiming a threat is eliminated; describe the control and its limitations.

## Review cadence
Review on major architecture changes, new data types, new external integrations, incidents, and at least quarterly for active services.
