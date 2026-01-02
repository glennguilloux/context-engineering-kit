---
description: Reorganize task implementation steps for maximum parallelization with explicit dependencies
argument-hint: Task ID (e.g., cek-673b) or 'latest' for most recent task
---

# Parallel Task Implementation Command

<task>
You are a task parallelization specialist. Analyze implementation steps in minibeads tasks and reorganize them for maximum parallel execution with explicit dependency tracking.
</task>

<context>
This command transforms sequential implementation plans into parallelized execution plans by:

1. Analyzing dependencies between implementation steps
2. Identifying steps that can execute in parallel
3. Adding explicit `Depends on:` and `Parallel with:` properties
4. Creating a visual dependency diagram
5. Grouping tightly coupled work into single steps
6. Using "MUST" language for parallel execution requirements
7. Assigning appropriate agent types based on output type and complexity
</context>

<workflow>

## Phase 1: Load and Understand Task

1. **Read the task file** to get full implementation process:

   ```bash
   Read .beads/issues/$TASK_ID.md
   ```

2. **Identify the Implementation Process section**:
   - Locate `## Implementation Process` or similar heading
   - List all current steps
   - Note any existing dependencies mentioned

## Phase 2: Analyze Step Dependencies

For each step, determine:

1. **Input requirements**:
   - What files/artifacts must exist before this step starts?
   - What information from previous steps is needed?

2. **Output artifacts**:
   - What does this step produce?
   - What files are created/modified?

3. **True dependencies vs. artificial sequencing**:
   - Does step B truly need step A's output?
   - Or were they just listed sequentially by habit?

4. **Identify parallel opportunities**:
   - Steps with the same dependencies can run in parallel
   - Independent utility work often parallelizes with main work

## Phase 3: Group Tightly Coupled Work

Identify steps that should be merged:

1. **Sync relationships**: If step A produces X and step B syncs X to Y, merge them
2. **Atomic operations**: Steps that must succeed together or fail together
3. **Same-file edits**: Multiple small edits to the same file → single step

**Example - Merge candidates:**

- "Update Plugin README" + "Sync Docs README from Plugin README" → Single step
- "Create config file" + "Update config file" → Single step

## Phase 4: Build Dependency Graph

Create a visual ASCII diagram showing:

```
Step 1 (Foundation)
    │
    ├─────────────────┬─────────────────┐
    ▼                 ▼                 ▼
Step 2a            Step 2b           Step 2c
(Can parallel)  (Can parallel)   (Can parallel)
    │                 │                 │
    └────────┬────────┘                 │
             ▼                          │
          Step 3                        │
     (Needs 2a, 2b)                     │
             │                          │
             └────────────┬─────────────┘
                          ▼
                       Step 4
                   (Needs 3, 2c)
```

**Diagram rules:**

- Vertical lines (│) show sequential dependency
- Horizontal branches (├──┬──┐) show parallel opportunities
- Merge points (└──┬──┘) show synchronization barriers

## Phase 5: Restructure Implementation Steps

Rewrite each step with:

### Step N: [Title]

**Agent:** [Agent type - see Agent Selection Guide below]
**Depends on:** [List of step numbers, or "None"]
**Parallel with:** [List of step numbers that share same dependencies]
**Note:** [If contains parallelizable sub-tasks] Individual [items] MUST be [action] in parallel by multiple agents

[Step description]

#### Expected Output

- [Artifact 1]
- [Artifact 2]

#### Success Criteria

- [Criterion 1]
- [Criterion 2]

---

**Important:**

- Use "MUST be done in parallel" not "can be done in parallel"
- Be explicit about what enables parallelization
- Add tables for sub-tasks that parallelize:

| Sub-task | Description | Agent | Can Parallel |
|----------|-------------|-------|--------------|
| task-1   | Description | opus | Yes |
| task-2   | Description | opus | Yes |

## Phase 6: Update Task File

**Use Write tool to modify the task file directly**:

1. **Preserve everything before Implementation Process**
2. **Add execution directive** (EXACTLY this text, right after `## Implementation Process` heading):

   ```
   You MUST launch for each step separate agent, instead of performing all steps by self. And for each step that mentioned as parallel, you MUST launch separate agents in parallel.

   **CRITICAL:** For each agent you MUST:
   1. Use the **Agent** type specified in the step (e.g., `haiku`, `sonnet`, `sdd:tech-writer`)
   2. Provide path to task file and prompt which step to implement
   3. Require agent to implement exactly that step, not more, not less, not other steps
   ```

3. **Add Parallelization Overview diagram**
4. **Rewrite steps with dependency properties**
5. **Add horizontal rules (---) between steps for clarity**
6. **Preserve everything after Implementation Process** (Blockers, Notes, etc.)

</workflow>

<parallelization_principles>

## Key Principles

### 0. Sub-Agent Execution (CRITICAL)

You MUST launch for each step separate agent, instead of performing all steps by self. And for each step that mentioned as parallel, you MUST launch separate agents in parallel.

**Agent type selection:**
- Documentation output → `sdd:tech-writer`
- Source code output → `sdd:developer`
- Trivial/mechanical operations → `haiku`
- High-volume, simple pattern work → `sonnet`
- Everything else (default) → `opus`

This directive MUST be added to every parallelized task file, right after the `## Implementation Process` heading.

### 1. High-Level Structure First

Create orchestrating files (workflow commands, main configs) BEFORE detail files (tasks, sub-configs). This establishes the skeleton that parallel workers fill in.

### 2. Same-Dependency Parallelization

Steps that depend on the same prerequisite(s) MUST run in parallel:

```
Step 1 (create directories)
    │
    ├──────────┬──────────┐
    ▼          ▼          ▼

Step 2a     Step 2b    Step 3

(agent)    (workflow)  (utils)
```

### 3. Merge Tightly Coupled Steps

If Step A's output is immediately consumed by Step B with no other consumers, consider merging:

- ❌ Step 6a: Update plugin README
- ❌ Step 6b: Sync docs README from plugin README  
- ✅ Step 6a: Update plugin README + sync to docs README

### 4. Sub-task Parallelization

When a step contains multiple independent items, make parallelization explicit:

**Note:** Individual task files MUST be created in parallel by multiple agents

### 5. Dependency Notation

- `Depends on: None` - Can start immediately
- `Depends on: Step 1` - Single dependency
- `Depends on: Step 2a, Step 2b` - Multiple dependencies (waits for ALL)
- `Parallel with: Step 2b, Step 3` - Same dependencies, run together

</parallelization_principles>

<agent_selection>

## Agent Selection Guide

### Selection Principle: OUTPUT TYPE DETERMINES AGENT

Choose agent STRICTLY based on what the step produces, NOT what it reads or analyzes.

### Specialized Agents (USE ONLY WHEN OUTPUT EXACTLY MATCHES)

| Agent | ONLY Use When Output Is | NEVER Use For |
|-------|------------------------|---------------|
| `sdd:tech-writer` | Documentation files (README, guides, .md docs) | Code, configs, analysis |
| `sdd:developer` | Source code, implementation files | Docs, configs, planning |
| `sdd:software-architect` | Architecture plans, design documents | Implementation, docs |
| `sdd:tech-lead` | Task breakdowns, technical specifications | Code, docs |
| `sdd:business-analyst` | Requirements documents, user stories | Code, technical docs |
| `sdd:researcher` | Research reports, technology evaluations | Code, implementation |
| `sdd:code-explorer` | Codebase analysis reports | Code changes, docs |
| `code-review:code-reviewer` | Code review feedback | Code changes |
| `code-review:bug-hunter` | Bug analysis reports | Bug fixes (code) |
| `judge` | Evaluation scores, verification results | Any implementation |

### General Agents (USE FOR EVERYTHING ELSE)

| Agent | When to Use | Examples |
|-------|-------------|----------|
| `opus` | **Default/standard choice**. Safe for any task. Use when correctness matters, decisions are nuanced, or you're unsure. | Most implementation, code writing, complex logic, architectural decisions |
| `sonnet` | Task is **not complex but high volume** - many similar steps, large context to process, repetitive work. | Bulk file updates, processing many similar items, large refactoring with clear patterns |
| `haiku` | **Trivial operations only**. Simple, mechanical tasks with no decision-making. | Directory creation, file deletion, simple config edits, file copying/moving |

### Decision Flow

```
1. What is the PRIMARY OUTPUT of this step?
   │
   ├─► Documentation (.md, README, guides)
   │   └─► sdd:tech-writer
   │
   ├─► Source code implementation
   │   └─► sdd:developer
   │
   ├─► Architecture/design document
   │   └─► sdd:software-architect
   │
   ├─► Task breakdown/specs
   │   └─► sdd:tech-lead
   │
   ├─► Requirements/user stories
   │   └─► sdd:business-analyst
   │
   ├─► Research/evaluation report
   │   └─► sdd:researcher
   │
   ├─► Code review feedback
   │   └─► code-review:code-reviewer
   │
   ├─► Verification/evaluation
   │   └─► judge
   │
   └─► Mixed/Other outputs
       │
       └─► Is it trivial/mechanical?
           │
           ├─► YES (no decisions, just file ops) → haiku
           │
           └─► NO → Is it high-volume but simple pattern?
               │
               ├─► YES (many similar items, bulk work) → sonnet
               │
               └─► NO or UNSURE → opus (default)
```

### Common Mistakes to AVOID

| Wrong | Why | Correct |
|-------|-----|---------|
| `sdd:tech-writer` for updating plugin.json | JSON config is NOT documentation | `haiku` or `opus` |
| `sdd:developer` for writing README | README is documentation | `sdd:tech-writer` |
| `sonnet` for complex decisions | Sonnet is for volume, not complexity | `opus` |
| `haiku` for anything requiring judgment | Haiku is for mechanical tasks only | `opus` |
| `sdd:code-explorer` for fixing bugs | Explorer analyzes, doesn't implement | `sdd:developer` |
| `sdd:researcher` for writing code | Researcher researches, doesn't code | `sdd:developer` |
| `judge` for implementing features | Judge evaluates, doesn't implement | `sdd:developer` or `opus` |

### Examples by Step Type

| Step Type | Output | Agent | Rationale |
|-----------|--------|-------|-----------|
| Create directories | Folders | `haiku` | Trivial, mechanical |
| Create single config file | JSON/YAML | `haiku` | Simple, no decisions |
| Write utility function | Code | `sdd:developer` | Source code output |
| Write complex algorithm | Code | `sdd:developer` | Source code output |
| Update README | Documentation | `sdd:tech-writer` | Documentation output |
| Write API docs | Documentation | `sdd:tech-writer` | Documentation output |
| Update manifest | JSON config | `opus` | Requires understanding structure |
| Refactor architecture | Code | `opus` | Complex decisions |
| Create workflow command | Markdown command | `opus` | Requires careful design |
| Clean up old files | File deletions | `haiku` | Trivial, mechanical |
| Sync/copy files | Copy operations | `haiku` | Trivial, mechanical |
| Update 10+ similar files | Bulk edits | `sonnet` | High volume, simple pattern |
| Process large codebase | Many files | `sonnet` | High context, repetitive |

</agent_selection>

<common_patterns>

## Common Parallelization Patterns

### Pattern 1: Directory Setup → Parallel File Creation

```
Step 1: Create directories
    │
    ├──────────┬──────────┐
    ▼          ▼          ▼

Step 2a     Step 2b     Step 3
(agents)  (commands)   (utils)
```

### Pattern 2: Definition → Implementation → Manifest

```
Step 2a + 2b (definitions, parallel)
    │
    ▼
Step 3 (implementations using definitions)
    │

    ▼
Step 4 (manifest referencing all)
```

### Pattern 3: Implementation → Documentation → Cleanup

```
Step 4 (all implementations)
    │
    ├──────────┬
    ▼          ▼
Step 5a     Step 5b
(README)   (other docs)
    │          │
    └────┬─────┘
         ▼

      Step 6

    (cleanup)
```

### Pattern 4: Independent Utility Work

Utility/maintenance work often has minimal dependencies:

```
Step 1
    │
    ├──────────┬──────────┐
    ▼          ▼          ▼
Step 2      Step 3      Step 4
(main)     (main)    (utilities)
    │          │          │
    └────┬─────┘          │
         │                │
         └───────┬────────┘
                 ▼
              Step 5
```

</common_patterns>

<checklist>
Before completing parallelization:

- [ ] **Sub-agent execution directive added** (exact text after `## Implementation Process`)
- [ ] **All steps have `Agent:` property** (following Agent Selection Guide)
- [ ] **All steps have `Depends on:` property**
- [ ] **Parallel opportunities identified with `Parallel with:`**
- [ ] **Visual dependency diagram added**
- [ ] **"MUST" used for parallel execution requirements** (not "can")
- [ ] **Tightly coupled steps merged** (no artificial splitting)
- [ ] **Sub-task tables include `Agent` and `Can Parallel` columns**
- [ ] **High-level structure steps come before detail steps**
- [ ] **Horizontal rules (---) separate steps**
- [ ] **Agent selection verified**: specialized agents ONLY for exact output matches, general agents by complexity
</checklist>

<example_session>
User: /parallel-task-implementation cek-31ce

**Phase 1: Loading task...**

```bash
mb show cek-31ce
```

Task: "Reorganize FPF plugin using workflow command pattern"

**Phase 2: Analyzing dependencies...**

Current steps (sequential):

1. Create Directory Structure
2. Create FPF Agent Definition
3. Create Task Files
4. Create propose-hypotheses Workflow Command
5. Rename and Simplify Utility Commands
6. Update Plugin Manifest
7. Update Documentation
8. Clean Up Old Commands

*Analyzing true dependencies...*

- Step 2 (Agent) needs: directories (Step 1)
- Step 3 (Tasks) needs: agent definition (Step 2), workflow structure (Step 4)
- Step 4 (Workflow) needs: directories (Step 1) ← NOT agent!
- Step 5 (Utils) needs: directories (Step 1) ← Independent!

*Identifying false dependencies...*

- Steps 2, 4, 5 all only depend on Step 1 → CAN PARALLEL
- Step 4 was listed after Step 3, but Step 3 depends on Step 4!

**Phase 3: Grouping tightly coupled work...**

- "Update Plugin README" + "Sync Docs README" → Merge into single step
- Step 6b and 6c shared same dependency → Consider merging if related

**Phase 4: Building dependency graph with agents...**

```
Step 1 (Directory Structure) [haiku]
    │
    ├───────────────────┬───────────────────┐
    ▼                   ▼                   ▼
Step 2a              Step 2b             Step 3
(FPF Agent)     (Workflow Command)   (Utility Commands)
[opus]              [opus]              [opus]
    │                   │                   │
    └─────────┬─────────┘                   │
              ▼                             │
           Step 4                           │
       (Task Files)                         │
         [opus]                             │
              │                             │
              └─────────────┬───────────────┘
                            ▼
                         Step 5
                    (Plugin Manifest)
                        [opus]
                            │
    ┌───────────────────────┼
    ▼                       ▼
Step 6a                  Step 6b
(Plugin README)      (Other Docs)
[sdd:tech-writer]   [sdd:tech-writer]
    │                       │
    └───────────────────────┴
                            │
                            ▼
                         Step 7
                    (Clean Up Old Commands)
                        [haiku]
```

*Agent selection rationale:*
- Step 1: `haiku` - Trivial directory creation (mechanical)
- Steps 2a, 2b, 3, 4: `opus` - Require careful design decisions (default)
- Step 5: `opus` - Manifest requires understanding structure
- Steps 6a, 6b: `sdd:tech-writer` - Documentation files (README.md)
- Step 7: `haiku` - Trivial file deletions (mechanical)

**Phase 5: Restructuring steps...**

Key changes:

- Workflow Command (2b) moved BEFORE Task Files
- Agent (2a) and Workflow (2b) now parallel
- Utility Commands (3) parallel with 2a, 2b
- Task Files now correctly depends on 2a AND 2b

- Documentation split into README (6a) + Other Docs (6b)
- Added "MUST be done in parallel" for sub-tasks

**Phase 6: Updating task file...**

Task updated with:

- Sub-agent execution directive added after `## Implementation Process`
- Parallelization Overview diagram (with agent types)
- 7 main steps (was 8, merged docs)
- Explicit `Agent:` for each step (following selection guide)
- Explicit `Depends on:` for each step
- `Parallel with:` annotations
- "MUST" language for parallel execution

*Agent distribution:*
- `haiku`: 2 steps (trivial/mechanical)
- `opus`: 5 steps (default, requires decisions)
- `sdd:tech-writer`: 2 steps (documentation)
- `sonnet`: 0 steps (no high-volume repetitive work)

</example_session>

<output>
After parallelization, report:

1. **Task Updated**: $TASK_ID
2. **Steps Reorganized**: X steps (from Y original)
3. **Steps Merged**: X steps combined
4. **Max Parallelization Depth**: X steps can run simultaneously at peak
5. **Agent Distribution**:
   - `opus`: X steps (default)
   - `sonnet`: X steps (high-volume)
   - `haiku`: X steps (trivial)
   - `sdd:tech-writer`: X steps (docs)
   - `sdd:developer`: X steps (code)
   - [other specialized agents if used]

Suggest: `mb show $TASK_ID` to review the parallelized task
</output>
