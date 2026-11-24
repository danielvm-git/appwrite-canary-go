#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
grep -qxF v2.0.0 public/shell/SHELL_PIN
bash "$ROOT/scripts/preflight.sh"
export VITE_APPWRITE_ENDPOINT="${VITE_APPWRITE_ENDPOINT:-https://appwrite.danielvm.net/v1}"
export VITE_APPWRITE_PROJECT_ID="${VITE_APPWRITE_PROJECT_ID:-local}"
export VITE_SHARE_FUNCTION_ID=share-task-go
export VITE_CANARY_NAME=Go
export VITE_REPO_URL=https://github.com/danielvm-git/appwrite-canary-go
npm run build
bundle="$(ls dist/assets/index-*.js | head -1)"
grep -q 'Shared with me' "$bundle"
grep -q share-task-go "$bundle"
grep -q Go "$bundle"
grep -q danielvm-git/appwrite-canary-go "$bundle"
echo "verify-story-e09s01: OK"