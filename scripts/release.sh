#!/usr/bin/env bash
set -euo pipefail

REPO="its-ash/authenticator"
CASK_FILE="Casks/authenticator.rb"

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <version>"
  echo "  Fetches Authenticator-<version>-macos.zip from GitHub Releases"
  echo "  e.g. $0 1.0.3"
  exit 1
fi

VERSION="$1"
ZIP_NAME="Authenticator-${VERSION}-macos.zip"
DOWNLOAD_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${ZIP_NAME}"

echo "Downloading $DOWNLOAD_URL..."
curl -sL -o "/tmp/${ZIP_NAME}" "$DOWNLOAD_URL"

SHA=$(shasum -a 256 "/tmp/${ZIP_NAME}" | awk '{print $1}')
echo "sha256: $SHA"

echo "Updating $CASK_FILE -> version $VERSION, sha256 $SHA"
perl -i -pe "s/^  version .*/  version \"$VERSION\"/" "$CASK_FILE"
perl -i -pe "s/^  sha256 .*/  sha256 \"$SHA\"/" "$CASK_FILE"

echo "Verifying cask..."
brew style "$CASK_FILE" || true
brew audit --cask authenticator || true

echo "Done. Commit and push to publish."