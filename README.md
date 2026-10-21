# pstack for Claude Code

`pstack-claude` adapts Lauren Tan's [pstack plugin](https://github.com/cursor/plugins/tree/main/pstack) for Claude Code.

It keeps pstack's investigation and verification rules. It replaces Cursor-only and Codex-only APIs, paths, model names, custom agents, and loop behavior with Claude Code tools.

## Upstream source

This port follows the engineering substance of pstack and its Codex port, [`pstack-codex`](https://github.com/worapolburaphan/pstack-codex). The upstream pstack extraction keeps commits that changed `pstack` and leaves out other plugins.

- [Original pstack plugin](https://github.com/cursor/plugins/tree/main/pstack)
- [Original pstack skills](https://github.com/cursor/plugins/tree/main/pstack/skills)
- [Source commit used for the initial port](https://github.com/cursor/plugins/tree/11713c683fe4add4fd403ea880580abbc9e0875f/pstack)

## Install

In a Claude Code terminal session, add this repository as a marketplace, then install the plugin:

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

To update later:

```sh
claude plugin marketplace update pstack-claude
```

## Start here

Use `/pstack-claude:setup-pstack` once to review the Claude Code runtime mapping and optional preferences. Then invoke `/pstack-claude:poteto-mode` for an engineering task that needs investigation, implementation, and verification.

Examples:

```text
/pstack-claude:poteto-mode investigate this intermittent scroll drift, reproduce it, fix the root cause, and verify it.

/pstack-claude:how explain how cancellation flows through this subsystem and cite the relevant files.

/pstack-claude:interrogate review this diff from correctness, concurrency, and maintainability angles.
```

`poteto-mode` selects a playbook for the task. The plugin includes playbooks for bug fixes, performance work, refactoring, prototypes, visual matching, review, shipping, autonomous runs, and multi-phase work. You can also invoke individual skills such as `/pstack-claude:tdd`, `/pstack-claude:unslop`, and `/pstack-claude:technical-writing`.

## What changed from upstream

- Delegation uses Claude Code subagents (the Task/Agent tool) when the current host and policy allow them. A skill falls back to the current agent when delegation is unavailable.
- Model routing inherits the active Claude Code model by default. The port never assumes Cursor, Codex, or pinned model slugs.
- Long-running work uses Claude Code `/loop`, `ScheduleWakeup`, background tasks, or hooks when available.
- UI and CLI verification use the tools available in the current Claude Code host (the built-in browser, Claude in Chrome, computer-use, and the Bash terminal).
- Transcript-aware skills use the current session. They never scan unrelated local conversations.
- External writes and destructive actions follow Claude Code authorization and sandbox rules.

See [PORTING.md](PORTING.md) for the complete mapping.

## Status

This project is an independent compatibility port. Cursor, OpenAI, Anthropic, and the upstream pstack author do not maintain it. The initial port is based on pstack `0.15.17`; see [ATTRIBUTION.md](ATTRIBUTION.md).

## License

MIT. The upstream copyright notice is preserved in [LICENSE](LICENSE).
