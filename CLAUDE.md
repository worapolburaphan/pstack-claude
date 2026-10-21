# Repository instructions

- This repository targets Claude Code, not Cursor or Codex. Do not introduce `.cursor` or `~/.codex` paths, Cursor- or Codex-only tools, pinned model slugs, or source-runtime plugin dependencies.
- Preserve upstream attribution and the MIT license.
- Keep skills self-contained and use progressive disclosure. Put conditional detail in `references/` or playbooks.
- Treat skill instructions as lower priority than system, developer, repository, and user instructions.
- Before release, run `scripts/check-portability.sh` and validate every `skills/*/SKILL.md` (`claude plugin validate .`).
