# Secrets management

## Rules
- Never commit `.env`, credentials, private keys, tokens, cloud access keys, database passwords, or production data.
- Use a secret manager (e.g. AWS Secrets Manager, Azure Key Vault, Google Secret Manager, or a platform-native equivalent) at runtime.
- Prefer short-lived identity federation (OIDC) for CI-to-cloud access.
- Scope secret access to one environment and one workload where possible.
- Do not echo secrets, pass them as command-line arguments if avoidable, or include them in crash reports.
- Redact authorization headers, cookies, tokens, passwords, and sensitive personal data from logs.
- Rotate credentials after exposure; deleting a file or rewriting Git history does not invalidate a leaked credential.

## If a secret is committed
1. Revoke/rotate it immediately.
2. Identify affected systems, permissions and access window.
3. Check cloud audit logs and service logs for misuse.
4. Remove it from current code and prevent recurrence.
5. Scan all Git history and forks/caches as appropriate.
6. Notify the security owner and document impact.
7. Rewrite history only when appropriate and coordinate because clones may retain the secret.
