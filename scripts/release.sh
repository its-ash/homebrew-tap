#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <app> <version>"
  echo "  app: nodio, router, kode, or noteit"
  echo "  e.g. $0 nodio 1.0.0"
  echo "  e.g. $0 router 1.0.0"
  echo "  e.g. $0 kode 1.0.0"
  echo "  e.g. $0 noteit 1.0.0"
  exit 1
fi

APP="$1"
VERSION="$2"

case "$APP" in
  nodio)
    REPO="its-ash/Nodio"
    CASK_FILE="Casks/nodio.rb"
    ZIP_NAME="Nodio.dmg"
    DOWNLOAD_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${ZIP_NAME}"
    AUDIT_NAME="nodio"
    ;;
  router)
    REPO="its-ash/router"
    CASK_FILE="Casks/router.rb"
    ZIP_NAME="Router-${VERSION}-macos.zip"
    DOWNLOAD_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${ZIP_NAME}"
    AUDIT_NAME="router"
    ;;
  kode)
    REPO="its-ash/kode"
    CASK_FILE="Casks/kode.rb"
    ZIP_NAME="Kode-${VERSION}-macos.zip"
    DOWNLOAD_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${ZIP_NAME}"
    AUDIT_NAME="kode"
    ;;
  noteit)
    REPO="its-ash/noteit"
    CASK_FILE="Casks/noteit.rb"
    ZIP_NAME="NoteIt-${VERSION}-macos.zip"
    DOWNLOAD_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${ZIP_NAME}"
    AUDIT_NAME="noteit"
    ;;
  *)
    echo "Unknown app: $APP. Use 'nodio', 'router', 'kode', or 'noteit'"
    exit 1
    ;;
esac

echo "Downloading $DOWNLOAD_URL..."
curl -sL -o "/tmp/${ZIP_NAME}" "$DOWNLOAD_URL"

SHA=$(shasum -a 256 "/tmp/${ZIP_NAME}" | awk '{print $1}')
echo "sha256: $SHA"

echo "Updating $CASK_FILE -> version $VERSION, sha256 $SHA"
perl -i -pe "s/^  version .*/  version \"$VERSION\"/" "$CASK_FILE"
perl -i -pe "s/^  sha256 .*/  sha256 \"$SHA\"/" "$CASK_FILE"

echo "Verifying cask..."
brew style "$CASK_FILE" || true
brew audit --cask "$AUDIT_NAME" || true

echo "Done. Commit and push to publish."