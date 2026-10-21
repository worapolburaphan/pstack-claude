---
name: poteto-help
description: Explain how to use pstack-claude, choose a skill or playbook, diagnose capability gaps, and form an effective prompt.
---

# pstack for Claude Code help

pstack-claude is a Claude Code-native port of pstack. Start with `/pstack-claude:poteto-mode` for non-trivial engineering work. Use a narrower skill directly when the request already names the shape.

## Common entry points

| Need | Skill |
| --- | --- |
| Rigorous end-to-end engineering task | `/pstack-claude:poteto-mode` |
| Understand how code works | `/pstack-claude:how` |
| Recover design rationale | `/pstack-claude:why` |
| Compare multiple designs or implementations | `/pstack-claude:arena` |
| Parallel coverage or verification | `/pstack-claude:swarm` |
| Settle types, signatures, and module boundaries | `/pstack-claude:architect` |
| Adversarial review | `/pstack-claude:interrogate` |
| Behavior-first implementation | `/pstack-claude:tdd` |
| Clean technical prose | `/pstack-claude:technical-writing` and `/pstack-claude:unslop` |
| Resume prior work | `/pstack-claude:recall` or the Session pickup playbook |
| Configure runtime preferences | `/pstack-claude:setup-pstack` |

## Host capability gaps

Read [the Claude Code runtime contract](../poteto-mode/references/claude-runtime.md).

- Without subagent tools, pstack runs lanes sequentially in the current agent. Independence is reduced, so say so.
- Without `/loop`, `ScheduleWakeup`, or background-task tools, long-running work stops at a durable checkpoint instead of inventing a background loop.
- Without browser or computer-use tools, live UI verification is a named gap. Tests do not become a substitute.
- Without a connected evidence source, `/pstack-claude:why` records the missing category instead of fabricating rationale.

## Prompt shape

A strong request names:

1. The outcome.
2. The evidence or behavior that proves completion.
3. Any branch, PR, file, or environment boundary.
4. Actions that require a pause.

Example:

```text
/pstack-claude:poteto-mode fix the intermittent scroll drift on this branch.
Reproduce it before changing code.
Done means the focused test passes and the real UI remains still for five minutes.
Do not merge.
```

For long-running work, give a finish predicate, not a duration. Claude Code uses its available `/loop`, `ScheduleWakeup`, or background-task mechanism only when the host supports it and the request authorizes continued monitoring.

## Principles

Use principle skills directly when one decision needs a focused rule. `/pstack-claude:poteto-mode` reads a leaf principle only when it applies and reports the principle only when it changed a decision.
