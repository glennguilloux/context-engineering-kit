---
description: "Generate Hypotheses (Abduction)"
pre: "context recorded (Phase 0 complete)"
post: ">=1 L0 hypothesis exists"
invariant: "hypotheses must have kind in {system, episteme}"
---

# Phase 1: Abduction

You are the **Abductor** operating as a **state machine executor**. Your goal is to generate **plausible, competing hypotheses** (L0) for the user's problem.

## Enforcement Model

**Hypotheses exist ONLY when created as files in `.fpf/knowledge/L0/`.** Mental notes, prose descriptions, or markdown lists are NOT hypotheses — they are not queryable, auditable, or promotable.

| Precondition | Action | Postcondition |
|--------------|--------|---------------|
| Phase 0 complete | Create hypothesis file in `.fpf/knowledge/L0/` | L0 hypothesis exists |

**RFC 2119 Bindings:**
- You MUST create a file in `.fpf/knowledge/L0/` for EACH hypothesis you want to track
- You MUST NOT proceed to Phase 2 without at least one L0 hypothesis file
- You SHALL include both `kind` (system/episteme) and `scope` in every hypothesis file
- Mentioning a hypothesis without creating the file does NOT create it

**If you skip file creation:** No L0 hypotheses exist. Phase 2 (`/q2-verify`) will find nothing to verify and return empty results.

## Invalid Behaviors

- Listing hypotheses in prose without creating files for each
- Claiming "I generated 3 hypotheses" when 0 files were created
- Proceeding to `/q2-verify` with zero L0 files
- Using `kind` values other than "system" or "episteme"

## Context

The user has presented an anomaly or a design problem.

## Method (B.5.2 Abductive Loop)

1. **Frame the Anomaly:** Clearly state what is unknown or broken.
2. **Generate Candidates:** Brainstorm 3-5 distinct approaches.
    - *Constraint:* Ensure **Diversity** (NQD). Include at least one "Conservative" (safe) and one "Radical" (novel) option.
3. **Plausibility Filter:** Briefly assess each against constraints. Discard obviously unworkable ones.
4. **Formalize:** For each survivor, create a hypothesis file.

## Before Creating Hypothesis: Linking Checklist

**For EACH hypothesis, explicitly answer these questions:**

| Question | If YES | If NO |
|----------|--------|-------|
| Are there multiple alternatives for the same problem? | Note `decision_context` in frontmatter | Skip `decision_context` |
| Does this hypothesis REQUIRE another hypothesis to work? | Add to `depends_on` list | Leave `depends_on` empty |
| Would failure of another hypothesis invalidate this one? | Add that hypothesis to `depends_on` | Leave empty |

**Examples of when to use `depends_on`:**
- "Health Check Endpoint" depends on "Background Task Fix" (can't check what doesn't work)
- "API Gateway" depends on "Auth Module" (gateway needs auth to function)
- "Performance Optimization" depends on "Baseline Metrics" (can't optimize without baseline)

**Examples of when to use `decision_context`:**
- "Redis Caching" and "CDN Edge Cache" are alternatives - group under "Caching Decision"
- "JWT Auth" and "Session Auth" are alternatives - group under "Auth Strategy Decision"

## Action (Run-Time)

1. Ask the user for the problem statement if not provided.
2. Think through the options.
3. **If proposing multiple alternatives:** Note the decision context in each file.
4. Create a hypothesis file for EACH hypothesis in `.fpf/knowledge/L0/`.
5. Summarize the generated hypotheses to the user, noting any declared dependencies.

## Hypothesis File Format

Create files in `.fpf/knowledge/L0/` with kebab-case names (e.g., `use-redis-for-caching.md`):

```markdown
---
id: use-redis-for-caching
title: Use Redis for Caching
kind: system
scope: High-load systems, Linux only, requires 1GB RAM
decision_context: caching-strategy-decision
depends_on:
  - auth-module
  - rate-limiter
created: 2025-01-15T10:30:00Z
---

# Use Redis for Caching

## Method (The Recipe)

Detailed description of HOW this hypothesis works:
1. Step one
2. Step two
3. ...

## Expected Outcome

What success looks like when this hypothesis is implemented.

## Rationale

Why this approach was chosen:
- **Anomaly**: What problem this addresses
- **Approach**: Why this solution fits
- **Alternatives Rejected**: What was considered but not chosen
```

### Field Reference

| Field | Required | Description |
|-------|----------|-------------|
| `id` | Yes | Unique identifier (kebab-case, matches filename without `.md`) |
| `title` | Yes | Human-readable title |
| `kind` | Yes | `system` (code/architecture) or `episteme` (process/docs) |
| `scope` | Yes | Where this applies, constraints, requirements |
| `decision_context` | No | ID of parent decision (groups alternatives together) |
| `depends_on` | No | List of hypothesis IDs this depends on |
| `created` | Yes | ISO 8601 timestamp |

## Example: Competing Alternatives

```
# First, create the decision context (also an L0 hypothesis)
.fpf/knowledge/L0/caching-strategy-decision.md

# Then create alternatives that reference it
.fpf/knowledge/L0/use-redis.md (decision_context: caching-strategy-decision)
.fpf/knowledge/L0/use-cdn-edge-cache.md (decision_context: caching-strategy-decision)
```

## Example: Declaring Dependencies

```yaml
# In .fpf/knowledge/L0/api-gateway-with-auth.md
---
id: api-gateway-with-auth
title: API Gateway with Auth
kind: system
scope: All API endpoints
depends_on:
  - auth-module
  - rate-limiter
created: 2025-01-15T10:30:00Z
---
```

Dependencies affect reliability calculations:
- `api-gateway-with-auth.R_eff <= min(auth-module.R_eff, rate-limiter.R_eff)`

## Example: Success Path

```
User: "How should we handle caching?"

[Create .fpf/knowledge/L0/redis-caching.md]  -> Success
[Create .fpf/knowledge/L0/cdn-edge.md]  -> Success
[Create .fpf/knowledge/L0/lru-cache.md]  -> Success

Result: 3 L0 hypotheses created, ready for Phase 2.
```

## Example: Failure Path

```
User: "How should we handle caching?"

"I think we could use Redis, a CDN, or in-memory LRU cache..."
[No files created]

Result: 0 L0 hypotheses. Phase 2 will find nothing. This is a PROTOCOL VIOLATION.
```

## Checkpoint

Before proceeding to Phase 2, verify:
- [ ] Created at least one file in `.fpf/knowledge/L0/`
- [ ] Each hypothesis file has valid `kind` (system or episteme)
- [ ] Each hypothesis file has defined `scope`
- [ ] Files follow the correct format with frontmatter
- [ ] If multiple alternatives exist: they share the same `decision_context`
- [ ] If dependencies exist: they are declared in `depends_on`

**If any checkbox is unchecked, you MUST complete it before proceeding.**
