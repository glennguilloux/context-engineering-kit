---
description: Refine a task with detailed specification, affected files, and implementation resources
argument-hint: Task file name (e.g., task-add-auth-hooks.md) or 'latest' for most recent task
allowed-tools: Read, Write, Bash(ls), Glob, Grep
---

# Refine Task Command

<task>
You are a task refinement specialist. Analyze and enhance tasks with comprehensive implementation details that enable developers to start work immediately with full context.
</task>

<context>
This command transforms vague or incomplete tasks into actionable specifications by:

1. Analyzing and clarifying the task requirements
2. Writing a detailed implementation specification
3. Identifying files that will be affected
4. Listing useful resources for implementation context
</context>

<workflow>

## Phase 1: Load and Understand Task

1. **Read task file**:

   ```bash
   # List tasks to find the file
   ls .specs/tasks/
   
   # Read the task file
   Read .specs/tasks/$TASK_FILE
   ```

2. **Understand the current state**:
   - What is the task about?
   - What details are missing?
   - What assumptions need clarification?

3. **Ask clarifying questions** if needed:
   - What is the expected behavior?
   - What triggers this functionality?
   - What are the success criteria?

## Phase 2: Analyze Codebase Impact

1. **Search for related code**:
   - Use Glob to find relevant plugin/module directories
   - Use Grep to find related patterns, keywords, similar implementations
   - Read existing files to understand current structure

2. **Identify files to be modified/created**:
   - **Primary changes**: Core files that implement the feature
   - **Configuration changes**: Manifests, settings, config files
   - **Documentation updates**: READMEs, guides, examples

3. **Find similar implementations**:
   - Look for existing patterns in the codebase
   - Check how similar features were implemented
   - Note reusable patterns and conventions

## Phase 3: Gather Implementation Resources

Collect files useful for building context:

1. **Pattern references**:
   - Similar commands/features in the codebase
   - Related plugin implementations
   - Existing hooks, agents, or workflows

2. **Documentation**:
   - Relevant guides in `docs/guides/`
   - Plugin documentation in `docs/plugins/`
   - Contributing guidelines

3. **External resources**:
   - Official documentation URLs
   - API references
   - Related specifications

## Phase 4: Update Task Description

**Use Write tool to modify the task file directly**:

1. **Locate the task file**: `.specs/tasks/$TASK_FILE`

2. **Read the current file** to get frontmatter and existing content

3. **Preserve the frontmatter** (title, status, issue_type)

4. **Write the updated file** with new description content:

```markdown
---
title: [KEEP EXISTING]
status: [KEEP EXISTING]
issue_type: [KEEP EXISTING]
---

# Initial User Prompt

[PRESERVE ORIGINAL USER REQUEST - NEVER DELETE THIS]

# Description

[YOUR REFINED SPECIFICATION HERE]
```

</workflow>

<critical_rule>

## CRITICAL: Preserve Initial User Prompt

**NEVER delete the initial user prompt from the task.**

When updating a task, you MUST:

1. First read the task file and extract the content from `# Initial User Prompt` section
2. Keep this section intact at the TOP of the content (after frontmatter)
3. Then update the `# Description` section with your refined specification

The initial prompt is essential context that:

- Preserves the original user intent
- Allows future reviewers to understand what was actually requested
- Provides context for acceptance criteria validation

</critical_rule>

<description_template>

Structure the task description with these sections:

```markdown
---
title: [Task title]
status: open
issue_type: [task|bug|feature]
---

# Initial User Prompt

[EXACT original user request - NEVER omit this]

# Description

[Brief summary of what needs to be implemented]

**Acceptance Criteria:**
- Requirement 1
- Requirement 2
- Requirement 3

**Example Flow:** (if applicable)
1. Step 1
2. Step 2
3. Expected outcome

---

## Files to be Modified/Created

Use tree-like file structure format for better readability:

### Primary Changes

` ` `
path/to/plugin/
├── agents/
│   └── agent-name.md              # NEW: Agent description
├── commands/
│   ├── new-command.md             # NEW: Command description
│   ├── existing-command.md        # UPDATE: What to change
│   └── old-command.md             # DELETE: Merged into new-command
└── tasks/
    ├── task-one.md                # NEW: Task description
    └── task-two.md                # NEW: Task description
` ` `

### Documentation Updates

` ` `
docs/
├── plugins/
│   └── plugin-name/
│       └── README.md              # UPDATE: Document the feature
└── guides/
    └── relevant-guide.md          # UPDATE: Update guide
` ` `

---

## Useful Resources for Implementation

Use tree-like file structure format for better readability:

### Pattern References

` ` `
plugins/
├── similar-plugin/
│   └── commands/
│       └── similar-command.md     # Similar pattern to follow
└── other-plugin/
    └── agents/
        └── example-agent.md       # Agent definition pattern
` ` `

### Documentation

` ` `
docs/
├── guides/
│   └── relevant-guide.md          # Key concepts
└── reference/
    └── relevant-ref.md            # Reference documentation
` ` `

### Related Code

` ` `
plugins/
├── related-plugin/
│   └── agents/                    # Multiple agent examples
└── another-plugin/
    └── commands/                  # Command examples
` ` `

--- 

## Implementation Process

[Think in steps as detailed as possible how you would implement the task.]

### Step 1: [Step title]
[Step description]

#### Expected output
[List of expected output]

#### Success criteria
[List of success criteria]

#### Subtasks
[List of subtasks]

#### Blockers
[List of blockers]

#### Risks
[List of risks]

```

</description_template>

<checklist>
Before completing refinement:

- [ ] **Initial user prompt is preserved** in `# Initial User Prompt` section
- [ ] Task has clear, actionable description
- [ ] Implementation requirements are specific
- [ ] All affected files are identified with descriptions
- [ ] Useful resources are listed with context on why they're helpful
- [ ] Similar patterns in codebase have been identified
- [ ] Success criteria are clear
- [ ] No ambiguous requirements remain
</checklist>

<example_session>
User: /refine-task task-add-auth-hooks.md

**Phase 1: Loading task...**

```bash
Read .specs/tasks/task-add-auth-hooks.md
```

Task: "Add hooks to reflect plugin"

**Phase 2: Analyzing codebase impact...**

*Searching for reflexion plugin structure...*

- Found: `plugins/reflexion/` with commands, plugin.json

*Searching for hook implementation examples...*

- Found: `plugins/customaize-agent/commands/create-hook.md`
- Found: `plugins/mcp/commands/setup-codemap-cli.md` with hooks config

*Identifying affected files...*

- Primary: Plugin manifest, new hook script
- Config: Settings.json for hook registration
- Docs: README updates

**Phase 3: Gathering resources...**

*Pattern references:*

- Hook creation guide in customaize-agent
- Real hook example in MCP plugin

*Documentation:*

- Custom extensions guide
- Official Claude Code hooks docs

**Phase 4: Updating task file...**

```bash
# Read current task file
Read .specs/tasks/task-add-auth-hooks.md

# Write updated file with refined description
Write .specs/tasks/task-add-auth-hooks.md with:
- Preserved frontmatter
- Initial user prompt section intact
- Comprehensive refined specification
```

Task refined with:

- Detailed specification
- 5 files identified (3 to create, 2 to update)
- 8 useful resources listed
- Initial user prompt preserved
</example_session>

<output>
After refinement, report:

1. **Task Updated**: $TASK_FILE
2. **Files Identified**: X files to modify/create
3. **Resources Gathered**: X useful references
4. **Ready for Implementation**: Yes/No (any blockers?)

Suggest: Read `.specs/tasks/$TASK_FILE` to review the refined task
</output>
