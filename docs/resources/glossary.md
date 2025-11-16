# Glossary

Comprehensive reference of terms and concepts used throughout Context Engineering Kit documentation.

## Core Terminology

### Agent

A specialized instance of Claude configured with specific instructions, skills, and context for a particular purpose. Agents can be:

- **Specialized agents** - Focused on specific tasks (e.g., bug-hunter, security-auditor)
- **Subagents** - Temporary agents spawned for isolated tasks
- **Main agent** - The primary Claude instance you interact with

**Example**: The code-review plugin uses six specialized agents (bug-hunter, code-quality-reviewer, contracts-reviewer, historical-context-reviewer, security-auditor, test-coverage-reviewer).

**Related**: [Agent Workflows](../concepts/agent-workflows.md), [Multi-agent Orchestration](./related-projects.md#multi-agent-orchestration)

---

### Claude Code

The official command-line interface (CLI) for interacting with Claude, Anthropic's AI assistant. Supports plugins, commands, skills, and MCP server integration.

**Usage**: `claude` command in terminal

**Related**: [Official Documentation](https://docs.anthropic.com/claude-code)

---

### Command

An explicit instruction prefixed with `/` that triggers specific functionality. Commands are:

- **User-invoked** - You explicitly call them when needed
- **Task-specific** - Designed for particular operations
- **Token-efficient** - Don't consume context when not in use

**Example**: `/reflexion:reflect`, `/git:commit`, `/sdd:01-specify`

**Contrast with**: Skills (always active vs. on-demand)

**Related**: [Command Index](../reference/command-index.md)

---

### Context

The information available to Claude during interaction, including:

- **System prompts** - Base instructions and capabilities
- **Skills** - Always-active guidance and patterns
- **Conversation history** - Previous messages and responses
- **Loaded files** - Files read during the session
- **MCP resources** - External data accessed through MCP servers

**Token limit**: Claude has a maximum context window size (tokens)

**Related**: [Context Engineering](#context-engineering), [Token Efficiency](../concepts/token-efficiency.md)

---

### Context Engineering

The practice of optimizing what information is available to an LLM and how it's structured to improve output quality while minimizing token usage.

**Key principles**:
- Provide relevant information at the right time
- Structure information for easy comprehension
- Minimize unnecessary context pollution
- Use patterns that improve reasoning

**Related**: [Context Engineering Concepts](../concepts/context-engineering.md), [Scientific Basis](../overview/scientific-basis.md)

---

### Hook

A script or command that executes automatically at specific points in a workflow, typically Git hooks (pre-commit, pre-push, etc.).

**CEK usage**: The customaize-agent plugin includes `/customaize-agent:create-hook` for setting up automated testing and quality checks.

**Related**: [Customaize Agent Plugin](../plugins/customaize-agent/)

---

### Marketplace

A repository of plugins that can be added to Claude Code. Marketplaces contain:

- **Plugin metadata** - Descriptions, versions, dependencies
- **Installation sources** - Where to download plugins
- **Update information** - Version tracking

**Example**: `NeoLabHQ/context-engineering-kit` marketplace

**Commands**:
- `/plugin marketplace add <repo>` - Add marketplace
- `/plugin marketplace update <repo>` - Refresh marketplace

---

### MCP (Model Context Protocol)

A standard protocol for connecting LLMs to external data sources and tools. MCP servers expose:

- **Resources** - External data (files, docs, APIs)
- **Tools** - Actions Claude can execute
- **Prompts** - Reusable prompt templates

**Related**: [Recommended MCP Servers](./recommended-mcp.md), [MCP Plugin](../plugins/mcp/)

---

### Plugin

A modular package that adds specific capabilities to Claude Code through:

- **Commands** - User-invoked operations
- **Skills** - Always-active guidance
- **Agents** - Specialized AI instances
- **Hooks** - Automated workflow integration

**Example**: reflexion plugin adds `/reflexion:reflect`, `/reflexion:critique`, and `/reflexion:memorize` commands.

**Installation**: `/plugin install <name>@<marketplace>`

**Related**: [Plugin Overview](../plugins/README.md)

---

### Skill

Always-active context that provides guidance, patterns, or knowledge to Claude. Skills:

- **Load automatically** - Active when plugin is installed
- **Consume tokens** - Always present in context
- **Provide patterns** - Guide behavior without explicit invocation

**Example**: test-driven-development skill provides TDD methodology and anti-patterns.

**Contrast with**: Commands (always active vs. on-demand)

**Related**: [Skill Index](../reference/skill-index.md), [Token Efficiency](../concepts/token-efficiency.md)

---

### Subagent

A fresh instance of Claude spawned for a specific task, isolated from the main agent's context. Benefits:

- **Clean context** - No pollution from previous tasks
- **Specialized focus** - Dedicated to single purpose
- **Quality gates** - Results reviewed before integration

**Used by**: Subagent-Driven Development (SADD) plugin

**Related**: [SADD Plugin](../plugins/sadd/), [Agent Workflows](../concepts/agent-workflows.md)

---

## Development Methodologies

### Agentic Context Engineering

A technique where agents update their own memory/context after reflection, improving performance on subsequent tasks.

**Research**: [Agentic Context Engineering Paper](https://arxiv.org/abs/2510.04618)

**Implementation**: `/reflexion:memorize` command

**Improvement**: 10.6% performance increase over baselines

**Related**: [Reflexion Plugin](../plugins/reflexion/)

---

### Domain-Driven Development (DDD)

Software development approach focusing on:

- **Domain modeling** - Understanding business logic
- **Clean Architecture** - Separation of concerns
- **SOLID principles** - Object-oriented design
- **Design patterns** - Proven solutions to common problems

**CEK Plugin**: [Domain-Driven Development](../plugins/ddd/)

**Commands**: `/ddd:setup-code-formatting`

**Skills**: software-architecture

---

### Kaizen

Japanese philosophy of continuous improvement through:

- **Small incremental changes** - Steady progress
- **Problem analysis** - Root cause identification
- **Waste elimination** - Removing inefficiencies
- **Team involvement** - Collective improvement

**CEK Plugin**: [Kaizen](../plugins/kaizen/)

**Techniques**: Five Whys, Fishbone analysis, PDCA cycle, Gemba Walk

**Related**: [Kaizen Philosophy](../plugins/kaizen/philosophy.md)

---

### Spec-Driven Development (SDD)

Development methodology that starts with detailed specifications before implementation:

1. **Specify** - Define features and requirements
2. **Plan** - Break down implementation approach
3. **Task** - Create detailed implementation tasks
4. **Implement** - Execute with TDD and review
5. **Document** - Update documentation

**CEK Plugin**: [Spec-Driven Development](../plugins/sdd/)

**Workflow**: 6 stages (00-setup through 05-document)

**Related**: [SDD Workflow](../plugins/sdd/workflow.md)

---

### Subagent-Driven Development (SADD)

Development pattern using fresh subagents for each task with quality gates between tasks:

- **Task isolation** - Each task gets clean context
- **Quality review** - Code review before integration
- **Fast iteration** - Parallel task execution possible
- **Quality gates** - Systematic verification

**CEK Plugin**: [Subagent-Driven Development](../plugins/sadd/)

**Related**: [Quality Gates](../concepts/quality-gates.md)

---

### Test-Driven Development (TDD)

Software development approach where tests are written before implementation:

1. **Red** - Write failing test
2. **Green** - Implement minimal code to pass
3. **Refactor** - Improve code quality

**CEK Plugin**: [Test-Driven Development](../plugins/tdd/)

**Benefits**: Better design, fewer bugs, confident refactoring

**Related**: [TDD Methodology](../plugins/tdd/methodology.md)

---

## Context Engineering Concepts

### Chain-of-Thought (CoT)

Prompting technique that asks the LLM to show its reasoning step-by-step, improving accuracy on complex tasks.

**Usage in CEK**: Reflexion commands use CoT for analysis

**Research**: Improves reasoning quality significantly

---

### Constitutional AI (CAI)

Technique where one model generates responses and another critiques them based on defined principles or "constitution."

**Usage in CEK**: `/reflexion:critique` command implements multi-perspective review

**Research**: [Constitutional AI Paper](https://arxiv.org/abs/2212.08073)

---

### Debate / Multi-Agent Debate

Pattern where multiple models or agents propose and critique solutions, arriving at better results through discussion.

**Usage in CEK**: Code review specialized agents, reflexion critique judges

**Research**: [Multi-Agent Debate Paper](https://arxiv.org/abs/2305.14325)

---

### Granular Design

Architecture principle where functionality is broken into small, independent modules that can be loaded selectively.

**CEK Implementation**:
- Each plugin is independent
- No overlap between plugins
- Load only what you need
- Commands preferred over skills

**Related**: [Granular Design Concepts](../concepts/granular-design.md)

---

### LLM-as-a-Judge

Technique where one LLM evaluates or scores outputs from another LLM, enabling automated quality assessment.

**Usage in CEK**: Code review agents, reflexion critique judges

**Research**: [LLM-as-a-Judge Paper](https://arxiv.org/abs/2306.05685)

---

### Quality Gate

A verification point in a workflow where output must meet quality standards before proceeding:

- **Code review** - Between implementation tasks
- **Specification review** - Before planning
- **Test verification** - Before integration
- **Reflexion loops** - After generation

**Related**: [Quality Gates Concepts](../concepts/quality-gates.md)

---

### Reflexion

Self-refinement pattern where an agent:
1. Generates output
2. Reviews and evaluates output
3. Identifies improvements
4. Regenerates with improvements

**Research**: [Reflexion Paper](https://arxiv.org/abs/2303.11366)

**Improvement**: 8-21% quality increase

**CEK Plugin**: [Reflexion](../plugins/reflexion/)

---

### Self-Refinement

Iterative improvement pattern where a model generates output, then reviews and improves its own work.

**Usage in CEK**: `/reflexion:reflect` command

**Research**: [Self-Refine Paper](https://arxiv.org/abs/2305.12966)

---

### Token Efficiency

The practice of minimizing token usage while maintaining or improving output quality:

- **Command over skills** - Load only when needed
- **Granular plugins** - Install only required functionality
- **Lazy loading** - Fetch context on demand
- **Optimized prompts** - Clear, concise instructions

**Related**: [Token Efficiency Concepts](../concepts/token-efficiency.md)

---

### Tree of Thoughts (ToT)

Reasoning pattern that explores multiple possible solution paths with evaluation, like searching a decision tree.

**Usage in CEK**: SDD brainstorming, Kaizen analysis

**Research**: [Tree of Thoughts Paper](https://arxiv.org/abs/2305.10601)

---

## Technical Terms

### Conventional Commits

A standardized format for commit messages with structure:

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Example**: `feat(auth): add OAuth2 integration`

**Usage in CEK**: `/git:commit` command creates conventional commits

**Reference**: [conventionalcommits.org](https://www.conventionalcommits.org/)

---

### CLAUDE.md

A markdown file in the project root containing project-specific context, guidelines, and knowledge for Claude.

**Contents typically include**:
- Project architecture
- Coding standards
- Best practices
- Domain knowledge
- Technology choices

**Updated by**: Multiple CEK commands (/sdd:00-setup, /reflexion:memorize, /tech-stack commands)

---

### Emoji Commit

Commit message style using emoji prefixes for visual categorization:

- 🎨 `:art:` - Code structure/format
- ✨ `:sparkles:` - New feature
- 🐛 `:bug:` - Bug fix
- 📝 `:memo:` - Documentation

**Usage in CEK**: `/git:commit` command supports emoji commits

---

### Git Hook

Script that runs automatically at specific points in Git workflow (pre-commit, pre-push, commit-msg, etc.).

**Usage in CEK**: `/customaize-agent:create-hook` sets up automated testing and checks

---

### GitHub CLI (gh)

Official GitHub command-line tool for interacting with GitHub features.

**Usage in CEK**: `/git:create-pr` uses gh to create pull requests

**Installation**: [GitHub CLI](https://cli.github.com/)

---

### Markdown

Lightweight markup language for formatting text using plain text syntax.

**Usage in CEK**: Documentation, specifications, CLAUDE.md files

**Standard**: CommonMark specification

---

### Pull Request (PR)

A GitHub feature for proposing code changes and requesting review before merging.

**Usage in CEK**:
- `/git:create-pr` - Create pull request
- `/code-review:review-pr` - Review pull request code

---

### Semantic Search

Search technique that finds results based on meaning and context rather than exact keyword matching, typically using vector embeddings.

**Usage in CEK**: Serena MCP server provides semantic code search

**Related**: [Recommended MCP Servers](./recommended-mcp.md#serena)

---

## Acronyms

| Acronym | Full Name | Description |
|---------|-----------|-------------|
| **CAI** | Constitutional AI | Critique-based improvement using principles |
| **CEK** | Context Engineering Kit | This project |
| **CLI** | Command-Line Interface | Text-based program interaction |
| **CoT** | Chain-of-Thought | Step-by-step reasoning pattern |
| **CoVe** | Chain-of-Verification | Generate → verify → revise pattern |
| **DDD** | Domain-Driven Development | Domain-focused architecture approach |
| **GVR** | Generate-Verify-Refine | Three-stage improvement cycle |
| **LLM** | Large Language Model | AI models like Claude |
| **MCP** | Model Context Protocol | Standard for external tool integration |
| **PDCA** | Plan-Do-Check-Act | Iterative improvement cycle |
| **PR** | Pull Request | Code review and merge proposal |
| **PRM** | Process Reward Models | Step-by-step reasoning evaluation |
| **RLAIF** | Reinforcement Learning from AI Feedback | Training with AI critiques |
| **SADD** | Subagent-Driven Development | Fresh agents with quality gates |
| **SDD** | Spec-Driven Development | Spec-Driven (specification-first) development |
| **SOLID** | Single Responsibility, Open-Closed, Liskov Substitution, Interface Segregation, Dependency Inversion | Object-oriented design principles |
| **TDD** | Test-Driven Development | Test-first development approach |
| **ToT** | Tree of Thoughts | Multiple reasoning path exploration |

---

## Quick Reference

### Common Command Patterns

```bash
# Plugin management
/plugin                           # List plugins
/plugin install <name>@<repo>     # Install plugin
/plugin marketplace add <repo>    # Add marketplace

# Reflexion workflow
/reflexion:reflect                # Review and improve
/reflexion:critique               # Multi-perspective review
/reflexion:memorize               # Update CLAUDE.md

# Git workflow
/git:commit                       # Create commit
/git:create-pr                    # Create pull request

# SDD workflow
/sdd:00-setup                     # Project setup
/sdd:01-specify                   # Create specification
/sdd:02-plan                      # Plan implementation
/sdd:03-tasks                     # Generate tasks
/sdd:04-implement                 # Execute implementation
/sdd:05-document                  # Update documentation
```

### Key File Locations

```
project-root/
├── CLAUDE.md              # Project context for Claude
├── .claude/               # Claude Code configuration
│   └── skills/            # Custom skills
├── .github/
│   └── workflows/         # CI/CD pipelines
└── docs/                  # Project documentation
```

---

## See Also

- [Core Concepts](../concepts/) - Deep dives into key principles
- [Plugin Documentation](../plugins/) - Detailed plugin references
- [Command Index](../reference/command-index.md) - All available commands
- [Research Papers](../research/papers.md) - Academic foundations

---

**Can't find a term?** Submit a request via [GitHub Issues](https://github.com/NeoLabHQ/context-engineering-kit/issues) to have it added to the glossary.
