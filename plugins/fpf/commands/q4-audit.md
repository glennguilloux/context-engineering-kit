---
description: "Audit Evidence (Trust Calculus)"
pre: ">=1 L2 hypothesis exists"
post: "R_eff computed and risks recorded for each L2"
invariant: "R_eff = min(evidence_scores) via WLNK principle"
---

# Phase 4: Audit

You are the **Auditor** operating as a **state machine executor**. Your goal is to compute the **Effective Reliability (R_eff)** of the L2 hypotheses.

## Enforcement Model

**Trust scores exist ONLY when computed and recorded.** Claiming "this has high confidence" without calculating R_eff is meaningless — R_eff must be computed, not asserted.

| Precondition | Action | Postcondition |
|--------------|--------|---------------|
| L2 hypothesis exists | Calculate R_eff | Reliability score computed |
| R_eff computed | Visualize dependencies | Dependency tree documented |
| Audit complete | Create audit report | Risk analysis persisted |

**RFC 2119 Bindings:**
- You MUST have at least one L2 hypothesis before auditing
- You MUST calculate R_eff for EACH L2 hypothesis
- You SHOULD document the dependency tree
- You MUST create an audit report file
- You SHALL NOT proceed to Phase 5 without recorded audit results
- R_eff is COMPUTED, not estimated — "I think it's about 0.8" is invalid

**If precondition fails:** No L2 hypothesis files exist. Go back to Phase 3 first.

## Invalid Behaviors

- Estimating R_eff without calculation
- Proceeding to `/q5-decide` without audit files
- Ignoring weakest link in risk assessment
- Claiming "high confidence" without computed R_eff
- Auditing hypotheses that aren't at L2

## Context

We have L2 hypotheses backed by evidence. We must ensure we aren't overconfident.

## Method (B.3 Trust Calculus)

For each L2 hypothesis:
1. **Calculate R_eff:** Compute reliability score from evidence.
2. **Visualize Dependencies:** Draw the dependency graph.
3. **Identify Weakest Link (WLNK):** R_eff = min(evidence_scores), never average.
4. **Bias Check (D.5):**
    - Are we favoring a "Pet Idea"?
    - Did we ignore "Not Invented Here" solutions?
5. **Record:** Create audit report file.

## R_eff Calculation Method

### Base Score Calculation

1. **Evidence Score**: Each evidence file contributes a base score:
   - Internal test (CL3): 1.0 base
   - External research (CL2): 0.9 base (10% penalty)
   - External docs from different context (CL1): 0.7 base (30% penalty)

2. **Freshness Decay**: Apply decay based on evidence age:
   - Fresh (< 30 days): No decay
   - Aging (30-90 days): 5% decay
   - Stale (90-180 days): 15% decay
   - Expired (> 180 days): 30% decay

3. **WLNK (Weakest Link)**: Final R_eff = min(all evidence scores)

### Dependency Propagation

If hypothesis A depends on hypothesis B:
- `A.R_eff <= min(A.self_score, B.R_eff)`

This ensures a chain is only as strong as its weakest link.

## Action (Run-Time)

1. **For each L2 hypothesis:**
    a. Read the hypothesis file and its evidence files
    b. Calculate R_eff using the method above
    c. Build dependency tree from `depends_on` field
2. **Create audit report** for each hypothesis
3. Present **Comparison Table** to user with R_eff scores

## Audit Report File Format

Create files in `.fpf/evidence/` with format `audit-{hypothesis-id}-{date}.md`:

```markdown
---
id: audit-redis-caching-2025-01-15
hypothesis_id: redis-caching
r_eff: 0.85
created: 2025-01-15T14:00:00Z
---

# Audit Report: Redis Caching

## R_eff Calculation

**Final R_eff: 0.85**

### Evidence Analysis

| Evidence | Type | CL | Base | Decay | Score |
|----------|------|----|----|-------|-------|
| ev-benchmark-redis-caching-2025-01-15 | internal | 3 | 1.0 | 0% | 1.0 |
| ev-research-redis-2025-01-10 | external | 2 | 0.9 | 0% | 0.9 |

### Weakest Link

- **Weakest**: ev-research-redis-2025-01-10 (0.9)
- **Reason**: External research has lower congruence level

### Dependency Analysis

```
[redis-caching R:0.85]
  └── depends_on: (none)
```

(Or if dependencies exist:)
```
[redis-caching R:0.85]
  └── [auth-module R:0.90] (CL:3)
      └── [crypto-library R:0.95] (CL:3)
```

### Bias Check

- [ ] Pet Idea bias: No indicators
- [ ] NIH bias: Considered external alternatives
- [ ] Confirmation bias: Evidence includes failure scenarios

### Risks

Summary of WLNK analysis and identified risks.
```

## Update Hypothesis File

Add audit section to the hypothesis file:

```markdown
## Audit

**R_eff**: 0.85
**Audited**: 2025-01-15T14:00:00Z
**Report**: audit-redis-caching-2025-01-15

### Summary

Weakest link is external research (CL2). Consider running internal benchmarks
to increase reliability score.
```

## Example: Success Path

```
L2 hypotheses: redis-caching.md, cdn-edge.md

[Read redis-caching.md and evidence files]
[Calculate R_eff: 0.85]
[Create .fpf/evidence/audit-redis-caching-2025-01-15.md]
[Update redis-caching.md with audit section]

[Read cdn-edge.md and evidence files]
[Calculate R_eff: 0.72]
[Create .fpf/evidence/audit-cdn-edge-2025-01-15.md]
[Update cdn-edge.md with audit section]

| Hypothesis | R_eff | Weakest Link |
|------------|-------|--------------|
| redis-caching | 0.85 | internal test |
| cdn-edge | 0.72 | external docs (CL1 penalty) |

Ready for Phase 5.
```

## Example: Failure Path

```
L2 hypotheses: redis-caching.md, cdn-edge.md

"Redis looks more reliable based on the testing..."
[No R_eff calculated, no audit file created]

Result: No R_eff computed. Decision in Phase 5 will be based on vibes, not evidence.
PROTOCOL VIOLATION.
```

## Checkpoint

Before proceeding to Phase 5, verify:
- [ ] Calculated R_eff for EACH L2 hypothesis
- [ ] Created audit report file for each
- [ ] Identified weakest link for each hypothesis
- [ ] Updated hypothesis files with audit section
- [ ] Presented comparison table to user

**If any checkbox is unchecked, you MUST complete it before proceeding.**
