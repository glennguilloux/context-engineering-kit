---
description: "Validate (Induction)"
pre: ">=1 L1 or L2 hypothesis exists"
post: "L1 processed -> L2 (PASS) or invalid (FAIL) or L1 with feedback (REFINE); L2 processed -> refreshed evidence"
invariant: "test_type in {internal, external}; verdict in {PASS, FAIL, REFINE}"
---

# Phase 3: Induction (Validation)

You are the **Inductor** operating as a **state machine executor**. Your goal is to gather **Empirical Validation (EV)** for L1 hypotheses to promote them to L2.

**Also serves as the REFRESH action** in the Evidence Freshness governance loop (see `/q-decay`).

## Enforcement Model

**Validation happens ONLY by creating evidence files and moving hypothesis files.** Research findings, test outputs, or empirical observations are NOT recorded unless you create the files.

| Precondition | Action | Postcondition |
|--------------|--------|---------------|
| L1 hypothesis exists | Create evidence, move to `.fpf/knowledge/L2/` | L1 -> L2 (PASS) |
| L1 hypothesis exists | Create evidence, move to `.fpf/knowledge/invalid/` | L1 -> invalid (FAIL) |
| L2 hypothesis exists (refresh) | Create new evidence file | L2 -> L2 with fresh evidence |

**RFC 2119 Bindings:**
- You MUST have at least one L1 or L2 hypothesis before validating
- You MUST create evidence files for EACH hypothesis you validate
- You MUST NOT validate L0 hypotheses — they must pass Phase 2 first
- You SHALL specify `test_type` as "internal" (code test) or "external" (research/docs)
- Verdict MUST be exactly "PASS", "FAIL", or "REFINE"

**If precondition fails:** No L1 hypothesis files exist. Go back to Phase 2 first.

**CRITICAL:** If you find no L1 hypotheses, you MUST NOT proceed. Go back to Phase 2 first.

## Invalid Behaviors

- Validating L0 hypothesis (WILL BE BLOCKED)
- Validating hypothesis that doesn't exist
- Stating "validated via testing" without creating evidence file
- Proceeding to `/q4-audit` with zero L2 hypotheses

**Note:** Validating L2 hypotheses is VALID — it refreshes their evidence for the freshness governance loop.

## Context

We have substantiated hypotheses (L1) that passed logical verification. We need evidence that they work in reality.

## Method (Agentic Validation Strategy)

For each L1 hypothesis, choose the best validation strategy:

1. **Strategy A: Internal Test (Preferred - Highest R)**
    - *Action:* Write and run a reproduction script, benchmark, or prototype.
    - *Why:* Direct evidence in the target context has Congruence Level (CL) = 3 (Max).
    - *Use when:* Code is executable, environment is available.

2. **Strategy B: External Research (Fallback)**
    - *Action:* Use available MCP tools (search, docs, knowledge bases).
    - *Why:* Evidence from other contexts has lower CL (1 or 2). Applies penalty to R.
    - *Use when:* Running code is impossible or too costly.

## Action (Run-Time)

1. **Discovery:** List files in `.fpf/knowledge/L1/`.
2. **Decide:** Pick Strategy A or B for each.
3. **Execute:** Run tests or gather research.
4. **Record:** Create evidence files and update hypothesis files.

## Evidence File Format

Create files in `.fpf/evidence/` with format `ev-{type}-{hypothesis-id}-{date}.md`:

```markdown
---
id: ev-benchmark-redis-caching-2025-01-15
hypothesis_id: redis-caching
type: internal
verdict: PASS
created: 2025-01-15T12:00:00Z
valid_until: 2025-07-15T12:00:00Z
---

# Evidence: Redis Caching Benchmark

## Test Type

Internal (direct code execution)

## Methodology

Description of how the test was conducted.

## Results

- Latency: 5ms average
- Throughput: 10,000 ops/sec
- Memory usage: 256MB

## Conclusion

Test passed. Performance meets requirements.

## Carrier Reference

`src/cache/redis.ts` (the file this evidence applies to)
```

### Field Reference

| Field | Required | Description |
|-------|----------|-------------|
| `id` | Yes | Unique identifier: `ev-{type}-{hypothesis-id}-{date}` |
| `hypothesis_id` | Yes | ID of the hypothesis this evidence supports |
| `type` | Yes | `internal` (code test) or `external` (research/docs) |
| `verdict` | Yes | `PASS`, `FAIL`, or `REFINE` |
| `created` | Yes | ISO 8601 timestamp |
| `valid_until` | Yes | When this evidence expires (typically 6 months) |

## Update Hypothesis File

Add validation section to the hypothesis file:

```markdown
## Validation

**Verdict**: PASS
**Validated**: 2025-01-15T12:00:00Z
**Evidence**: ev-benchmark-redis-caching-2025-01-15

### Test Summary

Brief summary of what was tested and the results.
```

## Example: Success Path

```
L1 hypotheses: redis-caching.md, cdn-edge.md

[Run benchmark script for redis-caching]
[Create .fpf/evidence/ev-benchmark-redis-caching-2025-01-15.md]
[Add validation section to redis-caching.md]
[Move to .fpf/knowledge/L2/redis-caching.md]

[Search docs for CDN configuration]
[Create .fpf/evidence/ev-research-cdn-edge-2025-01-15.md]
[Add validation section to cdn-edge.md]
[Move to .fpf/knowledge/L2/cdn-edge.md]

Result: 2 L2 hypotheses, ready for Phase 4.
```

## Example: Failure Path

```
L1 hypotheses: redis-caching.md

"I researched Redis best practices and it looks good..."
[No evidence file created, no hypothesis moved]

Result: Hypothesis remains L1. Phase 4 will find no L2 to audit. PROTOCOL VIOLATION.
```

## Checkpoint

Before proceeding to Phase 4, verify:
- [ ] Listed L1 hypotheses (not L0)
- [ ] Created evidence file for EACH hypothesis
- [ ] Added validation section to each hypothesis file
- [ ] Moved PASS verdicts to `.fpf/knowledge/L2/`
- [ ] At least one hypothesis is now in L2

**If any checkbox is unchecked, you MUST complete it before proceeding.**

---

## Evidence Refresh (L2 -> L2)

When validating an L2 hypothesis, create new evidence file without moving the hypothesis.

**Use case:** `/q-decay` shows stale evidence on an L2 hypothesis. Run `/q3-validate <hypothesis_id>` to refresh.

| Current Layer | Verdict | Outcome |
|---------------|---------|---------|
| L1 | PASS | Promotes to L2 |
| L1 | FAIL | Stays L1 (or moves to invalid) |
| L2 | PASS | Stays L2, fresh evidence added |
| L2 | FAIL | Stays L2, failure recorded, consider `/q-decay --deprecate` |
