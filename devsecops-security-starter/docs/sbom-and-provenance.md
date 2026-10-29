# SBOM, provenance and artifact integrity

## SBOM
Generate a CycloneDX or SPDX SBOM for each release artifact. Store it with the release and associate it with the exact image digest. An SBOM is an inventory, not a guarantee that the artifact is safe.

## Immutable artifact flow
1. Build from a reviewed commit.
2. Run tests and source/dependency/IaC/container checks.
3. Generate an SBOM.
4. Publish using an immutable tag and record the digest.
5. Sign the artifact and create provenance/attestation.
6. Verify signature, issuer, repository, workflow identity, source revision and policy before deployment.
7. Promote the same digest between environments; do not rebuild separately for production.

## Cosign learning commands
These are examples; configure OIDC and your registry first.

```bash
cosign sign --yes "$IMAGE_REF"
cosign verify "$IMAGE_REF" \
  --certificate-identity-regexp='^https://github.com/ORG/REPO/.github/workflows/.*' \
  --certificate-oidc-issuer='https://token.actions.githubusercontent.com'
```

Do not copy these identity patterns without adapting them to your exact repository and workflow. Verify the attestation format and issuer supported by your selected build tooling.
