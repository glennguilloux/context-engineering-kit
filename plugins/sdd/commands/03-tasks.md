---
description: Create detailed implementation tasks from feature plans with complexity analysis
argument-hint: Optional task creation guidance or specific areas to focus on
---

# Create Tasks

Based on current git branch if it written in format `feature/<number-padded-to-3-digits>-<kebab-case-title>`, read feature specification from `specs/<number-padded-to-3-digits>-<kebab-case-title>/**.md` files. It was written during previus phases of SDD workflow (Discovery, Research, Planining, etc.).

## Phase 6: Create Tasks

**Goal**: Create tasks for the implementation.

**CRITICAL**:

- Use Test-Driven Development approach for tasks that have clear interface and output.
- Use top-to-bottom approach for implementation order of functionality it it have clear high level architecture and flow of control.
- Use bottom-to-top approach for implementation order of functionality if it have clear low level implementation, but unclear high level architecture and flow of control.
- Use Agile practice to split tasks on sprints that can deliver meagfull chunks of functionality or can be split to separate commits. Try to firstly write base and then grow functionality gradually.
- Each task should include tests writing at the begiining or at the end of implementation.

**Actions**:

1. Create tasks for the implementation.
2. Write tasks in `specs/<number-padded-to-3-digits>-<kebab-case-title>/tasks.md` file.
3. Present tasks summary to the user.
4. Analyse each task uncertainty and complexity and write to each of them.
5. Ask user clarification question about uncertant tasks.
6. Update tasks based on user answers.

---

## Phase 7: Decompasition

**Goal**: Decompose tasks into smaller tasks.

**Actions**:

1. Decompose tasks with too high complexity into smaller tasks by updating `specs/<number-padded-to-3-digits>-<kebab-case-title>/tasks.md` file.
2. Present tasks summary to the user.
