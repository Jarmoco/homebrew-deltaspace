#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
FORMULA="$SCRIPT_DIR/Formula/deltaspace.rb"

# --- Parse optional version flag ---
VERSION=""
while getopts "v:" opt; do
    case $opt in
        v) VERSION="$OPTARG" ;;
        *) echo "Usage: $0 [-v x.y.z]"; exit 1 ;;
    esac
done

if [ -z "$VERSION" ]; then
    VERSION=$(grep '^version = ' "$PROJECT_DIR/Cargo.toml" | head -1 | sed 's/version = "\(.*\)"/\1/')
fi

if [ -z "$VERSION" ]; then
    echo "Error: could not read version from Cargo.toml (and no -v flag given)"
    exit 1
fi

echo "Updating Homebrew formula to $VERSION"

# --- Locate dist tarballs ---
MACOS_TAR="$PROJECT_DIR/dist/deltaspace_${VERSION}_macos_aarch64.tar.gz"
LINUX_TAR="$PROJECT_DIR/dist/deltaspace_${VERSION}_linux_x86_64.tar.gz"

MISSING=0
for f in "$MACOS_TAR" "$LINUX_TAR"; do
    if [ ! -f "$f" ]; then
        echo "Warning: $f not found — skipping hash update"
        MISSING=1
    fi
done

# --- Compute SHA256 hashes (or keep existing) ---
if [ -f "$MACOS_TAR" ]; then
    MACOS_SHA=$(sha256sum "$MACOS_TAR" | cut -d' ' -f1)
else
    MACOS_SHA=$(grep -A1 'macos_aarch64.tar.gz' "$FORMULA" | tail -1 | sed 's/.*sha256 "\(.*\)".*/\1/')
fi

if [ -f "$LINUX_TAR" ]; then
    LINUX_SHA=$(sha256sum "$LINUX_TAR" | cut -d' ' -f1)
else
    LINUX_SHA=$(grep -A1 'linux_x86_64.tar.gz' "$FORMULA" | tail -1 | sed 's/.*sha256 "\(.*\)".*/\1/')
fi

# --- Update formula ---

# macOS URL + sha256
sed -i "s|url \"https://github.com/Jarmoco/DeltaSpace/releases/download/v[0-9.]*/deltaspace_[0-9.]*_macos_aarch64.tar.gz\"|url \"https://github.com/Jarmoco/DeltaSpace/releases/download/v${VERSION}/deltaspace_${VERSION}_macos_aarch64.tar.gz\"|" "$FORMULA"
sed -i "/url.*macos_aarch64.tar.gz/,+1 s|sha256 \"[a-f0-9]*\"|sha256 \"$MACOS_SHA\"|" "$FORMULA"

# Linux URL + sha256
sed -i "s|url \"https://github.com/Jarmoco/DeltaSpace/releases/download/v[0-9.]*/deltaspace_[0-9.]*_linux_x86_64.tar.gz\"|url \"https://github.com/Jarmoco/DeltaSpace/releases/download/v${VERSION}/deltaspace_${VERSION}_linux_x86_64.tar.gz\"|" "$FORMULA"
sed -i "/url.*linux_x86_64.tar.gz/,+1 s|sha256 \"[a-f0-9]*\"|sha256 \"$LINUX_SHA\"|" "$FORMULA"

echo "Done! $FORMULA updated to v$VERSION."
