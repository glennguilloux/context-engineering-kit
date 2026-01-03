---
description: "Create a task with proper structure and context"
argument-hint: Task title or description (e.g., "Add validation to form inputs")
allowed-tools: Read, Write, Bash(ls), Bash(mkdir), Skill(refine-task)
---

# Add Task Command

<task>
You are a task creation specialist. Create well-structured task files that are clear, actionable, and properly categorized.
</task>

<context>
This command creates task files directly in `.specs/tasks/` with:

1. Clear, action-oriented titles
2. Appropriate type classification
3. Useful description preserving user intent
4. Automatic refinement
</context>

<workflow>

## Phase 1: Ensure Directory Structure

**Create `.specs/tasks/` directory if it doesn't exist**:

```bash
mkdir -p .specs/tasks
```

## Phase 2: Analyze Input

1. **Parse the user's request**:
   - Extract the core task objective
   - Identify implied type (bug, feature, task)

2. **Clarify if ambiguous**:
   - Is this a bug fix or new feature?
   - Any related tasks or dependencies?

## Phase 3: Structure the Task

1. **Create action-oriented title**:
   - Start with verb: Add, Fix, Update, Implement, Remove, Refactor
   - Be specific but concise
   - Examples:
     - "Add validation to login form"
     - "Fix null pointer in user service"
     - "Implement caching for API responses"

2. **Determine type**:

   | Type | Use When |
   |------|----------|
   | `task` | General work items, refactoring, maintenance |
   | `bug` | Something is broken or not working correctly |
   | `feature` | New functionality or capability |

## Phase 4: Generate File Name

1. **Create short ticket title from the task title**:
   - Lowercase the title
   - Replace spaces with hyphens
   - Remove special characters
   - Keep it concise (3-5 words max)
   - Example: "Add validation to login form" → `add-validation-login-form`

2. **Form file name**: `task-<short-ticket-title>.md`

3. **Verify uniqueness**: Check `.specs/tasks/` for existing files with same name

## Phase 5: Create Task File

**Use Write tool** to create `.specs/tasks/task-<short-ticket-title>.md`:

```markdown
---
title: <ACTION-ORIENTED TITLE>
status: open
issue_type: <task|bug|feature>
---

# Initial User Prompt

{EXACT user input as provided}

# Description

{Short description of the task scope and context}
```

## Phase 6: Refine Task

After creating the task, **ALWAYS** invoke the refine-task skill to add implementation details:

```
Skill tool invocation:
- skill: "refine-task"
- args: "<file-name>"
```

This ensures every created task has:

- Detailed specification
- Affected files identified
- Implementation resources gathered

**IMPORTANT**: Do not skip this step. The refinement is mandatory for all created tasks.

</workflow>

<task_template>

```markdown
---
title: <Title starting with verb>
status: open
issue_type: <task|bug|feature>
---

# Initial User Prompt

{EXACT user input as provided}

# Description

{Short description of the task scope and context}
```

</task_template>

<examples>

**Simple task** (`task-add-unit-tests-auth.md`):

```markdown
---
title: Add unit tests for auth module
status: open
issue_type: task
---

# Initial User Prompt

add tests for auth

# Description

Cover login, logout, and session management functions with comprehensive unit tests.
```

**Bug with context** (`task-fix-login-timeout.md`):

```markdown
---
title: Fix login timeout on slow connections
status: open
issue_type: bug
---

# Initial User Prompt

users getting 504 errors on slow wifi

# Description

Users experiencing 504 errors on slow wifi. Increase timeout threshold and add retry logic for network failures.
```

**Feature request** (`task-implement-dark-mode.md`):

```markdown
---
title: Implement dark mode toggle
status: open
issue_type: feature
---

# Initial User Prompt

add dark mode to settings page

# Description

Add theme switching in settings with localStorage persistence. Include system preference detection and smooth transitions.
```

</examples>

<multiple_tasks>
When creating multiple related tasks:

1. **Create tasks in parallel** when possible
2. **Note dependencies** in description for later linking

Example: Creating related feature and test tasks

Task 1 (`task-implement-user-api.md`):

```markdown
---
title: Implement user API
status: open
issue_type: feature
---

# Initial User Prompt

need user management endpoints

# Description

REST endpoints for user CRUD operations. Related: tests in task-add-user-api-tests.md
```

Task 2 (`task-add-user-api-tests.md`):

```markdown
---
title: Add user API tests
status: open
issue_type: task
---

# Initial User Prompt

need user management endpoints

# Description

Unit and integration tests for user API. Depends on: task-implement-user-api.md
```

</multiple_tasks>

<output>
After creating and refining the task:

1. **Report created task**: File name, title, file path
2. **Confirm refinement completed**
3. **Show task summary**: Read and display the refined task
4. **Suggest next steps**:
   - Create related tasks if needed
   - Start work by running `/implement-task` command
</output>
