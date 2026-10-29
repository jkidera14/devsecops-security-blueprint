# Runbook: vulnerable dependency

1. Confirm package name, installed version, advisory, fixed version, and whether the vulnerable code path is used.
2. Check exploitation status, reachability, exposure and available mitigations.
3. Create an owned remediation issue with a due date.
4. Upgrade to a fixed compatible version; update and review the lockfile.
5. Run unit, integration, security and compatibility tests.
6. Rebuild and rescan the artifact; record the new digest.
7. Deploy through normal approvals and verify the running version.
8. If exploitation is suspected, activate incident response rather than treating it as routine patching.
