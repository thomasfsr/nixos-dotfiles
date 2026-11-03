#!/usr/bin/env bash
set -euo pipefail

composer global require laravel/lsp
# Make sure to have export PATH="$HOME/.config/composer/vendor/bin:$PATH" in zshrc.
