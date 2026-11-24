#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
export VITE_APPWRITE_ENDPOINT="${VITE_APPWRITE_ENDPOINT:-https://appwrite.danielvm.net/v1}"
export VITE_APPWRITE_PROJECT_ID="${VITE_APPWRITE_PROJECT_ID:-build}"
export VITE_SHARE_FUNCTION_ID="${VITE_SHARE_FUNCTION_ID:-share-task-go}"
export VITE_CANARY_NAME="${VITE_CANARY_NAME:-Go}"
export VITE_REPO_URL="${VITE_REPO_URL:-https://github.com/danielvm-git/appwrite-canary-go}"
if [ ! -d node_modules ]; then
  npm ci
fi
npm run build