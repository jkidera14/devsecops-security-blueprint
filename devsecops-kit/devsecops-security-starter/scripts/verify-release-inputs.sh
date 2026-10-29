#!/usr/bin/env bash
set -euo pipefail
: "${IMAGE_REF:?Set IMAGE_REF to an immutable image reference}"
if [[ "$IMAGE_REF" != *@sha256:* && ! "$IMAGE_REF" =~ :[0-9a-f]{40,64}$ ]]; then
  echo "Release requires an image digest or commit-SHA tag." >&2
  exit 1
fi
echo "Release input syntax accepted: $IMAGE_REF"
echo "Note: syntax alone does not verify image signature, provenance, or scan results."
