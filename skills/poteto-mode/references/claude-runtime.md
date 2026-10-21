# Claude Code runtime contract

Use this contract whenever an upstream playbook mentions a source-runtime-specific tool or behavior.

## Delegation

- Use Claude Code subagents (the Task/Agent tool) only when they are present and active policy permits delegation.
- Spawn independent lanes together in one message when the host supports concurrent subagents.
- Give each agent one bounded role, the relevant skill path, the shared acceptance criteria, and the expected output shape.
- Inherit the active model and reasoning effort by default. Use an override only when the host explicitly exposes that value or the user requested it.
- A read-only lane must not edit files. Concurrent writers use separate worktrees or otherwise disjoint state.
- If delegation is unavailable, run the lanes sequentially in the current agent and label the loss of independence.
- The parent owns the outcome. Inspect evidence and diffs instead of forwarding a child report verbatim.

## User input

Ask one concise question when a real product or preference call needs the user, using structured user input when the host exposes it. Do not ask the user to decide a fact that a reversible experiment can settle.

## Long-running work

Use a Claude Code `/loop`, a `ScheduleWakeup`, a background task, or a bounded polling tool when available. Follow that tool's notification and authorization rules. Never emulate a scheduler with an unbounded shell sleep loop.

## Threads and transcripts

Use the current conversation and the current session transcript. Read another session only when the user authorizes or requests it and the host exposes a reader. Never scan unrelated local conversation stores.

## Verification

Choose the tool that matches the real surface:

- Browser or web UI: the Claude Code browser tools (the built-in browser or Claude in Chrome) or computer-use.
- Native application: available computer-use or application-control tools.
- CLI or TUI: a Bash terminal session with observable input and output.
- GitHub or another forge: its connected app (the GitHub MCP tools) or an authenticated CLI.

Tests and compilation are gates, not substitutes for exercising the load-bearing behavior.

## Authority

System, developer, repository, sandbox, approval, and user instructions always outrank this plugin. Persistence and autonomy do not authorize new side effects. Use the host's normal confirmation rules for external writes, messages, merges, deploys, and destructive actions.
