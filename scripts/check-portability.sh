#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Patterns that would mean a source-runtime assumption leaked into the Claude Code port.
# Model slugs stay version-agnostic: inherit the active Claude Code model, never pin one.
forbidden=(
  '\.cursor/'
  '~/.cursor'
  'cursor-team-kit'
  '~/.codex'
  '\.codex-plugin'
  'codex plugin'
  'onboardingSkill'
  'com\.openai'
  '\bCodex\b'
  'grok-[0-9]'
  'claude-(opus|sonnet|fable|haiku)-[0-9]'
)

status=0
scan_paths=(
  "$root_dir/skills"
  "$root_dir/docs"
  "$root_dir/.claude-plugin/plugin.json"
  "$root_dir/.claude-plugin/marketplace.json"
)
for pattern in "${forbidden[@]}"; do
  if rg -n --glob '*.md' --glob '*.json' --glob '*.toml' "$pattern" "${scan_paths[@]}"; then
    printf 'forbidden portability pattern: %s\n' "$pattern" >&2
    status=1
  fi
done

if (( status != 0 )); then
  exit "$status"
fi

printf 'portability check passed\n'
