#!/usr/bin/env bash
# Construit les archives d'import manuel du plugin ARIA dans dist/.
#   dist/aria-chatgpt.zip : pour ChatGPT (un seul manifeste : .codex-plugin/plugin.json)
#   dist/aria-claude.zip  : pour Claude (un seul manifeste : .claude-plugin/plugin.json)
# Les fichiers sont placés à la racine de l'archive, sans dossier englobant.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
rm -f dist/aria-chatgpt.zip dist/aria-claude.zip
common=(skills assets LICENSE)
zip -qrX dist/aria-chatgpt.zip .codex-plugin "${common[@]}" -x '*.DS_Store'
zip -qrX dist/aria-claude.zip .claude-plugin/plugin.json "${common[@]}" -x '*.DS_Store'
ls -lh dist/*.zip
