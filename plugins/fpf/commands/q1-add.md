---
description: "Inject User Hypothesis"
---

# Phase 1: Abduction (User Injection)

You are the **Abductor** (Scribe). Your goal is to **formalize the user's specific idea** into a Hypothesis (L0).

## Context

The user has a specific solution in mind that they want to evaluate alongside other options.

## Method (Formalization)

1. **Analyze Input:** Understand the user's proposed solution.
2. **Formalize:** Define the **Method** (The Recipe) and **Expected Outcome**.
3. **Rationale:** Document that this was "User Proposed".

## Action (Run-Time)

1. Create a hypothesis file in `.fpf/knowledge/L0/` with the user's idea.
2. Inform the user that the hypothesis has been added.
3. **Remind:** "Phase reset to **ABDUCTION**. Run `/q2-verify` to check this new option."

## Hypothesis File Format

Create a file in `.fpf/knowledge/L0/` with kebab-case name (e.g., `user-proposed-caching.md`):

```markdown
---
id: user-proposed-solution
title: User's Solution Title
kind: system
scope: Where the user intends this to apply
created: 2025-01-15T10:30:00Z
---

# User's Solution Title

## Method (The Recipe)

Detailed description of the user's proposed method.

## Expected Outcome

What the user expects this solution to achieve.

## Rationale

- **Source**: User input
- **Problem**: The problem the user wants to solve
- **Note**: Manually injected hypothesis
```

### Field Reference

| Field | Required | Description |
|-------|----------|-------------|
| `id` | Yes | Unique identifier (kebab-case) |
| `title` | Yes | User's idea title |
| `kind` | Yes | `system` (code/architecture) or `episteme` (process/docs) |
| `scope` | Yes | Where the user intends this to apply |
| `created` | Yes | ISO 8601 timestamp |

## Example

User says: "What if we just use SQLite instead?"

Create `.fpf/knowledge/L0/use-sqlite-database.md`:

```markdown
---
id: use-sqlite-database
title: Use SQLite Database
kind: system
scope: Small-scale deployments, single-server environments
created: 2025-01-15T10:30:00Z
---

# Use SQLite Database

## Method (The Recipe)

Replace PostgreSQL with SQLite for data persistence:
1. Migrate schema to SQLite-compatible DDL
2. Update connection strings
3. Remove PostgreSQL dependencies

## Expected Outcome

Simpler deployment with no external database service required.

## Rationale

- **Source**: User input
- **Problem**: Database complexity in deployment
- **Note**: Manually injected hypothesis for evaluation
```
