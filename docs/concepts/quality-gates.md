# Quality Gates

Quality gates are verification checkpoints placed between development phases to ensure output quality before proceeding to the next stage. They prevent errors from compounding and enable fast iteration with confidence.

## What is a Quality Gate?

A **quality gate** is a systematic review checkpoint where work products are evaluated against defined criteria before being passed forward:

```
Task A → Quality Gate → Task B
         ↓
    Does output meet criteria?
    ├─ Yes → Proceed to Task B
    └─ No  → Refine Task A
```

Think of quality gates as inspection stations in a manufacturing process - catching defects early before they become expensive problems downstream.

## Why Quality Gates Matter

### The Compounding Error Problem

Without quality gates, errors accumulate:

```
❌ Without quality gates:

Phase 1: Specification (contains ambiguity)
         ↓
Phase 2: Architecture (based on ambiguous spec, makes wrong assumptions)
         ↓
Phase 3: Implementation (implements wrong architecture)
         ↓
Phase 4: Testing (tests wrong implementation)
         ↓
Result: Complete rework needed

Cost of fix: 10x-100x more expensive than catching in Phase 1
```

With quality gates, errors are caught early:

```
✅ With quality gates:

Phase 1: Specification
         ↓
Quality Gate: Review spec for clarity
├─ Found: Ambiguity in requirements
└─ Action: Clarify before proceeding
         ↓
Phase 2: Architecture (based on clear spec)
         ↓
Quality Gate: Review architecture
├─ Found: Efficient design
└─ Action: Proceed
         ↓
Phase 3: Implementation
         ↓
Quality Gate: Code review
├─ Found: Minor style issues
└─ Action: Fix and proceed
         ↓
Result: High-quality delivery

Cost of fixes: Minimal, caught early
```

### Research Evidence

Studies consistently show that quality gates improve outcomes:

- **10.6% performance improvement** with quality gates between subagent tasks ([Agentic Context Engineering paper](https://arxiv.org/abs/2510.04618))
- **50-80% defect reduction** when reviews are conducted between phases (software engineering research)
- **8-21% quality improvement** with self-refinement loops ([Self-Refine paper](https://arxiv.org/abs/2305.12966))
- **10x cost savings** by catching defects early vs late (IBM Systems Sciences Institute)

## Quality Gate Types in CEK

### 1. Specification Quality Gates

Verify requirements are clear before design:

```bash
/sdd:01-specify "Add user authentication"

Quality Gate Checks:
├─ Are requirements complete?
├─ Are edge cases considered?
├─ Are success criteria defined?
├─ Are constraints specified?
└─ Is scope clear?

Output: spec.md with clear, complete requirements
Gate: Must pass review before proceeding to planning
```

**Purpose**: Prevent building the wrong thing

### 2. Architecture Quality Gates

Verify design is sound before implementation:

```bash
/sdd:02-plan

Quality Gate Checks:
├─ Does architecture meet requirements?
├─ Are design patterns appropriate?
├─ Are scalability concerns addressed?
├─ Are dependencies manageable?
└─ Is approach feasible?

Output: plan.md with validated architecture
Gate: Must pass review before creating tasks
```

**Purpose**: Prevent building things wrong

### 3. Implementation Quality Gates

Verify code quality before integration:

```bash
/code-review:review-local-changes

Quality Gate Checks:
├─ Bug-hunter: Any bugs or edge cases?
├─ Security-auditor: Any vulnerabilities?
├─ Test-coverage-reviewer: Adequate test coverage?
├─ Code-quality-reviewer: Readable and maintainable?
├─ Contracts-reviewer: APIs well-designed?
└─ Historical-context-reviewer: Consistent with codebase?

Output: Comprehensive review findings
Gate: Must address critical issues before merge
```

**Purpose**: Prevent low-quality code entering codebase

### 4. Verification Quality Gates

Verify implementation meets specification:

```bash
/reflexion:reflect

Quality Gate Checks:
├─ Does implementation match requirements?
├─ Are all acceptance criteria met?
├─ Are edge cases handled?
├─ Is error handling adequate?
└─ Are performance targets met?

Output: Verification report with gaps
Gate: Must fix gaps before considering complete
```

**Purpose**: Prevent incomplete implementations

### 5. Documentation Quality Gates

Verify documentation is complete and accurate:

```bash
/sdd:05-document

Quality Gate Checks:
├─ Are all features documented?
├─ Are API docs complete?
├─ Are examples provided?
├─ Is architecture updated?
└─ Are lessons learned captured?

Output: Updated documentation
Gate: Documentation must be complete before closing feature
```

**Purpose**: Prevent knowledge loss and support issues

## Quality Gate Patterns

### Pattern 1: Review Before Proceed

Simplest pattern - mandatory review before next stage:

```
Task → Review → Gate Decision → Next Task
              ↓
         Pass / Fail / Revise
```

Example in Subagent-Driven Development:

```bash
For each task:
1. Subagent implements feature
2. Code review runs automatically
3. Gate decision:
   ├─ Pass: Proceed to next task
   ├─ Fail: Stop, require manual fix
   └─ Revise: Subagent fixes issues and re-reviews
```

### Pattern 2: Multi-Perspective Gates

Multiple reviewers provide different perspectives using [specialized agents](./agent-workflows.md):

```
Task → Review 1 (Security)
    → Review 2 (Performance)
    → Review 3 (Maintainability)
    → Aggregate Results
    → Gate Decision
```

Example in Code Review:

```bash
/code-review:review-local-changes

6 specialized reviewers:
├─ bug-hunter
├─ security-auditor
├─ test-coverage-reviewer
├─ code-quality-reviewer
├─ contracts-reviewer
└─ historical-context-reviewer

Gate passes only if all reviewers approve
```

### Pattern 3: Tiered Gates

Different severity levels require different actions:

```
Issues found:
├─ Critical: Block until fixed
├─ High: Require review and justification if not fixed
├─ Medium: Document and schedule fix
└─ Low: Optional, informational
```

Example:

```
Security vulnerability found: CRITICAL
→ Gate: BLOCKED until fixed

Code style inconsistency: LOW
→ Gate: PASS with note
```

### Pattern 4: Progressive Refinement Gates

Iterate through refinement loop until quality threshold met:

```
Generate → Verify → Refine → Verify → Refine → Pass
                    ↑         ↓
                    └─────────┘
                  Iterate until quality met
```

Example in Reflexion:

```bash
/reflexion:reflect

1. Generate initial solution
2. Verify against criteria
3. If issues found → refine
4. Verify again
5. Repeat until quality threshold met
6. Pass gate
```

### Pattern 5: Consensus Gates

Multiple [agents](./agent-workflows.md) must reach consensus:

```
Task → Agent 1 Review → Debate
    → Agent 2 Review ↗      ↓
    → Agent 3 Review → Consensus
                            ↓
                       Gate Decision
```

Example in Multi-Agent Critique:

```bash
/reflexion:critique

Judge 1: "Approach is correct but inefficient"
Judge 2: "Security concern with input validation"
Judge 3: "Good maintainability, suggest minor refactor"

Debate phase:
- Prioritize security concern (critical)
- Address efficiency (high impact)
- Defer refactor (optional improvement)

Gate: Must fix security + efficiency before passing
```

### Pattern 6: Learning Gates

Extract insights before proceeding:

```
Task → Review → Extract Learnings → Update Memory → Next Task
```

Example in Agentic Context Engineering:

```bash
/reflexion:memorize

After completing feature:
1. Review implementation and outcomes
2. Extract key insights:
   - What worked well?
   - What challenges were encountered?
   - What patterns emerged?
   - What would we do differently?
3. Update CLAUDE.md with curated insights
4. Future tasks benefit from learnings

Gate: Must capture learnings before marking complete
```

## Implementing Quality Gates

### Gate Criteria Definition

Define clear, objective criteria:

```
✅ Good criteria (objective):
- All unit tests pass (measurable)
- Test coverage > 80% (measurable)
- No critical security vulnerabilities (binary)
- All API endpoints documented (verifiable)

❌ Poor criteria (subjective):
- Code looks good (vague)
- Seems to work (untestable)
- Should be fine (no verification)
```

### Gate Automation

Automate what can be automated:

```typescript
// Pseudo-code for automated quality gate

async function codeQualityGate(changes: GitDiff): Promise<GateResult> {
  const checks = await Promise.all([
    runTests(),           // Automated: test pass/fail
    checkCoverage(),      // Automated: coverage metrics
    lintCode(),          // Automated: style checks
    securityScan(),      // Automated: vulnerability scan
  ]);

  // Some checks require human review
  const humanReviews = await Promise.all([
    architectureReview(),  // Human: design soundness
    apiDesignReview(),     // Human: interface quality
  ]);

  return aggregateResults([...checks, ...humanReviews]);
}
```

### Gate Feedback Quality

Provide actionable feedback:

```
❌ Poor feedback:
"Code has issues"

✅ Good feedback:
"Security Issue: Line 45 - SQL injection vulnerability
 Fix: Use parameterized queries
 Example: db.query('SELECT * FROM users WHERE id = ?', [userId])

 Test Issue: Missing edge case test for null input
 Fix: Add test case for null/undefined input
 Example: expect(() => validateInput(null)).toThrow(ValidationError)"
```

## Quality Gate Best Practices

### Do's

✅ **Define objective criteria** - measurable, verifiable standards
✅ **Automate where possible** - reduce human bottlenecks
✅ **Provide actionable feedback** - specific issues with suggested fixes
✅ **Use appropriate severity levels** - not everything blocks
✅ **Extract learnings** - improve future iterations
✅ **Keep gates lightweight** - fast feedback loops
✅ **Make gates visible** - clear what's being checked
✅ **Iterate on gate criteria** - improve based on results

### Don'ts

❌ **Don't use vague criteria** - "looks good" isn't a gate
❌ **Don't make gates too heavy** - balance thoroughness with speed
❌ **Don't ignore gate failures** - defeats the purpose
❌ **Don't treat all issues equally** - prioritize by severity
❌ **Don't forget to update gates** - criteria should evolve
❌ **Don't skip gates "just this once"** - consistency matters
❌ **Don't make gates punitive** - focus on improvement

## Quality Gate Anti-Patterns

### Anti-Pattern 1: The Rubber Stamp

Gate exists but doesn't actually verify anything:

```
❌ Problem:
Quality Gate: "Did you review the code?"
Developer: "Yes"
Gate: PASS

No actual verification performed
```

**Fix**: Define objective criteria and verify them

### Anti-Pattern 2: The Bottleneck Gate

Gate is so thorough it blocks all progress:

```
❌ Problem:
Quality Gate requires:
- 5 approvers
- 48-hour waiting period
- Complete documentation
- 100% test coverage
- Zero warnings

Result: Nothing gets through, team bypasses gate
```

**Fix**: Balance thoroughness with practicality

### Anti-Pattern 3: The Arbitrary Gate

Criteria change based on reviewer mood:

```
❌ Problem:
Reviewer A: "This is fine"
Reviewer B: "This needs complete rewrite"
Same code, different outcomes
```

**Fix**: Establish objective, consistent criteria

### Anti-Pattern 4: The Too-Late Gate

Gate checks things that can't be fixed at this stage:

```
❌ Problem:
Implementation complete → Architecture review
"Architecture is fundamentally flawed"

Should have been caught in design phase
```

**Fix**: Place gates at appropriate stages

### Anti-Pattern 5: The No-Feedback Gate

Gate fails but doesn't explain why:

```
❌ Problem:
Quality Gate: FAILED
Developer: "What needs to be fixed?"
No feedback provided
```

**Fix**: Always provide specific, actionable feedback

## Quality Gates in CEK Workflows

### Spec-Driven Development Gates

```bash
/sdd:00-setup
→ Gate: Constitution complete and clear?

/sdd:01-specify
→ Gate: Specification complete, unambiguous, testable?

/sdd:02-plan
→ Gate: Architecture sound, feasible, appropriate?

/sdd:03-tasks
→ Gate: Tasks clear, sized appropriately, ordered correctly?

/sdd:04-implement
→ Gate: Implementation meets spec, tests pass, code quality good?

/sdd:05-document
→ Gate: Documentation complete, accurate, helpful?
```

Each stage has explicit quality criteria before proceeding.

### Subagent-Driven Development Gates

```bash
For each task:
1. Spawn subagent
2. Implement task with TDD
3. Run tests → Gate: Tests must pass
4. Code review → Gate: Quality criteria must be met
5. Extract learnings → Gate: Insights captured
6. Update memory → Gate: Knowledge persisted
7. Only then proceed to next task
```

### Reflexion Workflow Gates

```bash
/reflexion:reflect
→ Generate solution
→ Gate: Verify solution quality
→ If issues: refine and re-verify
→ Only pass gate when quality threshold met

/reflexion:critique
→ Multiple perspectives review
→ Gate: Consensus on issues reached
→ Gate: Critical issues addressed
→ Only pass when consensus approves

/reflexion:memorize
→ Extract insights
→ Gate: Insights are actionable and valuable
→ Gate: CLAUDE.md updated correctly
→ Only pass when knowledge properly captured
```

## Measuring Quality Gate Effectiveness

### Metrics to Track

1. **Defect Escape Rate**
   - Defects found after gate vs before
   - Target: < 5% escape rate

2. **Gate Pass Rate**
   - Percentage passing gate on first try
   - Track trends over time

3. **Time to Pass Gate**
   - How long from submission to pass
   - Balance thoroughness with speed

4. **Defect Cost Savings**
   - Cost of early detection vs late
   - Demonstrate gate ROI

5. **Iteration Count**
   - Rounds of refinement before passing
   - Lower is better (indicates clear criteria)

### Example Tracking

```
Quality Gate: Code Review
Period: Last 30 days

Pass rate first try: 72%
Average iterations to pass: 1.4
Average time to pass: 45 minutes
Defects found: 89
Defects escaped: 4 (4.5% escape rate)

Cost savings: $12,000 (early detection vs late)
ROI: 8x (gate cost vs defect cost)
```

## Key Takeaways

1. **Quality gates prevent error compounding** - catch issues early
2. **Gates should have objective criteria** - measurable, verifiable
3. **Automate what you can** - reduce bottlenecks
4. **Provide actionable feedback** - specific issues with fixes
5. **Use appropriate severity levels** - not everything blocks
6. **Extract learnings** - improve future iterations
7. **Balance thoroughness with speed** - practical gates work
8. **Place gates at appropriate stages** - preventive, not reactive
9. **Measure gate effectiveness** - track and improve
10. **Research validates approach** - proven quality improvements

## Real-World Example

### Feature Implementation with Quality Gates

```bash
Feature: User Authentication

Stage 1: Specification
/sdd:01-specify "Add user authentication with OAuth"

Quality Gate:
✓ Requirements clear and complete
✓ Edge cases identified
✓ Success criteria defined
✓ Security requirements specified
→ PASS, proceed to planning

Stage 2: Architecture
/sdd:02-plan

Quality Gate:
✓ OAuth flow design sound
✓ Token management secure
✓ Database schema appropriate
✓ Dependencies acceptable
→ PASS, proceed to tasks

Stage 3: Implementation
/sdd:04-implement

For each task:
  Task: Implement OAuth callback handler

  Quality Gate:
  ✓ Tests written first (TDD)
  ✓ Tests pass
  ✓ Code review:
    ✓ No bugs found
    ✓ Security validated
    ✓ Test coverage adequate
    ✓ Code quality good
  ✓ Learnings extracted
  → PASS, proceed to next task

Stage 4: Documentation
/sdd:05-document

Quality Gate:
✓ API endpoints documented
✓ Authentication flow documented
✓ Security considerations documented
✓ Examples provided
→ PASS, feature complete

Result: High-quality authentication system delivered
No major issues found in production
Clear documentation for maintenance
```

## Related Documentation

**Concepts:**
- [Context Engineering](./context-engineering.md) - Foundation concepts
- [Agent Workflows](./agent-workflows.md) - Multi-agent patterns for quality
- [Granular Design](./granular-design.md) - Modular architecture principles
- [Token Efficiency](./token-efficiency.md) - Balancing quality and token costs

**Guides:**
- [Choosing Plugins](../guides/choosing-plugins.md) - Selecting quality-focused plugins
- [Combining Plugins](../guides/combining-plugins.md) - Quality-focused pack combinations

**Research:**
- [Papers](../research/papers.md) - Research on verification and quality gates
- [Benchmarks](../research/benchmarks.md) - Performance impact of quality gates

---

**Further Reading**:

- [Agentic Context Engineering](https://arxiv.org/abs/2510.04618)
- [Self-Refine Paper](https://arxiv.org/abs/2305.12966)
- [Chain-of-Verification](https://arxiv.org/abs/2305.13888)
- [Software Quality Gates Research](https://martinfowler.com/articles/practical-test-pyramid.html)
