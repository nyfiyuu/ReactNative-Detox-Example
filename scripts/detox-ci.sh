#!/usr/bin/env bash
set -euo pipefail

WORKDIR="${WORKDIR:-.}"
cd "$WORKDIR"

if ! command -v applesimutils >/dev/null 2>&1; then
  echo "Installing applesimutils..."
  brew tap wix/brew
  brew install applesimutils
fi

echo "Rebuilding Detox native bindings..."
npm rebuild detox

echo "Building iOS app for Detox..."
npx detox build --configuration ios.ci

echo "Running Detox e2e tests..."
npx detox test --configuration ios.ci --cleanup
