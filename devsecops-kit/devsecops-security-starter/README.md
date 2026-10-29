# DevSecOps Security Starter

A reusable, language-aware security baseline you can copy into application repositories and adapt. It is designed for learning and portfolio evidence, not as a claim of compliance or a drop-in production guarantee.

## What this starter covers

- Secure Git collaboration: branch protection guidance, CODEOWNERS, PR template, commit hygiene.
- Secret prevention: local pre-commit checks and Gitleaks CI/history scanning.
- Application security: CodeQL SAST, dependency auditing, Dependabot.
- Supply-chain security: container scanning, SBOM generation, image signing/provenance guidance.
- Infrastructure security: Terraform formatting/validation, Checkov, Trivy configuration scanning.
- Kubernetes security: schema validation, Pod Security Standards, baseline NetworkPolicy.
- Release controls: least-privilege workflow permissions, environment approval, artifact promotion principles.
- Incident response: secret exposure, vulnerable dependency, compromised release and rollback runbooks.

## Start here

1. Copy the relevant `.github/`, `.githooks/`, `scripts/`, `security/`, and `docs/` folders into your project.
2. Replace `REPLACE_ME` placeholders.
3. Choose your language/runtime and adapt the `ci-security.yml` test/build steps.
4. Install local tools with `scripts/install-dev-tools.sh` or install equivalents manually.
5. Enable GitHub branch protection/rulesets and make the named checks required.
6. Run local checks, open a test PR, and capture the results as portfolio evidence.
7. Add an owner and expiry date to every security exception.

## Repository map

```text
.
├── .github/
│   ├── CODEOWNERS
│   ├── dependabot.yml
│   ├── pull_request_template.md
│   └── workflows/
│       ├── ci-security.yml
│       ├── secret-history.yml
│       ├── terraform-security.yml
│       ├── container-release.yml
│       └── scheduled-security.yml
├── .githooks/pre-commit
├── .pre-commit-config.yaml
├── scripts/
│   ├── install-dev-tools.sh
│   ├── local-security-checks.sh
│   └── verify-release-inputs.sh
├── security/
│   ├── gitleaks.toml
│   ├── trivy.yaml
│   ├── checkov.yml
│   ├── semgrep.yml
│   ├── security-policy.yml
│   └── exception-register.example.yml
├── policies/
│   ├── kubernetes/
│   └── terraform/
├── examples/
│   ├── Dockerfile
│   ├── docker-compose.security.yml
│   └── k8s/
└── docs/
    ├── threat-model.md
    ├── security-gates.md
    ├── branch-protection.md
    ├── secrets-management.md
    ├── sbom-and-provenance.md
    ├── vulnerability-management.md
    ├── incident-response/
    └── evidence-checklist.md
```

## Quick start

```bash
# Linux/macOS/WSL
bash scripts/install-dev-tools.sh
bash scripts/local-security-checks.sh

# Enable the repository's local Git hooks
git config core.hooksPath .githooks
```

Local hooks improve feedback but are bypassable; CI checks and protected branches are the enforcement layer.

## GitHub setup checklist

- [ ] Protect `main` with a ruleset or branch protection rule.
- [ ] Require pull requests and at least one independent approval.
- [ ] Require CODEOWNERS review for `.github/`, `security/`, `policies/`, and infrastructure changes.
- [ ] Require status checks: `secret-scan`, `codeql`, `dependency-audit`, `repository-policy`, and relevant build/test jobs.
- [ ] Block force pushes and deletion of protected branches.
- [ ] Restrict who can bypass rules; ideally nobody for routine changes.
- [ ] Use GitHub Environments with required reviewers for production.
- [ ] Use OIDC federation for cloud access; do not store long-lived cloud keys in GitHub secrets.
- [ ] Pin third-party Actions to full commit SHAs in production. Version tags in this starter are readable examples, not a substitute for pinning.
- [ ] Enable Dependabot security updates and alerts where available.
- [ ] Keep repository visibility and secret scanning settings appropriate for the project.

## Important limitations

- The workflows are examples and may require adjustments for private registries, monorepos, package managers, runners, and organization policies.
- Some scanners require configuration, paid platform features, or authentication for complete results.
- A green scan does not prove an application is secure.
- Do not upload real secrets, customer data, production logs, private keys, or unredacted incident evidence into a public portfolio.
- Never use a sample workflow to apply infrastructure to production before reviewing IAM permissions, plan approval, state security, and recovery procedures.
