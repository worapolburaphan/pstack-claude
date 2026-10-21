# Set up pstack for Claude Code

## Install

In a Claude Code terminal session:

```text
/plugin marketplace add worapolburaphan/pstack-claude
/plugin install pstack-claude@pstack-claude
```

The shell equivalents are:

```sh
claude plugin marketplace add worapolburaphan/pstack-claude
claude plugin install pstack-claude@pstack-claude
```

Restart Claude Code or run `/reload-plugins` after installation so the skills are discovered.

## Review the runtime

Invoke `/pstack-claude:setup-pstack`. pstack inherits the active Claude Code model, reasoning effort, permissions, and repository instructions by default. Setup reports which optional capabilities are present:

- Subagent delegation (the Task/Agent tool).
- Model and reasoning-effort overrides.
- `/loop`, `ScheduleWakeup`, background tasks, and hooks.
- Browser, computer-use, terminal, and GitHub tools.

Persistent preferences are optional. If requested, setup stores them in `~/.claude/pstack/config.md`. The file never overrides higher-priority instructions or authorization rules.

## Verification

If the project has no real-surface verification workflow, invoke `/pstack-claude:create-verification-skill`. Keep it project-local under `.claude/skills/verify-<app>/`.

Tests and builds are gates. The verification skill should exercise the behavior a user depends on.

## First task

```text
/pstack-claude:poteto-mode add a --json flag to this command.
Keep text output byte-identical.
Done means both output modes pass their real command-level checks.
```

Next: [Route work through poteto mode](./02-poteto-mode.md).
