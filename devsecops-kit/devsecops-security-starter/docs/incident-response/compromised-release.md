# Runbook: suspected compromised release

1. Halt further promotions and revoke compromised CI credentials or tokens.
2. Identify exact deployed image digests and affected environments.
3. Roll back to a known-good verified digest if rollback is safe; account for database schema compatibility.
4. Preserve CI logs, provenance, signatures, registry audit logs and deployment events.
5. Check whether the attacker changed workflows, dependencies, artifacts, secrets or cloud resources.
6. Rotate credentials and rebuild from a known-good commit in a clean runner.
7. Verify signatures/provenance and deploy through protected approvals.
8. Document impact, timeline, root cause, corrective actions and recovery verification.
