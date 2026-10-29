# 30-day DevSecOps practice plan

## Week 1 — Git and secrets
- Configure branch protection, CODEOWNERS and PR templates.
- Install Gitleaks and pre-commit.
- Create a fake canary secret in a throwaway branch, prove the hook/CI catches it, then remove it.
- Learn rotation and incident response; never use a real credential for the exercise.

## Week 2 — SAST and dependencies
- Add tests and CodeQL/Semgrep.
- Introduce a known-vulnerable package only in an isolated throwaway branch or lab.
- Observe the gate, upgrade to a fixed version, and document the result.
- Practice reviewing Dependabot PRs.

## Week 3 — Containers and IaC
- Build a non-root, minimal container.
- Scan it with Trivy and generate an SBOM.
- Run Checkov against Terraform examples; remediate a public bucket or missing encryption finding.
- Store no credentials in Terraform state outputs or CI logs.

## Week 4 — Release governance and evidence
- Define security gates and exception expiry.
- Add immutable artifact promotion and learn signing/provenance.
- Simulate a failed release and execute the rollback runbook.
- Publish a concise engineering report: threat model, decisions, findings, fixes, limitations and metrics.
