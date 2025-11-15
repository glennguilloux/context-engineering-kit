---
description: Plan the feature development based on the feature specification. 
argument-hint: Plan specifics suggestions
---

# Plan Feature Development

Guided feature development with codebase understanding and architecture focus.

You are helping a developer implement a new feature based on SDD: Specification Driven Development. Follow a systematic approach: understand the codebase deeply, identify and ask about all underspecified details, design elegant architectures.

Based on current git branch if it written in format `feature/<number-padded-to-3-digits>-<kebab-case-title>`, read feature specification from `specs/<number-padded-to-3-digits>-<kebab-case-title>/spec.md` file. It was written during 1 phase of SDD workflow (Discovery/Specification Design).

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Get the current git branch, if it written in format `feature/<number-padded-to-3-digits>-<kebab-case-title>`, part after `feature/` is defined as FEATURE_NAME. Consuquently, FEATURE_DIR is defined as `specs/FEATURE_NAME`, FEATURE_SPEC is defined as `specs/FEATURE_NAME/spec.md`, IMPL_PLAN is defined as `specs/FEATURE_NAME/plan.md`, SPECS_DIR is defined as `specs/`. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load context**: Read FEATURE_SPEC and `specs/constitution.md`. Copy `specs/templates/plan-template.md` to IMPL_PLAN using `cp` command.

3. **Execute plan workflow**: Follow the structure in IMPL_PLAN template to:
   - Fill Technical Context (mark unknowns as "NEEDS CLARIFICATION")
   - Fill Constitution Check section from constitution
   - Evaluate gates (ERROR if violations unjustified)
   - Phase 2-3: Generate research.md (resolve all NEEDS CLARIFICATION)
   - Phase 4: Design architecture
   - Phase 5: Generate data-model.md, contract.md, plan.md
   - Re-evaluate Constitution Check post-design

4. **Stop and report**: Command ends after Phase 5 planning. Report branch, IMPL_PLAN path, and generated artifacts.

## Phase 2: Research & Codebase Exploration

**Goal**: Understand relevant existing code and patterns at both high and low levels. Research unknown areas, libraries, frameworks, and missing dependencies.

### Actions

**Technical Context**:

1. **Extract unknowns from Technical Context** above:
   - For each NEEDS CLARIFICATION → research task
   - For each dependency → best practices task
   - For each integration → patterns task
2. **Generate and dispatch research agents**:

   ```text
   For each unknown in Technical Context:
     Task: "Research {unknown} for {feature context}"
   For each technology choice:
     Task: "Find best practices for {tech} in {domain}"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen]
   - Alternatives considered: [what else evaluated]

**Codebase Exploration**:

1. For code explaration launch 2-3 code-explorer agents in parallel. Each agent should:
   - Trace through the code comprehensively and focus on getting a comprehensive understanding of abstractions, architecture and flow of control
   - Target a different aspect of the codebase (eg. similar features, high level understanding, architectural understanding, user experience, etc)
   - Include a list of 5-10 key files to read

   **Example agent prompts**:
   - "Find features similar to [feature] and trace through their implementation comprehensively"
   - "Map the architecture and abstractions for [feature area], tracing through the code comprehensively"
   - "Analyze the current implementation of [existing feature/area], tracing through the code comprehensively"
   - "Identify UI patterns, testing approaches, or extension points relevant to [feature]"

2. Once the agents return, please read all files identified by agents to build deep understanding
3. Update research report in `FEATURE_DIR/research.md` file with all findings and set links to relevant files.
4. Present comprehensive summary of findings and patterns discovered to user.

---

## Phase 3: Clarifying Questions

**Goal**: Fill in gaps and resolve all ambiguities before designing

**CRITICAL**: This is one of the most important phases. DO NOT SKIP.

**Actions**:

1. Review the codebase findings and original feature request
2. Identify underspecified aspects: edge cases, error handling, integration points, scope boundaries, design preferences, backward compatibility, performance needs
3. **Present all questions to the user in a clear, organized list**
4. **Wait for answers before proceeding to architecture design**

If the user says "whatever you think is best", provide your recommendation and set it as a assumed decision in `research.md` file.

### Output

`research.md` with all NEEDS CLARIFICATION resolved and links to relevant files.

---

## Phase 4: Architecture Design

**Prerequisites:** `research.md` complete

**Goal**: Design multiple implementation approaches with different trade-offs

**CRITICAL**: Do not write code during this phase, use only high level planing and architecture diagrams.

**Actions**:

1. Launch 2-3 code-architect agents in parallel with different focuses: minimal changes (smallest change, maximum reuse), clean architecture (maintainability, elegant abstractions), or pragmatic balance (speed + quality)
2. Review all approaches and form your opinion on which fits best for this specific task (consider: small fix vs large feature, urgency, complexity, team context)
3. Write architecture design doc in `FEATURE_DIR/design.md` file. Include all found approaches, trade-offs comparison, **your recommendation with reasoning** and concrete implementation differences.
4. Present to user: brief summary of each approach, trade-offs comparison, **your recommendation with reasoning**, concrete implementation differences
5. **Ask user which approach they prefer**

## Phase 5: Plan

**Goal**: Plan the implementation based on approach choosen by the user and clarify all unclear or uncertain areas.

**CRITICAL**: Do not write code during this phase, use only high level planing and architecture diagrams.

**Actions**:

1. Based on approach choosen by the user, plan the implementation.
2. Write implementation plan in `FEATURE_DIR/plan.md` file.
3. **Extract entities from feature spec** → `FEATURE_DIR/data-model.md`:
   - Entity name, fields, relationships
   - Validation rules from requirements
   - State transitions if applicable
4. **Generate API contracts** from functional requirements if it applicable:
   - For each user action → endpoint
   - Use standard REST/GraphQL patterns
   - Output OpenAPI/GraphQL schema to `FEATURE_DIR/contract.md`
5. Present implementation plan summary to the user.
6. Review implementation plan and present unclear or unceartan areas to the user for clarification.

**Output**: data-model.md, contract.md, plan.md

## Key rules

- Use absolute paths
- ERROR on gate failures or unresolved clarifications
