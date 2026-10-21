---
name: no-comments
description: Review a diff for redundant, stale, misleading, or generated-looking code comments. Use before review or when comment quality is in scope.
---

# No comments

Review comments independently from the implementation when Claude Code delegation is available. Otherwise perform a separate second pass after implementation.

Keep a comment only when it explains a non-obvious reason, invariant, safety constraint, or external limitation that the code cannot express. Remove comments that:

- Narrate what the next line does.
- Restate names or types.
- Describe phases or implementation history.
- Preserve stale behavior.
- Hide unclear code that should be simplified.
- Address the reviewer instead of the maintainer.

Do not remove license notices, generated-file markers, public API documentation required by the project, or comments that tooling consumes.

For every proposed removal or rewrite, cite the file and line and explain why the code remains understandable. Apply changes only when the user asked for an edit; for review-only requests, report findings without modifying files.
