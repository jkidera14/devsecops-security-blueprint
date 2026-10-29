# Portfolio evidence checklist

Capture redacted screenshots or links for:
- [ ] GitHub ruleset and required checks
- [ ] A PR blocked by a deliberately introduced test secret (use a fake canary string only)
- [ ] A Gitleaks finding and its safe remediation
- [ ] CodeQL/Semgrep result and triage
- [ ] Dependabot update PR and successful test run
- [ ] Terraform Checkov finding, remediation and clean rerun
- [ ] Trivy container scan and SBOM artifact
- [ ] Image digest and signature/provenance verification
- [ ] Production environment approval gate (use a non-production simulation)
- [ ] Incident tabletop and recovery runbook exercise
- [ ] Threat model and risk register
- [ ] Before/after metrics: mean time to remediate, gate failure rate, scan duration

Never publish real secrets, access tokens, customer data, unredacted logs, or private cloud identifiers.
