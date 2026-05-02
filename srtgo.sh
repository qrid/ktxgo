#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="${SRTGO_VENV:-"$SCRIPT_DIR/.venv"}"
PYTHON_BIN="${PYTHON:-python3}"

if [[ ! -x "$VENV_DIR/bin/python" ]]; then
  "$PYTHON_BIN" -m venv "$VENV_DIR"
fi

if [[ ! -x "$VENV_DIR/bin/srtgo" ]] || ! "$VENV_DIR/bin/python" -c "import click, inquirer, keyring, termcolor" >/dev/null 2>&1; then
  "$VENV_DIR/bin/python" -m pip install -e "$SCRIPT_DIR"
fi

exec "$VENV_DIR/bin/srtgo" "$@"
