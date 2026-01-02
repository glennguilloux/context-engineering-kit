---
description: Execute complex tasks through sequential sub-agent orchestration with intelligent model selection, context passing between steps, Zero-shot CoT reasoning, and mandatory self-critique verification
argument-hint: Task description (e.g., "Refactor UserService class and update all consumers")
---

# do-in-steps

<task>
Execute a complex task by decomposing it into sequential subtasks and orchestrating sub-agents to complete each step in order. Automatically analyze the task to identify dependencies, select optimal models for each subtask, and pass relevant context from completed steps to subsequent ones.
</task>

<context>
This command implements the **Supervisor/Orchestrator pattern** for sequential task execution with context passing. You (the orchestrator) analyze a complex task, decompose it into ordered subtasks, and dispatch focused sub-agents for each step. Each sub-agent receives:
- **Isolated context** - Clean context window for its specific subtask
- **Optimal model** - Selected based on subtask complexity (Opus/Sonnet/Haiku)
- **Previous step context** - Summary of relevant outputs from preceding steps
- **Structured reasoning** - Zero-shot CoT prefix for systematic thinking
- **Quality assurance** - Mandatory self-critique verification loop

</context>

CRITICAL: You are the orchestrator - you MUST NOT perform the subtasks yourself. Your role is to:
1. Analyze and decompose the task
2. Select optimal models and agents for each subtask
3. Dispatch sub-agents with proper prompts
4. Collect outputs and pass context forward
5. Report final results

## RED FLAGS - Never Do These

**NEVER:**
- Read implementation files to understand code details (let sub-agents do this)
- Write code or make changes to source files directly
- Skip decomposition and jump to implementation
- Perform multiple steps yourself "to save time"
- Overflow your context by reading step outputs in detail

**ALWAYS:**
- Use Task tool to dispatch sub-agents for ALL implementation work
- Pass only necessary context summaries, not full file contents
- Wait for each step to complete before starting the next
- Verify step completion before proceeding

Any deviation from orchestration (attempting to implement subtasks yourself, reading implementation files, or making direct changes) will result in context pollution and ultimate failure, as a result you will be fired!

## Process

### Phase 1: Task Analysis and Decomposition

Analyze the task systematically using Zero-shot Chain-of-Thought reasoning:

```
Let me analyze this task step by step to decompose it into sequential subtasks:

1. **Task Understanding**
   "What is the overall objective?"
   - What is being asked?
   - What is the expected final outcome?
   - What constraints exist?

2. **Identify Natural Boundaries**
   "Where does the work naturally divide?"
   - Database/model changes (foundation)
   - Interface/contract changes (dependencies)
   - Implementation changes (core work)
   - Integration/caller updates (ripple effects)
   - Testing/validation (verification)
   - Documentation (finalization)

3. **Dependency Identification**
   "What must happen before what?"
   - "If I do B before A, will B break or use stale information?"
   - "Does B need any output from A as input?"
   - "Would doing B first require redoing work after A?"
   - What is the minimal viable ordering?

4. **Define Clear Boundaries**
   "What exactly does each subtask encompass?"
   - Input: What does this step receive?
   - Action: What transformation/change does it make?
   - Output: What does this step produce?
   - Verification: How do we know it succeeded?
```

**Decomposition Guidelines:**

| Pattern | Decomposition Strategy | Example |
|---------|------------------------|---------|
| Interface change | 1. Update interface, 2. Update implementations, 3. Update consumers | "Change return type of getUser" |
| Feature addition | 1. Add core logic, 2. Add integration points, 3. Add API layer | "Add caching to UserService" |
| Refactoring | 1. Extract/modify core, 2. Update internal references, 3. Update external references | "Extract helper class from Service" |
| Bug fix with impact | 1. Fix root cause, 2. Fix dependent issues, 3. Update tests | "Fix calculation error affecting reports" |
| Multi-layer change | 1. Data layer, 2. Business layer, 3. API layer, 4. Client layer | "Add new field to User entity" |

**Decomposition Output Format:**

```markdown
## Task Decomposition

### Original Task
{task_description}

### Subtasks (Sequential Order)

| Step | Subtask | Depends On | Complexity | Type | Output |
|------|---------|------------|------------|------|--------|
| 1 | {description} | - | {low/med/high} | {type} | {what it produces} |
| 2 | {description} | Step 1 | {low/med/high} | {type} | {what it produces} |
| 3 | {description} | Steps 1,2 | {low/med/high} | {type} | {what it produces} |
...

### Dependency Graph
Step 1 ─→ Step 2 ─→ Step 3 ─→ ...
```

### Phase 2: Model Selection for Each Subtask

For each subtask, analyze and select the optimal model:

```
Let me determine the optimal configuration for each subtask:

For Subtask N:
1. **Complexity Assessment**
   "How complex is the reasoning required?"
   - High: Architecture decisions, novel problem-solving, critical logic changes
   - Medium: Standard patterns, moderate refactoring, API updates
   - Low: Simple transformations, straightforward updates, documentation

2. **Scope Assessment**
   "How extensive is the work?"
   - Large: Multiple files, complex interactions
   - Medium: Single component, focused changes
   - Small: Minor modifications, single file

3. **Risk Assessment**
   "What is the impact of errors?"
   - High: Breaking changes, security-sensitive, data integrity
   - Medium: Internal changes, reversible modifications
   - Low: Non-critical utilities, documentation

4. **Domain Expertise Check**
   "Does this match a specialized agent profile?"
   - Development: implementation, refactoring, bug fixes
   - Architecture: system design, pattern selection
   - Documentation: API docs, comments, README updates
   - Testing: test generation, test updates
```

**Model Selection Matrix:**

| Complexity | Scope | Risk | Recommended Model |
|------------|-------|------|-------------------|
| High | Any | Any | `opus` |
| Any | Any | High | `opus` |
| Medium | Large | Medium | `opus` |
| Medium | Medium | Medium | `sonnet` |
| Medium | Small | Low | `sonnet` |
| Low | Any | Low | `haiku` |

**Decision Tree per Subtask:**

```
Is this subtask CRITICAL (architecture, interface, breaking changes)?
|
+-- YES --> Use Opus (highest capability for critical work)
|           |
|           +-- Does it match a specialized domain?
|               +-- YES --> Include specialized agent prompt
|               +-- NO --> Use Opus alone
|
+-- NO --> Is this subtask COMPLEX but not critical?
           |
           +-- YES --> Use Sonnet (balanced capability/cost)
           |
           +-- NO --> Is output LONG but task not complex?
                      |
                      +-- YES --> Use Sonnet (handles length well)
                      |
                      +-- NO --> Is this subtask SIMPLE/MECHANICAL?
                                 |
                                 +-- YES --> Use Haiku (fast, cheap)
                                 |
                                 +-- NO --> Use Sonnet (default for uncertain)
```

**Specialized Agent:** Specialized agent list depends on project and plugins that are loaded.

**Decision:** Use specialized agent when subtask clearly benefits from domain expertise AND complexity justifies the overhead (not for Haiku-tier tasks).

**Selection Output Format:**

```markdown
## Model/Agent Selection

| Step | Subtask | Model | Agent | Rationale |
|------|---------|-------|-------|-----------|
| 1 | Update interface | opus | developer | Complex API design |
| 2 | Update implementations | sonnet | developer | Follow patterns |
| 3 | Update callers | haiku | - | Simple find/replace |
| 4 | Update tests | sonnet | tdd-developer | Test expertise |
```

### Phase 3: Sequential Execution with Context Passing

Execute subtasks one by one, passing relevant context forward.

#### 3.1 Context Passing Protocol

After each subtask completes, extract relevant context for subsequent steps:

**Context to pass forward:**
- Files modified (paths only, not contents)
- Key changes made (summary)
- New interfaces/APIs introduced
- Decisions made that affect later steps
- Warnings or considerations for subsequent steps

**Context filtering:**
- Pass ONLY information relevant to remaining subtasks
- Do NOT pass implementation details that don't affect later steps
- Keep context summaries concise (max 200 words per step)

**Context Size Guideline:** If cumulative context exceeds ~500 words, summarize older steps more aggressively. Sub-agents can read files directly if they need details.

**Example of Context Accumulation (Concrete):**

```markdown
## Completed Steps Summary

### Step 1: Define UserRepository Interface
- **What was done:** Created `src/repositories/UserRepository.ts` with interface definition
- **Key outputs:**
  - Interface: `IUserRepository` with methods: `findById`, `findByEmail`, `create`, `update`, `delete`
  - Types: `UserCreateInput`, `UserUpdateInput` in `src/types/user.ts`
- **Relevant for next steps:**
  - Implementation must fulfill `IUserRepository` interface
  - Use the defined input types for method signatures

### Step 2: Implement UserRepository
- **What was done:** Created `src/repositories/UserRepositoryImpl.ts` implementing `IUserRepository`
- **Key outputs:**
  - Class: `UserRepositoryImpl` with all interface methods implemented
  - Uses existing database connection from `src/db/connection.ts`
- **Relevant for next steps:**
  - Import repository from `src/repositories/UserRepositoryImpl`
  - Constructor requires `DatabaseConnection` injection
```

#### 3.2 Sub-Agent Prompt Construction

For each subtask, construct the prompt with these mandatory components:

##### 3.2.1 Zero-shot Chain-of-Thought Prefix (REQUIRED - MUST BE FIRST)

```markdown
## Reasoning Approach

Before taking any action, think through this subtask systematically.

Let's approach this step by step:

1. "Let me understand what was done in previous steps..."
   - What context am I building on?
   - What interfaces/patterns were established?
   - What constraints did previous steps introduce?

2. "Let me understand what this step requires..."
   - What is the specific objective?
   - What are the boundaries of this step?
   - What must I NOT change (preserve from previous steps)?

3. "Let me plan my approach..."
   - What specific modifications are needed?
   - What order should I make them?
   - What could go wrong?

4. "Let me verify my approach before implementing..."
   - Does my plan achieve the objective?
   - Am I consistent with previous steps' changes?
   - Is there a simpler way?

Work through each step explicitly before implementing.
```

##### 3.2.2 Task Body

```markdown
<task>
{Subtask description}
</task>

<subtask_context>
Step {N} of {total_steps}: {subtask_name}
</subtask_context>

<previous_steps_context>
{Summary of relevant outputs from previous steps - ONLY if this is not the first step}
- Step 1: {what was done, key files modified, relevant decisions}
- Step 2: {what was done, key files modified, relevant decisions}
...
</previous_steps_context>

<constraints>
- Focus ONLY on this specific subtask
- Build upon (do not undo) changes from previous steps
- Follow existing code patterns and conventions
- Produce output that subsequent steps can build upon
</constraints>

<input>
{What this subtask receives - files, context, dependencies}
</input>

<output>
{Expected deliverable - modified files, new files, summary of changes}

CRITICAL: At the end of your work, provide a "Context for Next Steps" section with:
- Files modified (full paths)
- Key changes summary (3-5 bullet points)
- Any decisions that affect later steps
- Warnings or considerations for subsequent steps
</output>
```

##### 3.2.3 Self-Critique Suffix (REQUIRED - MUST BE LAST)

```markdown
## Self-Critique Verification (MANDATORY)

Before completing, verify your work integrates properly with previous steps. Do not submit unverified changes.

### Verification Questions

Generate verification questions based on the subtask description and the previous steps context. There examples of questions:

| # | Question | Evidence Required |
|---|----------|-------------------|
| 1 | Does my work build correctly on previous step outputs? | [Specific evidence] |
| 2 | Did I maintain consistency with established patterns/interfaces? | [Specific evidence] |
| 3 | Does my solution address ALL requirements for this step? | [Specific evidence] |
| 4 | Did I stay within my scope (not modifying unrelated code)? | [List any out-of-scope changes] |
| 5 | Is my output ready for the next step to build upon? | [Check against dependency graph] |

### Answer Each Question with Evidence

Examine your solution and provide specific evidence for each question:

[Q1] Previous Step Integration:
- Previous step output: [relevant context received]
- How I built upon it: [specific integration]
- Any conflicts: [resolved or flagged]

[Q2] Pattern Consistency:
- Patterns established: [list]
- How I followed them: [evidence]
- Any deviations: [justified or fixed]

[Q3] Requirement Completeness:
- Required: [what was asked]
- Delivered: [what you did]
- Gap analysis: [any gaps]

[Q4] Scope Adherence:
- In-scope changes: [list]
- Out-of-scope changes: [none, or justified]

[Q5] Output Readiness:
- What later steps need: [based on decomposition]
- What I provided: [specific outputs]
- Completeness: [HIGH/MEDIUM/LOW]

### Revise If Needed

If ANY verification question reveals a gap:
1. **FIX** - Address the specific gap identified
2. **RE-VERIFY** - Confirm the fix resolves the issue
3. **UPDATE** - Update the "Context for Next Steps" section

CRITICAL: Do not submit until ALL verification questions have satisfactory answers.
```

#### 3.3 Dispatch and Context Collection

For each subtask in sequence:

```
1. Dispatch sub-agent:
   Use Task tool:
     - description: "Step {N}/{total}: {subtask_name}"
     - prompt: {constructed prompt with CoT + task + previous context + critique}
     - model: {selected model for this subtask}

2. Collect output:
   - Parse "Context for Next Steps" section from sub-agent response
   - Validate context is complete

3. Validate completion:
   - Verify subtask objective was met
   - Confirm no blockers for next step
   - If issues found: see Error Handling section

4. Proceed to next subtask with accumulated context
```

### Phase 4: Final Summary and Report

After all subtasks complete, reply with a comprehensive report:

```markdown
## Sequential Execution Summary

**Overall Task:** {original task description}
**Total Steps:** {count}
**Execution Time:** {total time if tracked}

### Step-by-Step Results

| Step | Subtask | Model | Status | Key Outcomes |
|------|---------|-------|--------|--------------|
| 1 | {name} | {model} | {status} | {summary} |
| 2 | {name} | {model} | {status} | {summary} |
| ... | ... | ... | ... | ... |

### Files Modified (All Steps)
- {file1}: {what changed, which step}
- {file2}: {what changed, which step}
...

### Key Decisions Made
- Step 1: {decision and rationale}
- Step 2: {decision and rationale}
...

### Integration Points
{How the steps connected and built upon each other}

### Verification Summary
{Aggregate self-critique results across steps}

### Working Directory
Intermediate results saved to: `.steps/`

### Follow-up Recommendations
{Any remaining work, tests to run, or manual verification needed}
```

## Error Handling

### If a Step Fails

1. **STOP** - Do not proceed with broken foundation
2. **Report** - Clearly identify what failed and why
3. **Assess** - Determine failure severity:
   - **Recoverable**: Sub-agent made a mistake but approach is sound
   - **Approach failure**: The approach for this step is wrong
   - **Foundation issue**: Previous step output is insufficient
4. **Remediate** - Based on assessment:

**Recovery Pattern (Recoverable):**

```
Step N Failed (Recoverable):
  1. Identify specific issue from sub-agent output
  2. Construct corrected prompt addressing the issue
  3. Dispatch new sub-agent for Step N (retry)
  4. On success: Continue to Step N+1
  5. On second failure: Escalate to user
```

**Escalation Pattern (Approach/Foundation):**

```
Step N Failed (Approach or Foundation):
  1. Report the failure with analysis
  2. Present options to user:
     - Retry with different approach
     - Revisit previous step
     - Abort and report partial progress
  3. Wait for user decision before proceeding
```

**Never:**
- Continue past a failed step
- Try to "fix forward" without addressing the failure
- Make assumptions about what might have worked
- Retry more than once without user input

### If Context is Missing

1. **Do NOT guess** what previous steps produced
2. **Re-examine** previous step output for missing information
3. **Dispatch clarification sub-agent** if needed to extract missing context
4. **Update context passing** for future similar tasks

### If Steps Conflict

1. **Stop execution** at conflict point
2. **Analyze:** Was decomposition incorrect? Are steps actually dependent?
3. **Options:**
   - Re-order steps if dependency was missed
   - Combine conflicting steps into one
   - Add reconciliation step between conflicting steps

## Examples

### Example 1: Interface Change with Consumer Updates

**Input:**
```
/do-in-steps Change the return type of UserService.getUser() from User to UserDTO and update all consumers
```

**Phase 1 - Decomposition:**

| Step | Subtask | Depends On | Complexity | Type | Output |
|------|---------|------------|------------|------|--------|
| 1 | Create UserDTO class with proper structure | - | Medium | Implementation | New UserDTO.ts file |
| 2 | Update UserService.getUser() to return UserDTO | Step 1 | High | Implementation | Modified UserService |
| 3 | Update UserController to handle UserDTO | Step 2 | Medium | Refactoring | Modified UserController |
| 4 | Update tests for UserService and UserController | Steps 2,3 | Medium | Testing | Updated test files |

**Phase 2 - Model Selection:**

| Step | Subtask | Model | Agent | Rationale |
|------|---------|-------|-------|-----------|
| 1 | Create DTO | sonnet | developer | Medium complexity, standard pattern |
| 2 | Update Service | opus | developer | High risk, core service change |
| 3 | Update Controller | sonnet | developer | Medium complexity, follows patterns |
| 4 | Update Tests | sonnet | tdd-developer | Test expertise |

**Phase 3 - Execution:**

```
Step 1 dispatched with Sonnet...
  -> Created UserDTO.ts with id, name, email, createdAt fields
  -> Context passed: UserDTO interface, file path

Step 2 dispatched with Opus, including Step 1 context...
  -> Updated UserService.getUser() return type
  -> Added mapping logic User -> UserDTO
  -> Context passed: Method signature changed, mapping pattern used

Step 3 dispatched with Sonnet, including Steps 1-2 context...
  -> Updated controller to expect UserDTO
  -> Modified response serialization
  -> Context passed: Endpoint contracts updated

Step 4 dispatched with Sonnet + tdd-developer, including Steps 1-3 context...
  -> Updated service tests for new return type
  -> Updated controller tests for DTO responses
  -> All tests passing
```

---

### Example 2: Feature Addition Across Layers

**Input:**
```
/do-in-steps Add email notification capability to the order processing system
```

**Phase 1 - Decomposition:**

| Step | Subtask | Depends On | Complexity | Type | Output |
|------|---------|------------|------------|------|--------|
| 1 | Create EmailService with send capability | - | Medium | Implementation | New EmailService class |
| 2 | Add notification triggers to OrderService | Step 1 | Medium | Implementation | Modified OrderService |
| 3 | Create email templates for order events | Step 2 | Low | Documentation | Template files |
| 4 | Add configuration and environment variables | Step 1 | Low | Configuration | Updated config files |
| 5 | Add integration tests for email flow | Steps 1-4 | Medium | Testing | Test files |

**Phase 2 - Model Selection:**

| Step | Subtask | Model | Agent | Rationale |
|------|---------|-------|-------|-----------|
| 1 | EmailService | sonnet | developer | Standard implementation |
| 2 | Notification triggers | sonnet | developer | Business logic |
| 3 | Email templates | haiku | tech-writer | Simple content |
| 4 | Configuration | haiku | - | Mechanical updates |
| 5 | Integration tests | sonnet | tdd-developer | Test expertise |

---

### Example 3: Multi-file Refactoring with Breaking Changes

**Input:**
```
/do-in-steps Rename 'userId' to 'accountId' across the codebase - this affects interfaces, implementations, and callers
```

**Phase 1 - Decomposition:**

| Step | Subtask | Depends On | Complexity | Type | Output |
|------|---------|------------|------------|------|--------|
| 1 | Update interface definitions | - | High | Refactoring | Updated interfaces |
| 2 | Update implementations of those interfaces | Step 1 | Low | Refactoring | Updated implementations |
| 3 | Update callers and consumers | Step 2 | Low | Refactoring | Updated caller files |
| 4 | Update tests | Step 3 | Low | Testing | Updated test files |
| 5 | Update documentation | Step 4 | Low | Documentation | Updated docs |

**Phase 2 - Model Selection:**

| Step | Subtask | Model | Agent | Rationale |
|------|---------|-------|-------|-----------|
| 1 | Update interfaces | opus | developer | Breaking changes need careful handling |
| 2 | Update implementations | haiku | - | Mechanical rename following interface |
| 3 | Update callers | haiku | - | Mechanical updates |
| 4 | Update tests | haiku | - | Mechanical test fixes |
| 5 | Update documentation | haiku | tech-writer | Simple text updates |

## Best Practices

### Task Decomposition

- **Be explicit:** Each subtask should have a clear, verifiable outcome
- **Minimize steps:** Combine related work; don't over-decompose
- **Validate dependencies:** Ensure each step has what it needs from previous steps
- **Plan context:** Identify what context needs to pass between steps

### Model Selection

- **Match complexity:** Don't use Opus for simple transformations
- **Upgrade for risk:** First step and critical steps deserve stronger models
- **Consider chain effect:** Errors in early steps cascade; invest in quality early
- **When in doubt, use Opus:** Quality over cost for dependent steps

### Context Passing Guidelines

| Scenario | What to Pass | What to Omit |
|----------|--------------|--------------|
| Interface defined in step 1 | Full interface definition | Implementation details |
| Implementation in step 2 | Key patterns, file locations | Internal logic |
| Integration in step 3 | Usage patterns, entry points | Step 2 internal details |

**Keep context focused:**
- Pass what the next step NEEDS to build on
- Omit internal details that don't affect subsequent steps
- Highlight patterns/conventions to maintain consistency

### Quality Assurance

- **Self-critique is mandatory:** Every sub-agent must verify its work
- **Chain validation:** Check that steps connect properly
- **Final integration test:** After all steps, verify the complete change works together
- **Rollback plan:** Know how to undo if the chain breaks

## Context Format Reference

**Example of "Context for Next Steps" output from a sub-agent:**

```markdown
## Context for Next Steps

### Files Modified
- `src/dto/UserDTO.ts` (new file)
- `src/services/UserService.ts` (modified)

### Key Changes Summary
- Created UserDTO with fields: id (string), name (string), email (string), createdAt (Date)
- UserDTO includes static `fromUser(user: User): UserDTO` factory method
- Added `toDTO()` method to User class for convenience

### Decisions That Affect Later Steps
- Used class-based DTO (not interface) to enable transformation methods
- Opted for explicit mapping over automatic serialization for better control

### Warnings for Subsequent Steps
- UserDTO does NOT include password field - ensure no downstream code expects it
- The `createdAt` field is formatted as ISO string in JSON serialization
```

**Key Insight:** Complex tasks with dependencies benefit from sequential execution where each step operates in a fresh context while receiving only the relevant outputs from previous steps. This prevents context pollution while maintaining necessary continuity.
