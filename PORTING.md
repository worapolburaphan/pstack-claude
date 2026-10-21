# Porting notes

`pstack-claude` follows the Claude Code plugin layout (a `.claude-plugin/` manifest and marketplace, with skills under `skills/`). It is not a byte-for-byte mirror of the Cursor plugin or its Codex port.

## Lineage

Cursor pstack → [`pstack-codex`](https://github.com/worapolburaphan/pstack-codex) → `pstack-claude`. Each port preserves the engineering invariants and translates only the runtime assumptions.

## Runtime mappings

| Upstream concept | Claude Code port |
| --- | --- |
| Cursor `Task` with a named `subagent_type`, or a Codex subagent | Claude Code subagents (the Task/Agent tool) when the host exposes them; otherwise run the lane in the current agent |
| Per-role Cursor model slugs | Inherit the active Claude Code model by default; use only model and effort values exposed by the current host |
| `AskQuestion` | Claude Code structured user input when available, otherwise one concise question |
| `/loop` / Codex heartbeat | Claude Code `/loop`, `ScheduleWakeup`, background tasks, or hooks when available |
| Cursor transcripts under `~/.cursor/projects` | The current Claude Code session; never scan unrelated conversations |
| `~/.cursor/rules/pstack-models.mdc` / `~/.codex/pstack/config.md` | Optional `~/.claude/pstack/config.md` preferences |
| Project skills under `.agents/skills/` (Codex) | Project skills under `.claude/skills/` |
| `cursor-team-kit` control skills | The current Claude Code host's browser, computer-use, terminal, review, and verification tools |
| Cursor custom agents | Self-contained skills plus an explicit instruction for delegated agents to load the relevant skill |

## Safety and authority

The original workflow's bias toward autonomy never overrides Claude Code system policy, sandbox limits, approval requirements, repository instructions, or the user's scope. External writes, destructive actions, merges, deployments, and messages still use the host's normal authorization rules.

## Updating from upstream

Review upstream changes rather than copying them blindly. Preserve useful engineering invariants, then translate new APIs through the table above. Run `scripts/check-portability.sh` and validate every skill before release.

## Deliberate v0.1 omissions

- Benny automations are not included because their scheduling and runtime contract is Cursor-specific. Claude Code `/loop`, `ScheduleWakeup`, and hooks should be added as a separate, host-aware integration.
- `make-bot-ui` is not included because it depends on Cursor webhook infrastructure.
- The Bun-based PR watcher and orchestration CLI are replaced by native forge checks, Claude Code waits, and plain-text state files. Installing the plugin never installs runtime packages.
