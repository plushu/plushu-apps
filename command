#!/usr/bin/env bash
set -eo pipefail; [[ -n "$PLUSHU_TRACE" ]] && set -x

ls -1 "$PLUSHU_ROOT/apps"
