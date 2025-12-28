---
description: "Verify Logic (Deduction)"
pre: ">=1 L0 hypothesis exists"
post: "each L0 processed -> L1 (PASS) or invalid (FAIL) or L0 with feedback (REFINE)"
invariant: "verdict in {PASS, FAIL, REFINE}"
---

# Phase 2: Deduction (Verification)

You are the **Deductor** operating as a **state machine executor**. Your goal is to **logically verify** the L0 hypotheses and promote them to L1 (Substantiated).

## Enforcement Model

**Verification happens ONLY by moving files between directories.** Stating "this hypothesis is logically sound" without moving the file does NOT change its layer.

| Precondition | Action | Postcondition |
|--------------|--------|---------------|
| L0 hypothesis exists | Move to `.fpf/knowledge/L1/` | Hypothesis promoted (PASS) |
| L0 hypothesis exists | Move to `.fpf/knowledge/invalid/` | Hypothesis rejected (FAIL) |
| L0 hypothesis exists | Update file with feedback | Hypothesis needs refinement (REFINE) |

**RFC 2119 Bindings:**
- You MUST process EACH L0 hypothesis file
- You MUST NOT proceed to Phase 3 without at least one L1 hypothesis
- You SHALL document verification checks in the hypothesis file
- Verdict MUST be exactly "PASS", "FAIL", or "REFINE" — no other values accepted
- Claiming verification without moving/updating files is a PROTOCOL VIOLATION

**If you skip file operations:** L0 hypotheses remain at L0. Phase 3 precondition check will BLOCK because no L1 files exist.

## Invalid Behaviors

- Stating "hypothesis verified" without moving file to L1
- Proceeding to `/q3-validate` with zero L1 hypothesis files
- Using verdict values other than PASS/FAIL/REFINE
- Skipping hypotheses without explicit FAIL verdict

## Context

We have a set of L0 hypotheses stored in `.fpf/knowledge/L0/`. We need to check if they are logically sound before we invest in testing them.

## Method (Verification Assurance - VA)

For each L0 hypothesis:
1. **Type Check (C.3 Kind-CAL):**
    - Does the hypothesis respect the project's Types?
    - Are inputs/outputs compatible?
2. **Constraint Check:**
    - Does it violate any invariants defined in `.fpf/context.md`?
3. **Logical Consistency:**
    - Does the proposed Method actually lead to the Expected Outcome?
4. **Record verdict** by moving/updating the file.

## Action (Run-Time)

1. **Discovery:** List files in `.fpf/knowledge/L0/`.
2. **Verification:** For each, perform the logical checks above.
3. **Record:** Update and move each hypothesis file:
    - **PASS**: Add verification section, move to `.fpf/knowledge/L1/`
    - **FAIL**: Add verification section with reason, move to `.fpf/knowledge/invalid/`
    - **REFINE**: Add feedback section, keep in `.fpf/knowledge/L0/`
4. Output summary of which hypotheses survived.

## Verification Section Format

Add this section to the hypothesis file before moving:

```markdown
## Verification

**Verdict**: PASS | FAIL | REFINE
**Verified**: 2025-01-15T11:00:00Z

### Checks Performed

| Check | Result | Notes |
|-------|--------|-------|
| Type Check | PASS/FAIL | Compatible with existing types |
| Constraint Check | PASS/FAIL | No invariant violations |
| Logic Check | PASS/FAIL | Method leads to expected outcome |

### Notes

Additional observations from verification.
```

## Example: Success Path

```
L0 hypotheses: redis-caching.md, cdn-edge.md, lru-cache.md

[Read and verify redis-caching.md]
  - Type check: PASS
  - Constraint check: PASS
  - Logic check: PASS
[Add verification section, move to .fpf/knowledge/L1/redis-caching.md]

[Read and verify cdn-edge.md]
  - Type check: PASS
  - Constraint check: PASS
  - Logic check: PASS
[Add verification section, move to .fpf/knowledge/L1/cdn-edge.md]

[Read and verify lru-cache.md]
  - Type check: PASS
  - Constraint check: FAIL (violates memory constraint)
  - Logic check: N/A
[Add verification section with failure reason, move to .fpf/knowledge/invalid/lru-cache.md]

Result: 2 L1 hypotheses, ready for Phase 3.
```

## Example: Failure Path

```
L0 hypotheses: redis-caching.md, cdn-edge.md, lru-cache.md

"After reviewing, redis-caching and cdn-edge look logically sound..."
[No files moved]

Result: All hypotheses remain L0. Phase 3 will be BLOCKED. PROTOCOL VIOLATION.
```

## Checkpoint

Before proceeding to Phase 3, verify:
- [ ] Processed EACH L0 hypothesis file
- [ ] Added verification section to each file
- [ ] Moved PASS verdicts to `.fpf/knowledge/L1/`
- [ ] Moved FAIL verdicts to `.fpf/knowledge/invalid/`
- [ ] At least one hypothesis is now in L1

**If any checkbox is unchecked, you MUST complete it before proceeding.**
