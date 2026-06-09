#!/usr/bin/env bash
set -euo pipefail

GLOG_SCRIPT="node_modules/react-native/scripts/ios-configure-glog.sh"

if [ ! -f "$GLOG_SCRIPT" ]; then
  echo "glog configure script not found, skipping patch"
  exit 0
fi

# RN 0.63 defaults to armv7 for device builds; modern Xcode SDKs no longer support it.
sed -i.bak 's/CURRENT_ARCH="armv7"/CURRENT_ARCH="arm64"/' "$GLOG_SCRIPT"

# Apple Silicon builders need arm64 simulator builds instead of x86_64.
if [ "$(uname -m)" = "arm64" ]; then
  sed -i.bak 's/CURRENT_ARCH="x86_64"/CURRENT_ARCH="arm64"/' "$GLOG_SCRIPT"
fi

echo "Patched glog for modern Xcode: $GLOG_SCRIPT"
