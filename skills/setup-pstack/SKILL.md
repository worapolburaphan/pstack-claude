---
name: setup-pstack
description: Configure optional pstack preferences for Claude Code, including delegation, reasoning effort, and long-running work. Use after installing pstack-claude or when changing its runtime behavior.
---

# Set up pstack for Claude Code

pstack works without configuration. The default is to inherit the active Claude Code model, reasoning effort, permissions, and repository instructions.

## Inspect the host

Identify only capabilities visible in the current Claude Code host:

- Whether subagent delegation (the Task/Agent tool) is available and permitted.
- Whether the host exposes model or reasoning-effort choices.
- Whether `/loop`, `ScheduleWakeup`, background tasks, or hooks are available for long-running work.
- Which browser, computer-use, terminal, and GitHub tools are available for live verification.

Do not invent model identifiers or promise a capability the host does not expose.

## Optional preferences

If the user wants persistent local preferences, write `~/.claude/pstack/config.md` after obtaining normal filesystem authorization. Keep it human-readable:

```markdown
# pstack Claude Code preferences
delegation: when-useful
reasoning-effort: inherit
long-running: host-default
verification: real-surface-when-available
```

Accepted guidance:

- `delegation`: `when-useful`, `off`, or an explicit user policy.
- `reasoning-effort`: `inherit` or a value the current host explicitly supports.
- `long-running`: `host-default`, `loop`, or `manual`, but only when the host supports it.
- `verification`: keep `real-surface-when-available` unless the user deliberately chooses a narrower policy.

Configuration never overrides system, developer, repository, sandbox, approval, or user instructions.

## Finish

Summarize the capabilities detected, any preferences written, and the features that will fall back to the current agent because the host does not expose them.
