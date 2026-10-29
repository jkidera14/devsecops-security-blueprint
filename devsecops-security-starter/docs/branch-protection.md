# Branch protection / ruleset baseline

Configure in GitHub repository settings (UI names may change):

- Protect `main`; require pull requests before merging.
- Require at least one approval (two for sensitive/production changes where practical).
- Dismiss stale approvals after new commits and require CODEOWNERS review.
- Require status checks: `secret-scan`, `repository-policy`, `codeql`, `dependency-audit-node` or Python equivalent, `semgrep`, and relevant IaC/container checks.
- Require branches to be up to date where appropriate.
- Block force pushes and deletion.
- Restrict bypass permissions and audit any emergency bypass.
- Require signed commits only if your team can consistently manage signing.
- Protect `.github/workflows/`, deployment manifests, policy files and Terraform with CODEOWNERS.
- Use GitHub Environments for production approvals and restrict deployment branches.
- Keep workflow token permissions read-only by default; elevate only per job.
- Review third-party Actions and pin them to full commit SHAs for production.
