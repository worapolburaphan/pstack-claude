# Make it yours

pstack is one engineering style. Keep only the parts that improve repeated decisions.

## Generate a personal mode

Invoke `/pstack-claude:automate-me`. It mines the current conversation, related threads the user explicitly authorizes, and active repository artifacts. It never scans unrelated local chats.

The skill uses Claude Code's `skill-creator` skill and writes either:

- A project skill under `.claude/skills/<handle>-mode/`.
- A personal skill under `~/.claude/skills/<handle>-mode/` when the user requests it.

## Reflect on a run

Invoke `/pstack-claude:reflect` after a task that exposed a repeated failure. Independent judgment, tooling, and divergent lenses produce proposals. Accept a skill change only when the evidence shows it will alter a future decision or remove repeated waste.

## Correct the environment

When the same mistake recurs, prefer stronger fixes in this order:

1. Make the mistake impossible through architecture or data shape.
2. Block it with types, lint, or CI.
3. Catch it with a behavior test.
4. Document the rule.

Use `/pstack-claude:correct` to turn repeated mistakes into repository structure or checks.

## Author and test skills

Use `/pstack-claude:poteto-mode` with the Authoring a skill playbook, which routes through Claude Code's `skill-creator`, validates the skill, and tests meaningful behavior when warranted.

Use `/pstack-claude:create-verification-skill` for skills that drive a real application surface. Use `/pstack-claude:maintain-verification-skill` when its feature map drifts.

Use the Eval playbook for a blinded comparison before promoting a substantial skill change. Inspect the actual candidate outputs before accepting the judge's verdict.

Next: [Recipes and pitfalls](./10-recipes-and-pitfalls.md).
