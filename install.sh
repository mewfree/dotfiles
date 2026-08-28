#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

for dir in */; do
    pkg="${dir%/}"
    stow "$pkg"
done
