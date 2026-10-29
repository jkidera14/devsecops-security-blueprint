# Runbook: secret exposure

## First 15 minutes
1. Revoke or rotate the exposed credential. Treat deletion from Git as insufficient.
2. Identify the secret owner, privilege scope, systems and time window.
3. Preserve relevant audit logs without copying the secret into tickets or chat.
4. Restrict access if active misuse is suspected.

## Investigation
- Review cloud audit logs, identity events, API access, registry access and CI runs.
- Determine whether the secret was accessed or used.
- Search repository history and artifacts for other copies.
- Check whether a fork, cache, log, screenshot or build artifact contains it.

## Recovery
- Remove secret from source and move to a secret manager.
- Re-run full-history scans.
- Coordinate history rewriting if needed.
- Add prevention tests and document lessons learned.
- Notify affected parties according to applicable law and organizational policy.
