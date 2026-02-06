# /sdd:04-implement - Feature Implementation

Execute the implementation plan by processing all tasks with TDD approach, quality review, and continuous progress tracking.

- Purpose - Implement all tasks following the execution plan
- Output - Working code with tests passing, updated tasks.md with completion status

```bash
/sdd:04-implement ["implementation preferences"]
```

## Arguments

Optional implementation preferences. Examples: "Focus on test coverage and error handling" or "Prioritize performance optimization".

## How It Works

1. **Context Loading**: Reads implementation context from FEATURE_DIR:
   - **Required**: tasks.md, plan.md
   - **Optional**: data-model.md, contracts.md, research.md

2. **Phase Execution** (Stage 8): For each phase in tasks.md:
   - Launches `developer` agent to implement the phase
   - Follows execution rules:
     - Phase-by-phase: Complete each phase before next
     - Respect dependencies: Sequential tasks in order, parallel [P] tasks together
     - TDD approach: Tests before implementation
     - File coordination: Tasks affecting same files run sequentially

3. **Progress Tracking**:
   - Reports progress after each completed phase
   - Marks completed tasks as [X] in tasks.md
   - Halts on non-parallel task failures
   - Continues parallel tasks, reports failed ones

4. **Completion Validation**: Launches `developer` agent to verify:
   - All required tasks completed
   - Implementation matches specification
   - Tests pass and coverage meets requirements
   - Implementation follows technical plan

5. **Quality Review** (Stage 9):
   - Performs `/code-review:review-local-changes` if available
   - Otherwise launches 3 `developer` agents focusing on:
     - Simplicity/DRY/elegance
     - Bugs/functional correctness
     - Project conventions/abstractions
   - Consolidates findings and recommends fixes

6. **User Decision**: Presents findings and asks:
   - Fix now
   - Fix later
   - Proceed as-is

## Usage Examples

```bash
# Start implementation
/sdd:04-implement

# With error handling focus
/sdd:04-implement Prioritize error handling and edge cases

# Performance-focused
/sdd:04-implement Optimize for performance, use caching where appropriate

# Test coverage priority
/sdd:04-implement Achieve 90%+ test coverage
```

## Best practices

- Address review findings - Quality issues compound over time
- Monitor test failures - Fix tests before proceeding
- Review progress regularly - Check tasks.md for completion status
- Commit frequently - Save progress after each phase
