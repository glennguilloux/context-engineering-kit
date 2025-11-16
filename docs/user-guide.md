# User Guide

Comprehensive guide to using the Context Engineering Kit marketplace for Claude Code.

## Table of Contents

- [Understanding the Marketplace](#understanding-the-marketplace)
- [Installing and Managing Plugins](#installing-and-managing-plugins)
- [Using Commands](#using-commands)
- [Using Skills](#using-skills)
- [Understanding Agents](#understanding-agents)
- [Working with CLAUDE.md](#working-with-claudemd)
- [Common Workflows](#common-workflows)
- [Tips and Best Practices](#tips-and-best-practices)

---

## Understanding the Marketplace

### What is Context Engineering Kit?

Context Engineering Kit (CEK) is a curated marketplace of advanced context engineering techniques packaged as plugins for Claude Code, designed to improve agent quality through scientifically proven methods. For a complete understanding of CEK's mission and philosophy, see [What is CEK](./overview/what-is-cek.md).

### How the Marketplace Works

The marketplace is a Git repository containing plugin definitions. When you add the marketplace to Claude Code:

1. **Adding the marketplace** makes plugins available for installation but doesn't load anything into your context
2. **Installing a plugin** loads only that plugin's specific agents, commands, and skills into Claude's context
3. **Using plugins** through commands (manual) or skills (automatic) applies the plugin's capabilities

This architecture ensures you only load what you need, keeping token usage efficient while maintaining access to powerful capabilities.

### Architecture Overview

```
NeoLabHQ/context-engineering-kit (Marketplace)
├── plugins/
│   ├── reflexion/
│   │   ├── commands/       # Manually invoked actions
│   │   ├── skills/         # Automatically applied knowledge
│   │   └── agents/         # Specialized sub-agents
│   ├── code-review/
│   ├── sdd/
│   └── ...
```

**Components:**

- **Commands** - Explicitly invoked actions (e.g., `/reflexion:reflect`)
- **Skills** - Automatically applied knowledge and behaviors
- **Agents** - Specialized sub-agents for focused tasks

---

## Installing and Managing Plugins

### Adding the Marketplace

First, make the Context Engineering Kit marketplace available:

```bash
# Start Claude Code
claude

# Add the marketplace
/plugin marketplace add NeoLabHQ/context-engineering-kit
```

This command downloads the marketplace index but doesn't install any plugins yet. No agents, commands, or skills are loaded into your context.

### Viewing Available Plugins

List all plugins available in the marketplace:

```bash
/plugin
```

This displays installed plugins and available plugins with their descriptions.

### Installing Plugins

Install a specific plugin from the marketplace:

```bash
# Syntax
/plugin install <plugin-name>@NeoLabHQ/context-engineering-kit

# Examples
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install sdd@NeoLabHQ/context-engineering-kit
```

When you install a plugin, Claude loads:

- All commands defined by the plugin
- All skills defined by the plugin
- All agents defined by the plugin

**What gets loaded:**

- Commands appear as `/plugin-name:command-name` in your available commands
- Skills become part of Claude's active knowledge base
- Agents become available for specialized sub-agent tasks

### Updating the Marketplace

Get the latest plugin listings and updates:

```bash
/plugin marketplace update NeoLabHQ/context-engineering-kit
```

This refreshes the marketplace metadata, ensuring you have access to:

- New plugins added to the marketplace
- Updated versions of existing plugins
- Latest plugin descriptions and capabilities

### Removing Plugins

To remove a plugin and free up context:

```bash
/plugin uninstall <plugin-name>
```

This removes the plugin's commands, skills, and agents from Claude's context.

---

## Using Commands

Commands are explicit actions you invoke manually to perform specific tasks. They follow the pattern `/plugin-name:command-name`.

### Discovering Commands

After installing a plugin, its commands become available. View all commands:

```bash
/help
```

Commands are namespaced by plugin, making their origin clear:

- `/reflexion:reflect` - From the reflexion plugin
- `/git:commit` - From the git plugin
- `/sdd:01-specify` - From the sdd plugin

### Command Syntax

```bash
/plugin-name:command-name [optional-argument]
```

**Examples:**

```bash
# No argument required
/reflexion:reflect

# With argument
/git:commit
/sdd:01-specify Add user authentication with OAuth

# With detailed argument
/kaizen:analyse Target the checkout flow for optimization
```

### Common Command Patterns

**Reflexion commands** - Improve output quality through reflection:

```bash
/reflexion:reflect        # Reflect on previous response
/reflexion:memorize       # Update CLAUDE.md with insights
/reflexion:critique       # Multi-perspective review
```

**Code review commands** - Review code quality:

```bash
/code-review:review-local-changes    # Review uncommitted changes
/code-review:review-pr               # Review pull request
```

**Git commands** - Git operations:

```bash
/git:commit               # Create conventional commits
/git:create-pr            # Create pull requests
/git:analyze-issue        # Analyze GitHub issue
/git:load-issues          # Load all open issues
```

**SDD workflow commands** - Spec-Driven Development:

```bash
/sdd:00-setup             # Setup project constitution
/sdd:01-specify [desc]    # Create feature specification
/sdd:02-plan [focus]      # Plan architecture
/sdd:03-tasks [guidance]  # Generate tasks
/sdd:04-implement [prefs] # Execute implementation
/sdd:05-document [focus]  # Document feature
```

**Kaizen commands** - Continuous improvement analysis:

```bash
/kaizen:analyse           # Auto-select best method
/kaizen:analyse-problem   # A3 problem analysis
/kaizen:why               # Five Whys root cause
/kaizen:root-cause-tracing # Bug tracing
/kaizen:cause-and-effect  # Fishbone analysis
/kaizen:plan-do-check-act # PDCA cycle
```

**Customization commands** - Create custom extensions:

```bash
/customaize-agent:create-command     # Create new command
/customaize-agent:create-skill       # Create new skill
/customaize-agent:create-hook        # Create git hook
/customaize-agent:test-skill         # Test skill effectiveness
/customaize-agent:test-prompt        # Test prompt with subagents
```

**Documentation commands** - Manage documentation:

```bash
/docs:update-docs         # Update implementation docs
```

**Tech stack commands** - Setup language/framework practices:

```bash
/tech-stack:add-typescript-best-practices  # TypeScript setup
```

**MCP commands** - Integrate MCP servers:

```bash
/mcp:setup-context7-mcp   # Context7 documentation loader
/mcp:setup-serena-mcp     # Serena semantic code search
/mcp:build-mcp            # Build custom MCP server
```

**DDD commands** - Domain-driven development:

```bash
/ddd:setup-code-formating # Setup code formatting rules
```

### When to Use Commands

Use commands when you want to:

- **Explicitly trigger an action** - Commands run only when you invoke them
- **Control timing** - Choose exactly when to perform the action
- **Provide specific context** - Commands accept arguments for customization
- **One-time operations** - Actions you don't want applied automatically

**Example workflow:**

```bash
# Work on code
claude "Add validation to user registration"

# Explicitly reflect to improve output
/reflexion:reflect

# Memorize insights for future use
/reflexion:memorize
```

---

## Using Skills

Skills are automatically applied knowledge that influences Claude's behavior without explicit invocation. When a skill is loaded, Claude considers it continuously during your session.

### How Skills Work

Skills are markdown documents loaded into Claude's context that provide:

- **Best practices** - Industry-standard approaches and patterns
- **Methodologies** - Systematic processes (e.g., TDD, DDD)
- **Anti-patterns** - Common mistakes to avoid
- **Gate functions** - Checks before taking certain actions

**Key difference from commands:**

- **Commands** - You invoke manually with `/command-name`
- **Skills** - Claude applies automatically when relevant

### Available Skills

**Test-Driven Development (TDD)** - From `tdd` plugin:

```bash
/plugin install tdd@NeoLabHQ/context-engineering-kit
```

**What it does:**

- Enforces write-test-first discipline
- Prevents production code without failing tests
- Includes anti-patterns to avoid
- Provides gate functions for quality checks

**When it activates:** Automatically whenever implementing features or fixing bugs.

**Subagent-Driven Development (SADD)** - From `sadd` plugin:

```bash
/plugin install sadd@NeoLabHQ/context-engineering-kit
```

**What it does:**

- Dispatches fresh sub-agents for each task
- Implements code review gates between tasks
- Enables fast iteration with quality gates

**When it activates:** Automatically during multi-task development workflows.

**Software Architecture** - From `ddd` plugin:

```bash
/plugin install ddd@NeoLabHQ/context-engineering-kit
```

**What it does:**

- Applies Clean Architecture principles
- Enforces SOLID principles
- Provides design pattern guidance

**When it activates:** Automatically during architecture and design decisions.

**Kaizen** - From `kaizen` plugin:

```bash
/plugin install kaizen@NeoLabHQ/context-engineering-kit
```

**What it does:**

- Applies continuous improvement mindset
- Provides multiple analysis techniques
- Encourages root cause analysis

**When it activates:** Automatically when analyzing problems or optimizing code.

**Prompt Engineering** - From `customaize-agent` plugin:

```bash
/plugin install customaize-agent@NeoLabHQ/context-engineering-kit
```

**What it does:**

- Applies Anthropic best practices
- Uses Agent Persuasion Principles
- Provides prompt engineering techniques

**When it activates:** Automatically when creating commands, skills, or sub-agent instructions.

### Skills vs Commands Trade-off

**Why prefer commands over skills:**

The Context Engineering Kit architecture prefers commands over skills to minimize token usage:

- **Skills** always populate context (every token, every request)
- **Commands** only load when invoked (zero tokens until used)

**When to use skills:**

- **Core methodologies** you want applied throughout your session (TDD, DDD)
- **Foundational principles** that should influence all decisions
- **Quality gates** that should always be checked

**When to use commands:**

- **Specific actions** needed occasionally
- **One-time operations** like reviews or analyses
- **Explicit workflows** with clear start and end points

This is why most CEK plugins provide commands rather than skills - keeping your context lean while maintaining powerful capabilities.

---

## Understanding Agents

Agents are specialized sub-agents designed for focused tasks. Unlike Claude's general-purpose capabilities, agents have specific expertise and domain knowledge.

### What Are Agents?

Agents are fresh Claude instances launched with specialized prompts for specific tasks. They:

- **Focus on one domain** - e.g., code review, architecture design, business analysis
- **Have specialized knowledge** - Expertise in their specific area
- **Work independently** - Operate as sub-agents with their own context
- **Return specific outputs** - Structured results aligned with their purpose

### Agent Architecture

```
Main Claude Session (You)
├── Launches specialized agent for task
│   ├── Agent has specific prompt and knowledge
│   ├── Agent performs focused work
│   └── Agent returns structured result
└── Integrates agent results into workflow
```

**Key benefits:**

- **Fresh context** - Each agent starts with clean context specific to its task
- **Specialized expertise** - Domain-specific knowledge and techniques
- **Parallel execution** - Multiple agents can work simultaneously
- **Quality gates** - Agents perform validation and review

### Available Agents by Plugin

**Code Review plugin** - Multiple specialized reviewers:

```bash
/plugin install code-review@NeoLabHQ/context-engineering-kit
```

Agents:

- `bug-hunter` - Identifies bugs, edge cases, error-prone patterns
- `code-quality-reviewer` - Evaluates structure, readability, maintainability
- `contracts-reviewer` - Reviews interfaces, APIs, data models
- `historical-context-reviewer` - Analyzes changes against codebase history
- `security-auditor` - Identifies vulnerabilities and attack vectors
- `test-coverage-reviewer` - Evaluates test coverage and missing tests

**SDD plugin** - Spec-Driven Development agents:

```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
```

Agents:

- `business-analyst` - Transforms requirements into specifications
- `code-explorer` - Analyzes codebase by tracing execution paths
- `researcher` - Investigates technologies, libraries, frameworks
- `software-architect` - Designs architecture with multiple approaches
- `tech-lead` - Breaks specifications into technical tasks
- `developer` - Executes implementation with TDD approach
- `tech-writer` - Creates comprehensive technical documentation

### How Agents Are Invoked

**Automatic invocation** - Commands launch agents as part of their workflow:

```bash
# Launches multiple code review agents
/code-review:review-local-changes

# Launches business-analyst agent
/sdd:01-specify Add user authentication

# Launches researcher, code-explorer, and software-architect agents
/sdd:02-plan
```

**Manual invocation** - Request specific agents directly:

```text
Launch business-analyst to analyze payment feature requirements
Launch code-explorer to trace authentication flow
Launch software-architect to design caching strategy
```

### Agent Workflows

**Code Review workflow:**

1. Main session detects uncommitted changes
2. Launches 6 specialized review agents in parallel
3. Each agent performs focused review
4. Results aggregated into comprehensive report
5. Presents findings with severity and recommendations

**SDD Planning workflow:**

1. Main session reads feature specification
2. Launches `researcher` for unknown technologies
3. Launches `code-explorer` to analyze similar features
4. Launches 3 `software-architect` agents with different focuses:
   - Minimal changes approach
   - Clean architecture approach
   - Pragmatic balance approach
5. Architects produce designs with trade-offs
6. Main session presents options for decision

**SDD Implementation workflow:**

1. Main session reads tasks and dependencies
2. Launches `developer` agent for each implementation phase
3. Developer follows TDD approach strictly
4. Tracks progress by updating tasks.md
5. Launches review agents after each phase
6. Validates completion before proceeding

### Benefits of Agent-Based Architecture

**Quality gates:**

- Each agent validates its domain
- Multiple perspectives catch more issues
- Specialized knowledge improves accuracy

**Context efficiency:**

- Agents have focused, minimal context
- Main session doesn't need all agent knowledge
- Fresh context prevents contamination

**Parallel execution:**

- Multiple agents work simultaneously
- Reduces overall workflow time
- Independent analyses provide diverse insights

**Maintainability:**

- Each agent's prompt is independently versioned
- Easy to update or improve specific agents
- Clear separation of concerns

---

## Working with CLAUDE.md

The `CLAUDE.md` file is your project's living memory - a central repository of project-specific knowledge, patterns, and insights that persists across sessions.

### What is CLAUDE.md?

`CLAUDE.md` is a markdown file in your project root that contains:

- **Project constitution** - Core principles and standards
- **Architecture decisions** - Key design choices and rationale
- **Best practices** - Project-specific patterns and conventions
- **Lessons learned** - Insights from reflections and critiques
- **Common pitfalls** - Known issues and how to avoid them
- **Tech stack guidance** - Framework and library usage patterns

**Why it matters:**

- **Persistent memory** - Knowledge survives between sessions
- **Consistency** - Ensures Claude follows project patterns
- **Quality improvement** - Accumulates insights over time
- **Team alignment** - Documents shared understanding

### How Plugins Update CLAUDE.md

Several plugins read from and write to `CLAUDE.md`:

**Reflexion plugin** - Memorizes insights:

```bash
# After reflecting, save insights to CLAUDE.md
/reflexion:memorize
```

**What it adds:**

- Key insights from reflection sessions
- Patterns discovered during implementation
- Lessons learned from critiques
- Common mistakes to avoid
- Successful approaches to replicate

**Tech Stack plugin** - Adds language/framework practices:

```bash
/tech-stack:add-typescript-best-practices
```

**What it adds:**

- Language-specific best practices
- Framework usage patterns
- Code style guidelines
- Common anti-patterns for the tech stack

**DDD plugin** - Sets up code quality standards:

```bash
/ddd:setup-code-formating
```

**What it adds:**

- Code formatting rules
- Architecture principles
- SOLID principle applications
- Clean Architecture patterns

**MCP plugin** - Documents MCP server requirements:

```bash
/mcp:setup-context7-mcp
```

**What it adds:**

- MCP server integration requirements
- When and how to use specific MCP servers
- Configuration and usage patterns

**SDD plugin** - Establishes project constitution:

```bash
/sdd:00-setup Use NestJS, follow SOLID and Clean Architecture
```

**What it adds:**

- Project constitution and governance
- Core architectural principles
- Technology stack decisions
- Development standards

### CLAUDE.md Structure

A well-organized `CLAUDE.md` typically includes:

```markdown
# Project Constitution

Core principles and standards...

## Architecture Principles

- Clean Architecture
- SOLID principles
- Domain-Driven Design

## Technology Stack

### Backend: NestJS

Best practices...

### Frontend: React + TypeScript

Best practices...

## Code Quality Standards

Formatting, linting, testing standards...

## Lessons Learned

### [Date] - Feature: User Authentication

Insight: Always validate tokens server-side...

## Common Pitfalls

- Avoid mixing business logic in controllers
- Don't query database directly in presenters

## MCP Servers

### Context7

Use for: Loading documentation...
```

### Best Practices for CLAUDE.md

**Keep it curated:**

- Remove outdated information
- Consolidate duplicate insights
- Organize by topic for easy reference

**Use it actively:**

- Reference it when starting new features
- Update it after completing major work
- Review it during code reviews

**Make it actionable:**

- Write specific guidance, not generic advice
- Include examples and anti-patterns
- Link to relevant documentation

**Version control:**

- Commit `CLAUDE.md` with code changes
- Track evolution of project knowledge
- Review changes during pull requests

**Balance detail and brevity:**

- Detailed enough to be useful
- Concise enough to remain readable
- Focus on project-specific insights

### Using CLAUDE.md Effectively

**Start of session:**

```text
Read CLAUDE.md and follow its guidelines
```

**After major feature:**

```bash
# Reflect on implementation
/reflexion:reflect

# Memorize key insights to CLAUDE.md
/reflexion:memorize
```

**When setting up new project:**

```bash
# Establish constitution
/sdd:00-setup Use FastAPI, PostgreSQL, follow Clean Architecture

# Add language best practices
/tech-stack:add-typescript-best-practices

# Setup code quality standards
/ddd:setup-code-formating
```

**Regular maintenance:**

- Review and consolidate monthly
- Remove obsolete guidance
- Update based on team retrospectives
- Refine based on recurring issues

---

## Common Workflows

This section demonstrates practical workflows combining multiple plugins for common development scenarios.

### Workflow 1: Feature Development with Quality Gates

Complete feature development with reflection and code review:

```bash
# 1. Implement feature
claude "Add email validation to user registration"

# 2. Reflect on implementation
/reflexion:reflect

# 3. Review local changes with specialized agents
/code-review:review-local-changes

# 4. Memorize insights
/reflexion:memorize

# 5. Create conventional commit
/git:commit
```

**Why this works:**

- Implementation focuses on the feature
- Reflection catches logical issues
- Code review catches technical issues
- Memorization preserves learning
- Commit documents the change

### Workflow 2: Spec-Driven Development

Full SDD workflow for complex features:

```bash
# 1. Setup project (once per project)
/sdd:00-setup Use NestJS, follow SOLID and Clean Architecture

# 2. Create specification
/sdd:01-specify Add OAuth authentication with Google and GitHub providers

# 3. Plan architecture
/sdd:02-plan Focus on security and integration with existing user system

# 4. Generate tasks
/sdd:03-tasks Use TDD approach and prioritize MVP features

# 5. Implement
/sdd:04-implement Focus on test coverage and error handling

# 6. Document
/sdd:05-document Include API examples and integration guide

# 7. Review PR
/code-review:review-pr

# 8. Create PR
/git:create-pr
```

**Why this works:**

- Specification prevents scope creep
- Planning identifies architectural issues early
- Tasks provide clear implementation roadmap
- Documentation keeps knowledge current
- Reviews catch issues before merge

### Workflow 3: Bug Investigation and Fix

Root cause analysis with quality implementation:

```bash
# 1. Load issue context
/git:analyze-issue #123

# 2. Trace root cause
/kaizen:root-cause-tracing

# 3. Analyze with Five Whys
/kaizen:why

# 4. Implement fix with TDD
# (TDD skill automatically enforces test-first)
claude "Fix the rate limiting bug by adding proper Redis locking"

# 5. Review fix
/code-review:review-local-changes

# 6. Commit with context
/git:commit

# 7. Memorize lesson learned
/reflexion:memorize
```

**Why this works:**

- Root cause analysis prevents superficial fixes
- TDD ensures bug is actually fixed
- Review catches edge cases
- Memorization prevents future recurrence

### Workflow 4: Code Quality Improvement

Systematic quality improvement with Kaizen:

```bash
# 1. Analyze target area
/kaizen:analyse Target the checkout flow for performance optimization

# 2. Get comprehensive critique
/reflexion:critique

# 3. Create improvement plan
/kaizen:plan-do-check-act

# 4. Implement improvements
claude "Apply identified performance optimizations to checkout"

# 5. Review changes
/code-review:review-local-changes

# 6. Document improvements
/reflexion:memorize
```

**Why this works:**

- Analysis identifies real issues
- Critique provides multiple perspectives
- PDCA ensures systematic improvement
- Documentation preserves knowledge

### Workflow 5: Creating Custom Extensions

Build project-specific commands or skills:

```bash
# 1. Create custom command
/customaize-agent:create-command

# 2. Test command with RED-GREEN-REFACTOR
/customaize-agent:test-prompt

# 3. Create supporting skill
/customaize-agent:create-skill

# 4. Test skill effectiveness
/customaize-agent:test-skill

# 5. Apply best practices
/customaize-agent:apply-anthropic-skill-best-practices

# 6. Document the extension
/docs:update-docs
```

**Why this works:**

- Structured creation ensures quality
- Testing validates effectiveness
- Best practices improve robustness
- Documentation enables team usage

### Workflow 6: Project Setup

Initialize new project with best practices:

```bash
# 1. Establish project constitution
/sdd:00-setup Use FastAPI, PostgreSQL, pytest, follow Clean Architecture

# 2. Setup language best practices
/tech-stack:add-typescript-best-practices

# 3. Setup code quality standards
/ddd:setup-code-formating

# 4. Setup MCP servers if needed
/mcp:setup-context7-mcp
/mcp:setup-serena-mcp

# 5. Document project setup
/docs:update-docs
```

**Why this works:**

- Constitution guides all future decisions
- Best practices are documented upfront
- Standards ensure consistency
- MCP integration enables powerful capabilities

### Workflow 7: PR Review and Merge

Comprehensive pull request review:

```bash
# 1. Review PR with specialized agents
/code-review:review-pr

# 2. Request improvements if needed
claude "Address security concerns in authentication middleware"

# 3. Re-review local changes
/code-review:review-local-changes

# 4. Get final critique
/reflexion:critique

# 5. Merge and document
/git:create-pr
/reflexion:memorize
```

**Why this works:**

- Specialized agents catch domain-specific issues
- Iterative review ensures quality
- Critique provides final validation
- Memorization captures lessons

### Workflow 8: Brainstorming to Implementation

Transform vague ideas into working features:

```bash
# 1. Refine unclear idea
/sdd:brainstorm Users want better search but requirements unclear

# 2. Create specification from refined idea
/sdd:01-specify Implement faceted search with filters and autocomplete

# 3. Continue with standard SDD workflow
/sdd:02-plan
/sdd:03-tasks
/sdd:04-implement
/sdd:05-document
```

**Why this works:**

- Brainstorming clarifies requirements
- Specification captures refined understanding
- SDD workflow ensures quality implementation

---

## Tips and Best Practices

### Token Efficiency

**Install only what you need:**

```bash
# ❌ Don't install all plugins
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install sdd@NeoLabHQ/context-engineering-kit
# ... (if you won't use them all)

# ✅ Install plugins for current task
/plugin install reflexion@NeoLabHQ/context-engineering-kit  # For today's feature work
```

**Prefer commands over skills:**

- Commands load zero tokens until invoked
- Skills populate context every request
- Install skills only for core methodologies

**Uninstall when done:**

```bash
# After completing SDD workflow
/plugin uninstall sdd

# Free up context for other work
```

**Use agents strategically:**

- Agents have fresh, focused context
- Main session doesn't need agent knowledge
- Let agents handle specialized tasks

### Combining Plugins

**Quality stack:**

```bash
/plugin install tdd@NeoLabHQ/context-engineering-kit       # Enforce test-first
/plugin install reflexion@NeoLabHQ/context-engineering-kit # Improve output
/plugin install code-review@NeoLabHQ/context-engineering-kit # Catch issues
```

Use together:

1. TDD skill enforces test-first implementation
2. Reflexion improves code quality
3. Code review validates with specialized agents

**Development workflow stack:**

```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit       # Specification workflow
/plugin install git@NeoLabHQ/context-engineering-kit       # Git operations
/plugin install docs@NeoLabHQ/context-engineering-kit      # Documentation
```

Use together:

1. SDD drives feature development
2. Git handles commits and PRs
3. Docs maintains documentation

**Analysis stack:**

```bash
/plugin install kaizen@NeoLabHQ/context-engineering-kit    # Problem analysis
/plugin install reflexion@NeoLabHQ/context-engineering-kit # Critique and reflection
```

Use together:

1. Kaizen analyzes root causes
2. Reflexion provides multi-perspective critique

### Maximizing Quality

**Use quality gates:**

- Review after implementation
- Reflect before finalizing
- Critique for critical code

**Leverage specialized agents:**

- Code review agents catch domain-specific issues
- SDD agents provide specialized expertise
- Multiple agents offer diverse perspectives

**Maintain CLAUDE.md:**

- Update after major work
- Review and refine regularly
- Reference it actively

**Follow methodologies:**

- TDD prevents untested code
- SDD ensures comprehensive specifications
- DDD maintains clean architecture

### Workflow Optimization

**Start with setup:**

```bash
# First time in project
/sdd:00-setup
/tech-stack:add-typescript-best-practices
/ddd:setup-code-formating
```

Establishes foundation once, benefits throughout project.

**Chain related commands:**

```bash
# Instead of separate sessions
claude "Implement feature"
# ...later...
/reflexion:reflect
# ...later...
/reflexion:memorize

# Do in one flow
claude "Implement feature"
/reflexion:reflect
/reflexion:memorize
/git:commit
```

**Use agents for learning:**

```text
# Learn your codebase
Launch code-explorer to trace authentication flow

# Understand patterns
Launch software-architect to analyze existing architecture
```

### Common Pitfalls

**Over-installing plugins:**

- More plugins = more context = higher token usage
- Install only for current work
- Uninstall when done

**Skipping reflection:**

- Reflection catches logical issues before they become bugs
- Memorization preserves learning for future sessions
- Takes seconds, saves hours

**Ignoring CLAUDE.md:**

- Contains project-specific knowledge
- Prevents repeating mistakes
- Ensures consistency

**Not using agents:**

- Agents provide specialized expertise
- Fresh context improves quality
- Parallel execution saves time

**Treating commands as optional:**

- Commands implement scientifically proven techniques
- Each command adds measurable quality improvement
- Use them systematically, not occasionally

### Advanced Techniques

**Custom plugin creation:**

```bash
# Learn from existing plugins
/customaize-agent:create-command
/customaize-agent:create-skill
/customaize-agent:test-prompt
```

**MCP integration:**

```bash
# Load external documentation
/mcp:setup-context7-mcp

# Enable semantic code search
/mcp:setup-serena-mcp

# Build custom integrations
/mcp:build-mcp
```

**Multi-agent workflows:**

```text
# Parallel analysis
Launch 3 software-architect agents with different approaches:
1. Minimal changes approach
2. Clean architecture approach
3. Pragmatic balance approach

# Compare results and choose best
```

**Systematic improvement:**

```bash
# Regular quality cycles
/kaizen:analyse Target high-complexity modules
/reflexion:critique
/kaizen:plan-do-check-act
/reflexion:memorize
```

### Project-Specific Adaptation

**Small projects:**

- Focus on reflexion and code-review plugins
- Skip full SDD workflow for simple features
- Use git plugin for clean commits

**Large projects:**

- Full SDD workflow for complex features
- Multiple specialized agents in parallel
- Comprehensive CLAUDE.md maintenance

**Team projects:**

- Document everything in CLAUDE.md
- Use SDD for shared understanding
- Review all PRs with code-review agents

**Solo projects:**

- Balance quality and velocity
- Use commands judiciously
- Focus on learning and improvement

### Getting Help

**Plugin documentation:**

Each plugin has detailed README in `plugins/<plugin-name>/README.md`:

- Command descriptions
- Usage examples
- Best practices
- Troubleshooting

**Command help:**

```bash
/help
```

Shows all available commands with descriptions.

**Experimentation:**

- Try commands in safe environments
- Use test repositories
- Learn through practice

**Community resources:**

- [Official Claude Code plugins](https://github.com/anthropics/claude-code/tree/main/plugins)
- [Anthropic documentation](https://docs.anthropic.com/)
- [Context Engineering Kit repository](https://github.com/NeoLabHQ/context-engineering-kit)

---

## Next Steps

**Getting started:**

1. [Add the marketplace](#adding-the-marketplace)
2. Install your first plugin (try `reflexion`)
3. Practice with simple commands
4. Gradually add more plugins as needed

**Learn more:**

- [Getting Started Guide](./getting-started.md) - Quick start tutorial
- [Plugin READMEs](./plugins/) - Detailed plugin documentation
- [Contributing Guide](../CONTRIBUTING.md) - Create custom plugins

**Explore plugins:**

Start with these based on your needs:

- **Quality improvement**: `reflexion`, `code-review`
- **Development workflow**: `sdd`, `git`, `docs`
- **Problem analysis**: `kaizen`
- **Custom extensions**: `customaize-agent`
- **Project setup**: `tech-stack`, `ddd`, `mcp`

**Build expertise:**

- Use plugins in real projects
- Experiment with agent-based workflows
- Maintain comprehensive CLAUDE.md
- Share learnings with your team

---

**Questions or feedback?** Open an issue in the [Context Engineering Kit repository](https://github.com/NeoLabHQ/context-engineering-kit).
