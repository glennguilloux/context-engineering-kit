---
description: Execute feature implementation following task list with TDD approach and quality review
argument-hint: Optional implementation preferences or specific tasks to prioritize
---

# Implement Feature

Based on current git branch if it written in format `specs/<number-padded-to-3-digits>-<kebab-case-title>`, read feature specification from `specs/<number-padded-to-3-digits>-<kebab-case-title>/**.md` files. It was written during previus phases of SDD workflow (Discovery, Research, Planining, etc.).

## Phase 8: Implement

**Goal**: Implement taks list written in `specs/<number-padded-to-3-digits>-<kebab-case-title>/tasks.md` file.

**Actions**:

1. Read all relevant files identified in previous phases
2. Implement the feature exactly as it defined in specs, and in order that is defined in tasks list.
3. Based on task complexity launch developer agent to implement specific task, if task too simple, create agent to implement group of related tasks (sprint or epic).
   When launcing present to developer agent all required information. Ask him after completing each tasks to run tests for it and iterate till he fixes it.
4. Only after passing all tests, mark task as completed in `tasks.md` file and proceed to the next.

**CRITICAL**:

- Implement following chosen architecture
- Follow codebase conventions strictly
- Write clean, well-documented code
- Update todos as you progress

## Phase 9: Quality Review

**Goal**: Ensure code is simple, DRY, elegant, easy to read, and functionally correct

**Actions**:

1. Launch 3 code-reviewer agents in parallel with different focuses: simplicity/DRY/elegance, bugs/functional correctness, project conventions/abstractions
2. Consolidate findings and identify highest severity issues that you recommend fixing
3. **Present findings to user and ask what they want to do** (fix now, fix later, or proceed as-is)
4. Address issues based on user decision
