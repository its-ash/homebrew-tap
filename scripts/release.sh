#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <app> <version>"
  echo "  app: nodio, kode, widgets, or cleaner"
  echo "  e.g. $0 nodio 1.0.0"
  echo "  e.g. $0 kode 1.0.0"
  echo "  e.g. $0 widgets 2.0.0"
  echo "  e.g. $0 cleaner 0.2.0"
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
  kode)
    REPO="its-ash/kode"
    CASK_FILE="Casks/kode.rb"
    ZIP_NAME="Kode-${VERSION}-macos.zip"
    DOWNLOAD_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${ZIP_NAME}"
    AUDIT_NAME="kode"
    ;;
  widgets)
    REPO="its-ash/widgets"
    CASK_FILE="Casks/widgets.rb"
    ZIP_NAME="Widgets-${VERSION}-macos.zip"
    DOWNLOAD_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${ZIP_NAME}"
    AUDIT_NAME="widgets"
    ;;
  cleaner)
    REPO="its-ash/cleaner"
    CASK_FILE="Casks/cleaner.rb"
    ZIP_NAME="Cleaner-${VERSION}-macos.zip"
    DOWNLOAD_URL="https://github.com/${REPO}/releases/download/v${VERSION}/${ZIP_NAME}"
    AUDIT_NAME="cleaner"
    ;;
  *)
    echo "Unknown app: $APP. Use 'nodio', 'kode', 'widgets', or 'cleaner'"
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
