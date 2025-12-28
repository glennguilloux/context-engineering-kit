---
description: "Initialize FPF Context"
pre: "none"
post: ".fpf/ directory exists AND context recorded"
invariant: "initialization is idempotent"
---

# Phase 0: Initialization

You are the **Initializer** operating as a **state machine executor**. Your goal is to establish the **Bounded Context (A.1.1)** for this reasoning session.

## Enforcement Model

**Execution is IMPOSSIBLE without creating the required files and directories.** Prose descriptions of initialization do not modify state.

| Precondition | Action | Postcondition |
|--------------|--------|---------------|
| none | Create `.fpf/` structure | Directory scaffold exists |
| `.fpf/` exists | Create `context.md` | Bounded context populated |

**RFC 2119 Bindings:**
- You MUST create the `.fpf/` directory structure before any other FPF operations
- You MUST create `context.md` after analyzing the project
- You SHALL NOT proceed to Phase 1 without recorded context
- File creation is MANDATORY — stating "I initialized the context" without creating files is a protocol violation

**If you skip file creation:** State remains unchanged. Subsequent phases will fail precondition checks.

## Invalid Behaviors

- Claiming "context established" without creating `.fpf/context.md`
- Proceeding to `/q1-hypothesize` without completing initialization
- Skipping directory creation

## Method (Design-Time)

1. **Bootstrapping:** Create the `.fpf/` directory structure if it doesn't exist.
2. **Context Scanning:** Analyze the current project directory to understand the tech stack, existing constraints, and domain.
3. **Context Definition:** Define the `U.BoundedContext` for this session.
4. **Recording:** Create `context.md` to save this context.

## Action (Run-Time)

Execute the method above. Look at the file system. Read `README.md` or `package.json` / `go.mod` if needed. Then initialize the FPF state.

### Step 1: Create Directory Structure

Create the following directories under `.fpf/`:

```
.fpf/
├── evidence/           # Stores evidence files from validation
├── decisions/          # Stores Design Rationale Records (DRR)
├── sessions/           # Stores loopback session logs
├── knowledge/
│   ├── L0/             # Proposed hypotheses (unverified)
│   ├── L1/             # Verified hypotheses (logically sound)
│   ├── L2/             # Validated hypotheses (empirically confirmed)
│   └── invalid/        # Rejected hypotheses
└── agents/             # Role-specific agent profiles
```

Create `.gitkeep` files in each directory to ensure they are tracked by git:

```bash
mkdir -p .fpf/{evidence,decisions,sessions,knowledge/{L0,L1,L2,invalid},agents}
touch .fpf/{evidence,decisions,sessions,knowledge/{L0,L1,L2,invalid},agents}/.gitkeep
```

### Step 2: Record Context

After analyzing the project, create `.fpf/context.md` with the following structure:

```markdown
# Bounded Context

## Vocabulary

- **Term1**: Definition of the first key domain term
- **Term2**: Definition of the second key domain term
- ...

## Invariants

1. First system-wide rule or constraint
2. Second system-wide rule or constraint
3. ...
```

**Vocabulary Guidelines:**
- List key domain terms and their definitions
- Format: `- **Term**: Definition`
- Example: `- **User**: A registered customer with an account`

**Invariants Guidelines:**
- List system-wide rules or constraints that must not be broken
- These are hard requirements that apply to all hypotheses
- Example: "Must use PostgreSQL", "No circular dependencies", "Latency < 100ms"

## Example Context File

```markdown
# Bounded Context

## Vocabulary

- **User**: A registered customer with an account
- **Order**: A purchase intent containing one or more items
- **Cart**: Temporary storage for items before checkout

## Invariants

1. All API responses must complete within 100ms
2. User data must be encrypted at rest
3. No direct database access from frontend
4. Must support horizontal scaling
```

## Checkpoint

Before proceeding to Phase 1, verify:
- [ ] Created `.fpf/` directory structure with all subdirectories
- [ ] Created `.gitkeep` files in each directory
- [ ] Created `.fpf/context.md` with vocabulary and invariants
- [ ] Context reflects actual project constraints

**If any checkbox is unchecked, you MUST complete it before proceeding.**
