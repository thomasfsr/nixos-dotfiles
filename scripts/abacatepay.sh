#!/usr/bin/env bash
set -euo pipefail

curl -fsSL https://abacatepay.com/install.sh | ABACATEPAY_INSTALL_DIR="$HOME/.local/bin" sh
