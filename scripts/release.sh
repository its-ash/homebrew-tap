#!/usr/bin/env bash
set -euo pipefail

REPO="its-ash/authenticator"
APP_NAME="Authenticator"
CASK_FILE="Casks/authenticator.rb"

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <version> [dmg-path]"
  echo "  e.g. $0 1.0.0 ./Authenticator-1.0.0.dmg"
  exit 1
fi

VERSION="$1"
DMG_PATH="${2:-./${APP_NAME}-${VERSION}.dmg}"

if [[ ! -f "$DMG_PATH" ]]; then
  echo "Error: DMG not found at $DMG_PATH"
  exit 1
fi

SHA=$(shasum -a 256 "$DMG_PATH" | awk '{print $1}')

if command -v gh >/dev/null 2>&1; then
  echo "Uploading $DMG_PATH to GitHub Releases..."
  gh release create "v${VERSION}" "$DMG_PATH" \
    --repo "$REPO" \
    --title "v${VERSION}" \
    --generate-notes
else
  echo "gh CLI not found; upload $DMG_PATH manually to $REPO v${VERSION}"
fi

echo "Updating $CASK_FILE -> version $VERSION, sha256 $SHA"
perl -i -pe "s/^  version .*/  version \"$VERSION\"/" "$CASK_FILE"
perl -i -pe "s/^  sha256 .*/  sha256 \"$SHA\"/" "$CASK_FILE"

echo "Verifying cask..."
brew style "$CASK_FILE" || true
brew audit --cask authenticator || true

echo "Done. Commit and push to publish."