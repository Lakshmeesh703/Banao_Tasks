#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

python3 vireo_digest.py

if command -v google-chrome >/dev/null 2>&1; then
    google-chrome "${ROOT}/vireo_dashboard.html" >/dev/null 2>&1 &
elif command -v chromium >/dev/null 2>&1; then
    chromium "${ROOT}/vireo_dashboard.html" >/dev/null 2>&1 &
elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "${ROOT}/vireo_dashboard.html" >/dev/null 2>&1 &
else
    printf 'Dashboard generated at: %s\n' "${ROOT}/vireo_dashboard.html"
fi
