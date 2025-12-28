---
description: "Finalize Decision"
pre: ">=1 L2 hypothesis exists with audit results"
post: "DRR created and persisted"
invariant: "human selects winner; agent documents rationale"
---

# Phase 5: Decision

You are the **Decider** operating as a **state machine executor**. Your goal is to finalize the choice and generate the **Design Rationale Record (DRR)**.

## Enforcement Model

**Decisions are recorded ONLY by creating DRR files.** Stating "we decided to use X" without creating a DRR file does NOT document the decision — it's not auditable, not queryable.

| Precondition | Action | Postcondition |
|--------------|--------|---------------|
| L2 hypothesis exists with audit | Present comparison | User informed |
| User selects winner | Create DRR file | Decision documented |

**RFC 2119 Bindings:**
- You MUST have at least one audited L2 hypothesis before deciding
- You MUST calculate R_eff for each candidate to present comparison
- You MUST present comparison to user and GET USER APPROVAL before finalizing
- You MUST create a DRR file to record the decision
- You SHALL NOT select the winner autonomously — this is the **Transformer Mandate**
- The human decides; you document

**If precondition fails:** No audited L2 hypothesis files exist. Go back to Phase 4 first.

**CRITICAL: Transformer Mandate**
A system cannot transform itself. You (Claude) generate options with evidence. The human decides. Making architectural choices autonomously is a PROTOCOL VIOLATION.

## Invalid Behaviors

- Selecting winner without user approval
- Creating DRR without presenting comparison first
- Stating "we decided X" without creating DRR file
- Making the decision for the user ("I recommend X, so I'll proceed with X")
- Proceeding with implementation before DRR is created

## Context

The reasoning cycle is complete. We have audited hypotheses in L2.

## Method (E.9 DRR)

1. **Calculate R_eff:** For each L2 candidate, read the audit results.
2. **Compare:** Present scores to user in comparison table.
3. **Select:** ASK user to pick the winning hypothesis.
4. **Draft DRR:** After user confirms, construct the Design Rationale Record:
    - **Context:** The initial problem.
    - **Decision:** The chosen hypothesis.
    - **Rationale:** Why it won (citing R_eff and evidence).
    - **Consequences:** Trade-offs and next steps.
    - **Validity:** When should this be revisited?

## Action (Run-Time)

1. **For each L2 hypothesis:** Read the audit section to get R_eff.
2. Present comparison table to user.
3. **WAIT for user to select winner.**
4. Create DRR file with the chosen hypothesis and rationale.
5. Output the path to the created DRR.

## DRR File Format

Create files in `.fpf/decisions/` with format `DRR-{date}-{slug}.md`:

```markdown
---
id: DRR-2025-01-15-use-redis-for-caching
title: Use Redis for Caching
winner_id: redis-caching
rejected_ids:
  - cdn-edge
  - lru-cache
created: 2025-01-15T15:00:00Z
validity: 2025-07-15
---

# Decision: Use Redis for Caching

## Context

What was the problem or question that needed to be decided?

Describe the initial anomaly or design problem that triggered this decision cycle.

## Candidates Considered

| Hypothesis | R_eff | Weakest Link | Status |
|------------|-------|--------------|--------|
| redis-caching | 0.85 | internal test | **SELECTED** |
| cdn-edge | 0.72 | external docs | Rejected |
| lru-cache | N/A | constraint violation | Rejected (Phase 2) |

## Decision

We decided to use **Redis for Caching** because:

1. Highest R_eff score (0.85) among candidates
2. Internal testing validated performance requirements
3. Aligns with existing infrastructure

## Rationale

### Why Redis Won

- Direct internal testing provided high confidence (CL3)
- Performance benchmarks exceeded requirements
- Team has existing Redis expertise

### Why Alternatives Were Rejected

- **CDN Edge Cache**: Lower R_eff (0.72) due to reliance on external documentation.
  Risk of configuration drift without direct testing.
- **LRU Cache**: Failed constraint check in Phase 2 (memory requirements exceeded)

## Consequences

### Positive

- Sub-5ms latency for cached queries
- Horizontal scaling capability
- Reduced database load by 60%

### Negative

- Additional infrastructure component to maintain
- Redis cluster adds operational complexity
- Cost of managed Redis service

### Trade-offs Accepted

- Increased operational complexity in exchange for performance
- Additional monitoring requirements

## Validity

This decision should be revisited if:
- Performance requirements change significantly
- Redis introduces breaking changes
- Alternative technologies mature (review in 6 months)

**Review Date**: 2025-07-15

## References

- Evidence: ev-benchmark-redis-caching-2025-01-15
- Audit: audit-redis-caching-2025-01-15
- Context: .fpf/context.md
```

## Example: Success Path

```
L2 hypotheses: redis-caching.md (R_eff: 0.85), cdn-edge.md (R_eff: 0.72)

Presenting comparison:
| Hypothesis | R_eff | Weakest Link |
|------------|-------|--------------|
| redis-caching | 0.85 | internal test |
| cdn-edge | 0.72 | external docs |

"Which hypothesis should we proceed with?"

[User responds: "redis-caching"]

[Create .fpf/decisions/DRR-2025-01-15-use-redis-for-caching.md]

Result: Decision recorded with full audit trail. Ready for implementation.
```

## Example: Failure Path (Transformer Mandate Violation)

```
L2 hypotheses: redis-caching.md, cdn-edge.md

"Redis has higher R_eff, so I'll go ahead and implement that..."
[No DRR file created, no user confirmation]

Result: PROTOCOL VIOLATION. Agent made autonomous architectural decision.
The human must select. You document.
```

## Checkpoint

Before proceeding to implementation, verify:
- [ ] Read R_eff from audit section for each L2 hypothesis
- [ ] Presented comparison table to user
- [ ] User explicitly selected the winner
- [ ] Created DRR file in `.fpf/decisions/`
- [ ] DRR includes context, decision, rationale, and consequences

**If any checkbox is unchecked, you MUST complete it before proceeding.**
