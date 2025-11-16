# Command Index

Complete alphabetical index of all commands available across all Context Engineering Kit plugins.

## Table of Contents

- [All Commands (Alphabetical)](#all-commands-alphabetical)
- [Commands by Plugin](#commands-by-plugin)
- [Commands by Category](#commands-by-category)

## All Commands (Alphabetical)

| Command | Plugin | Description | Category |
|---------|--------|-------------|----------|
| `/code-review:review-local-changes` | code-review | Comprehensive review of local uncommitted changes using specialized agents with code improvement suggestions | Review |
| `/code-review:review-pr` | code-review | Comprehensive pull request review using specialized agents | Review |
| `/customaize-agent:apply-anthropic-skill-best-practices` | customaize-agent | Comprehensive guide for skill development based on Anthropic's official best practices | Documentation |
| `/customaize-agent:create-command` | customaize-agent | Interactive assistant for creating new Claude commands with proper structure and patterns | Generation |
| `/customaize-agent:create-hook` | customaize-agent | Create and configure git hooks with intelligent project analysis and automated testing | Generation |
| `/customaize-agent:create-skill` | customaize-agent | Guide for creating effective skills with test-driven approach | Generation |
| `/customaize-agent:test-prompt` | customaize-agent | Test any prompt (commands, hooks, skills, subagent instructions) using RED-GREEN-REFACTOR cycle with subagents | Testing |
| `/customaize-agent:test-skill` | customaize-agent | Verify skills work under pressure and resist rationalization using RED-GREEN-REFACTOR cycle | Testing |
| `/ddd:setup-code-formating` | ddd | Sets up code formatting rules and style guidelines in CLAUDE.md | Configuration |
| `/docs:update-docs` | docs | Update implementation documentation after completing development phases | Documentation |
| `/git:analyze-issue` | git | Analyze a GitHub issue and create a detailed technical specification | Analysis |
| `/git:commit` | git | Create well-formatted commits with conventional commit messages and emoji | Git Operation |
| `/git:create-pr` | git | Create pull requests using GitHub CLI with proper templates and formatting | Git Operation |
| `/git:load-issues` | git | Load all open issues from GitHub and save them as markdown files | Git Operation |
| `/kaizen:analyse` | kaizen | Auto-selects best Kaizen method (Gemba Walk, Value Stream, or Muda) for target analysis | Analysis |
| `/kaizen:analyse-problem` | kaizen | Comprehensive A3 one-page problem analysis with root cause and action plan | Analysis |
| `/kaizen:cause-and-effect` | kaizen | Systematic Fishbone analysis exploring problem causes across six categories | Analysis |
| `/kaizen:plan-do-check-act` | kaizen | Iterative PDCA cycle for systematic experimentation and continuous improvement | Analysis |
| `/kaizen:root-cause-tracing` | kaizen | Systematically traces bugs backward through call stack to identify source of invalid data or incorrect behavior | Analysis |
| `/kaizen:why` | kaizen | Iterative Five Whys root cause analysis drilling from symptoms to fundamentals | Analysis |
| `/mcp:build-mcp` | mcp | Guide for creating high-quality MCP servers that enable LLMs to interact with external services | Documentation |
| `/mcp:setup-context7-mcp` | mcp | Guide for setup Context7 MCP server to load documentation for specific technologies | Configuration |
| `/mcp:setup-serena-mcp` | mcp | Guide for setup Serena MCP server for semantic code retrieval and editing capabilities | Configuration |
| `/reflexion:critique` | reflexion | Comprehensive multi-perspective review using specialized judges with debate and consensus building | Review |
| `/reflexion:memorize` | reflexion | Memorize insights from reflections and updates CLAUDE.md file with this knowledge. Curates insights from reflections and critiques into CLAUDE.md using Agentic Context Engineering | Documentation |
| `/reflexion:reflect` | reflexion | Reflect on previous response and output, based on Self-refinement framework for iterative improvement with complexity triage and verification | Review |
| `/sdd:00-setup` | sdd | Create or update the project constitution from interactive or provided principle inputs | Configuration |
| `/sdd:01-specify` | sdd | Create or update the feature specification from a natural language feature description | Generation |
| `/sdd:02-plan` | sdd | Plan the feature development based on the feature specification | Planning |
| `/sdd:03-tasks` | sdd | Create detailed implementation tasks from feature plans with complexity analysis | Planning |
| `/sdd:04-implement` | sdd | Execute feature implementation following task list with TDD approach and quality review | Implementation |
| `/sdd:05-document` | sdd | Document completed feature implementation with API guides, architecture updates, and lessons learned | Documentation |
| `/sdd:brainstorm` | sdd | Refines rough ideas into fully-formed designs through collaborative questioning and exploration | Planning |
| `/tech-stack:add-typescript-best-practices` | tech-stack | Setup TypeScript best practices and code style rules in CLAUDE.md | Configuration |

## Commands by Plugin

### Reflexion

Reflection and self-improvement commands based on Self-Refine and Reflexion papers.

| Command | Description |
|---------|-------------|
| `/reflexion:reflect` | Reflect on previous response and output, based on Self-refinement framework for iterative improvement with complexity triage and verification |
| `/reflexion:memorize` | Memorize insights from reflections and updates CLAUDE.md file with this knowledge. Curates insights from reflections and critiques into CLAUDE.md using Agentic Context Engineering |
| `/reflexion:critique` | Comprehensive multi-perspective review using specialized judges with debate and consensus building |

**Install:** `/plugin install reflexion@NeoLabHQ/context-engineering-kit`

### Code Review

Comprehensive code review commands using specialized agents.

| Command | Description |
|---------|-------------|
| `/code-review:review-local-changes` | Comprehensive review of local uncommitted changes using specialized agents with code improvement suggestions |
| `/code-review:review-pr` | Comprehensive pull request review using specialized agents |

**Install:** `/plugin install code-review@NeoLabHQ/context-engineering-kit`

### Git

Commands for Git operations including commits and pull requests.

| Command | Description |
|---------|-------------|
| `/git:commit` | Create well-formatted commits with conventional commit messages and emoji |
| `/git:create-pr` | Create pull requests using GitHub CLI with proper templates and formatting |
| `/git:analyze-issue` | Analyze a GitHub issue and create a detailed technical specification |
| `/git:load-issues` | Load all open issues from GitHub and save them as markdown files |

**Install:** `/plugin install git@NeoLabHQ/context-engineering-kit`

### Spec-Driven Development (SDD)

Complete Spec-Driven Development workflow commands.

| Command | Description |
|---------|-------------|
| `/sdd:00-setup` | Create or update the project constitution from interactive or provided principle inputs |
| `/sdd:01-specify` | Create or update the feature specification from a natural language feature description |
| `/sdd:02-plan` | Plan the feature development based on the feature specification |
| `/sdd:03-tasks` | Create detailed implementation tasks from feature plans with complexity analysis |
| `/sdd:04-implement` | Execute feature implementation following task list with TDD approach and quality review |
| `/sdd:05-document` | Document completed feature implementation with API guides, architecture updates, and lessons learned |
| `/sdd:brainstorm` | Refines rough ideas into fully-formed designs through collaborative questioning and exploration |

**Install:** `/plugin install sdd@NeoLabHQ/context-engineering-kit`

### Kaizen

Continuous improvement and problem analysis commands.

| Command | Description |
|---------|-------------|
| `/kaizen:analyse` | Auto-selects best Kaizen method (Gemba Walk, Value Stream, or Muda) for target analysis |
| `/kaizen:analyse-problem` | Comprehensive A3 one-page problem analysis with root cause and action plan |
| `/kaizen:why` | Iterative Five Whys root cause analysis drilling from symptoms to fundamentals |
| `/kaizen:root-cause-tracing` | Systematically traces bugs backward through call stack to identify source of invalid data or incorrect behavior |
| `/kaizen:cause-and-effect` | Systematic Fishbone analysis exploring problem causes across six categories |
| `/kaizen:plan-do-check-act` | Iterative PDCA cycle for systematic experimentation and continuous improvement |

**Install:** `/plugin install kaizen@NeoLabHQ/context-engineering-kit`

### Customaize Agent

Commands for creating and testing custom Claude Code extensions.

| Command | Description |
|---------|-------------|
| `/customaize-agent:create-command` | Interactive assistant for creating new Claude commands with proper structure and patterns |
| `/customaize-agent:create-skill` | Guide for creating effective skills with test-driven approach |
| `/customaize-agent:create-hook` | Create and configure git hooks with intelligent project analysis and automated testing |
| `/customaize-agent:test-skill` | Verify skills work under pressure and resist rationalization using RED-GREEN-REFACTOR cycle |
| `/customaize-agent:test-prompt` | Test any prompt (commands, hooks, skills, subagent instructions) using RED-GREEN-REFACTOR cycle with subagents |
| `/customaize-agent:apply-anthropic-skill-best-practices` | Comprehensive guide for skill development based on Anthropic's official best practices |

**Install:** `/plugin install customaize-agent@NeoLabHQ/context-engineering-kit`

### Docs

Documentation management commands.

| Command | Description |
|---------|-------------|
| `/docs:update-docs` | Update implementation documentation after completing development phases |

**Install:** `/plugin install docs@NeoLabHQ/context-engineering-kit`

### Domain-Driven Development (DDD)

Commands for setting up domain-driven development practices.

| Command | Description |
|---------|-------------|
| `/ddd:setup-code-formating` | Sets up code formatting rules and style guidelines in CLAUDE.md |

**Install:** `/plugin install ddd@NeoLabHQ/context-engineering-kit`

### Tech Stack

Commands for language and framework-specific best practices.

| Command | Description |
|---------|-------------|
| `/tech-stack:add-typescript-best-practices` | Setup TypeScript best practices and code style rules in CLAUDE.md |

**Install:** `/plugin install tech-stack@NeoLabHQ/context-engineering-kit`

### MCP

Commands for integrating Model Context Protocol servers.

| Command | Description |
|---------|-------------|
| `/mcp:setup-context7-mcp` | Guide for setup Context7 MCP server to load documentation for specific technologies |
| `/mcp:setup-serena-mcp` | Guide for setup Serena MCP server for semantic code retrieval and editing capabilities |
| `/mcp:build-mcp` | Guide for creating high-quality MCP servers that enable LLMs to interact with external services |

**Install:** `/plugin install mcp@NeoLabHQ/context-engineering-kit`

## Commands by Category

### Analysis Commands

Commands that analyze code, issues, problems, or project state.

| Command | Plugin | Description |
|---------|--------|-------------|
| `/git:analyze-issue` | git | Analyze a GitHub issue and create a detailed technical specification |
| `/kaizen:analyse` | kaizen | Auto-selects best Kaizen method (Gemba Walk, Value Stream, or Muda) for target analysis |
| `/kaizen:analyse-problem` | kaizen | Comprehensive A3 one-page problem analysis with root cause and action plan |
| `/kaizen:why` | kaizen | Iterative Five Whys root cause analysis drilling from symptoms to fundamentals |
| `/kaizen:root-cause-tracing` | kaizen | Systematically traces bugs backward through call stack to identify source of invalid data or incorrect behavior |
| `/kaizen:cause-and-effect` | kaizen | Systematic Fishbone analysis exploring problem causes across six categories |
| `/kaizen:plan-do-check-act` | kaizen | Iterative PDCA cycle for systematic experimentation and continuous improvement |

### Review Commands

Commands that evaluate code quality, specifications, or outputs.

| Command | Plugin | Description |
|---------|--------|-------------|
| `/code-review:review-local-changes` | code-review | Comprehensive review of local uncommitted changes using specialized agents with code improvement suggestions |
| `/code-review:review-pr` | code-review | Comprehensive pull request review using specialized agents |
| `/reflexion:reflect` | reflexion | Reflect on previous response and output, based on Self-refinement framework for iterative improvement with complexity triage and verification |
| `/reflexion:critique` | reflexion | Comprehensive multi-perspective review using specialized judges with debate and consensus building |

### Generation Commands

Commands that create new content, code, or specifications.

| Command | Plugin | Description |
|---------|--------|-------------|
| `/customaize-agent:create-command` | customaize-agent | Interactive assistant for creating new Claude commands with proper structure and patterns |
| `/customaize-agent:create-skill` | customaize-agent | Guide for creating effective skills with test-driven approach |
| `/customaize-agent:create-hook` | customaize-agent | Create and configure git hooks with intelligent project analysis and automated testing |
| `/sdd:01-specify` | sdd | Create or update the feature specification from a natural language feature description |

### Planning Commands

Commands that help plan development work or features.

| Command | Plugin | Description |
|---------|--------|-------------|
| `/sdd:02-plan` | sdd | Plan the feature development based on the feature specification |
| `/sdd:03-tasks` | sdd | Create detailed implementation tasks from feature plans with complexity analysis |
| `/sdd:brainstorm` | sdd | Refines rough ideas into fully-formed designs through collaborative questioning and exploration |

### Implementation Commands

Commands that execute development work.

| Command | Plugin | Description |
|---------|--------|-------------|
| `/sdd:04-implement` | sdd | Execute feature implementation following task list with TDD approach and quality review |

### Documentation Commands

Commands that create or update documentation.

| Command | Plugin | Description |
|---------|--------|-------------|
| `/customaize-agent:apply-anthropic-skill-best-practices` | customaize-agent | Comprehensive guide for skill development based on Anthropic's official best practices |
| `/docs:update-docs` | docs | Update implementation documentation after completing development phases |
| `/mcp:build-mcp` | mcp | Guide for creating high-quality MCP servers that enable LLMs to interact with external services |
| `/reflexion:memorize` | reflexion | Memorize insights from reflections and updates CLAUDE.md file with this knowledge. Curates insights from reflections and critiques into CLAUDE.md using Agentic Context Engineering |
| `/sdd:05-document` | sdd | Document completed feature implementation with API guides, architecture updates, and lessons learned |

### Configuration Commands

Commands that set up or modify project settings.

| Command | Plugin | Description |
|---------|--------|-------------|
| `/ddd:setup-code-formating` | ddd | Sets up code formatting rules and style guidelines in CLAUDE.md |
| `/mcp:setup-context7-mcp` | mcp | Guide for setup Context7 MCP server to load documentation for specific technologies |
| `/mcp:setup-serena-mcp` | mcp | Guide for setup Serena MCP server for semantic code retrieval and editing capabilities |
| `/sdd:00-setup` | sdd | Create or update the project constitution from interactive or provided principle inputs |
| `/tech-stack:add-typescript-best-practices` | tech-stack | Setup TypeScript best practices and code style rules in CLAUDE.md |

### Git Operation Commands

Commands that perform Git operations.

| Command | Plugin | Description |
|---------|--------|-------------|
| `/git:commit` | git | Create well-formatted commits with conventional commit messages and emoji |
| `/git:create-pr` | git | Create pull requests using GitHub CLI with proper templates and formatting |
| `/git:load-issues` | git | Load all open issues from GitHub and save them as markdown files |

### Testing Commands

Commands for testing prompts, skills, or commands.

| Command | Plugin | Description |
|---------|--------|-------------|
| `/customaize-agent:test-prompt` | customaize-agent | Test any prompt (commands, hooks, skills, subagent instructions) using RED-GREEN-REFACTOR cycle with subagents |
| `/customaize-agent:test-skill` | customaize-agent | Verify skills work under pressure and resist rationalization using RED-GREEN-REFACTOR cycle |

## Command Usage Patterns

### Basic Command Syntax

```bash
/plugin:command [arguments]
```

### Commands with No Arguments

Many commands operate on the current context or prompt for information interactively:

```bash
/reflexion:reflect
/code-review:review-local-changes
/git:commit
```

### Commands with Optional Arguments

Some commands accept optional arguments to customize behavior:

```bash
/sdd:00-setup Use NestJS as backend framework
/sdd:01-specify Add user authentication with OAuth
/sdd:05-document Focus on API documentation
```

### Sequential Workflow Commands

Some plugins provide numbered commands designed to be used in sequence:

```bash
/sdd:00-setup      # Step 0: Setup project constitution
/sdd:01-specify    # Step 1: Create specification
/sdd:02-plan       # Step 2: Plan implementation
/sdd:03-tasks      # Step 3: Break down into tasks
/sdd:04-implement  # Step 4: Implement feature
/sdd:05-document   # Step 5: Document results
```

## Command Naming Conventions

Commands follow consistent naming patterns:

- **Action verbs**: `create`, `setup`, `analyze`, `review`, `test`
- **Domain prefixes**: Plugin name followed by colon (e.g., `/git:`, `/sdd:`)
- **Descriptive names**: Clear indication of command purpose
- **Kebab-case**: Multi-word commands use hyphens (e.g., `review-local-changes`)

## See Also

**Reference:**
- [Skill Index](./skill-index.md) - Skills that automatically enhance Claude's behavior
- [Agent Index](./agent-index.md) - Specialized agents used by commands
- [Marketplace API](./marketplace-api.md) - Commands for managing plugins
- [Plugin Manifest](./plugin-manifest.md) - Plugin structure and metadata

**Guides:**
- [Choosing Plugins](../guides/choosing-plugins.md) - Selecting commands for your workflow
- [Combining Plugins](../guides/combining-plugins.md) - Using commands together
- [Custom Workflows](../guides/custom-workflows.md) - Building command sequences
