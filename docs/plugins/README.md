# Plugins Documentation

This directory contains comprehensive documentation for all 12 plugins in the Context Engineering Kit. Each plugin is designed to enhance Claude Code with specific capabilities focused on code quality, development workflows, and continuous improvement.

## Quick Navigation

- [Reflexion](#reflexion) - Self-refinement and iterative improvement
- [Code Review](#code-review) - Multi-agent code quality analysis
- [Git](#git) - Streamlined Git operations
- [Test-Driven Development](#test-driven-development) - TDD methodology and best practices
- [Subagent-Driven Development](#subagent-driven-development) - Task delegation with quality gates
- [Domain-Driven Development](#domain-driven-development) - Code quality and architecture patterns
- [Spec-Driven Development](#spec-driven-development) - Spec-Driven workflow
- [Kaizen](#kaizen) - Continuous improvement and root cause analysis
- [Customaize Agent](#customaize-agent) - Create and refine Claude Code extensions
- [Docs](#docs) - Documentation management
- [Tech Stack](#tech-stack) - Language and framework best practices
- [MCP](#mcp) - Model Context Protocol integration

## Overview by Category

### Quality & Refinement

#### Reflexion
Self-refinement framework that introduces feedback and refinement loops to improve output quality.

**Key Features:**
- Reflect on previous responses
- Multi-perspective critique with debate
- Memory updates with insights

**When to use:** After completing any task to verify quality and identify improvements.

[Full Documentation](./reflexion/) | [Quick Start](./reflexion/README.md#quick-start)

#### Code Review
Comprehensive code review using multiple specialized agents for thorough quality evaluation.

**Key Features:**
- Multi-agent review (bug hunter, security auditor, test coverage reviewer, etc.)
- Local changes review
- Pull request review

**When to use:** Before committing changes or creating pull requests.

[Full Documentation](./code-review/) | [Quick Start](./code-review/README.md#quick-start)

### Development Workflows

#### Test-Driven Development
TDD methodology with anti-pattern detection and testing best practices.

**Key Features:**
- TDD workflow guidance
- Common anti-patterns awareness
- Testing subagent skills

**When to use:** When implementing new features with test-first approach.

[Full Documentation](./tdd/) | [Quick Start](./tdd/README.md#quick-start)

#### Subagent-Driven Development
Task delegation pattern that dispatches fresh subagents with quality gates between tasks.

**Key Features:**
- Fresh context for each task
- Code review between tasks
- Fast iteration with quality control

**When to use:** For complex features requiring multiple independent tasks.

[Full Documentation](./sadd/) | [Quick Start](./sadd/README.md#quick-start)

#### Spec-Driven Development
Comprehensive Spec-Driven Development workflow using specialized agents for each phase.

**Key Features:**
- Complete workflow: setup → specify → plan → tasks → implement → document
- Multiple specialized agents (architect, explorer, reviewer, etc.)
- Constitution-based development

**When to use:** For complex features requiring detailed specifications and planning.

[Full Documentation](./sdd/) | [Quick Start](./sdd/README.md#quick-start)

### Code Quality & Architecture

#### Domain-Driven Development
Code quality and architecture patterns including Clean Architecture and SOLID principles.

**Key Features:**
- Code formatting setup
- Architecture patterns
- Design principles

**When to use:** Setting up new projects or enforcing code quality standards.

[Full Documentation](./ddd/) | [Quick Start](./ddd/README.md#quick-start)

### Process & Analysis

#### Git
Streamlined Git operations with conventional commits and pull request management.

**Key Features:**
- Conventional commits with emoji
- Pull request creation
- Issue analysis and loading

**When to use:** For all Git operations to maintain commit and PR quality.

[Full Documentation](./git/) | [Quick Start](./git/README.md#quick-start)

#### Kaizen
Continuous improvement methodology with multiple root cause analysis techniques.

**Key Features:**
- Auto-selected analysis methods
- Five Whys analysis
- A3 problem solving
- PDCA cycle

**When to use:** Investigating issues, bugs, or process improvements.

[Full Documentation](./kaizen/) | [Quick Start](./kaizen/README.md#quick-start)

### Customization & Setup

#### Customaize Agent
Tools for creating and refining Claude Code commands, skills, and hooks.

**Key Features:**
- Command creation assistant
- Skill development guide
- Prompt testing framework
- Anthropic best practices

**When to use:** Creating custom plugins or extending Claude Code.

[Full Documentation](./customaize-agent/) | [Quick Start](./customaize-agent/README.md#quick-start)

#### Docs
Project analysis and documentation management commands.

**Key Features:**
- Documentation updates
- Implementation tracking

**When to use:** After completing development phases to update documentation.

[Full Documentation](./docs/) | [Quick Start](./docs/README.md#quick-start)

#### Tech Stack
Language and framework-specific best practices setup.

**Key Features:**
- TypeScript best practices
- Framework-specific guidelines

**When to use:** Setting up new projects or enforcing language-specific standards.

[Full Documentation](./tech-stack/) | [Quick Start](./tech-stack/README.md#quick-start)

#### MCP
Model Context Protocol server integration and setup.

**Key Features:**
- Context7 MCP setup
- Serena MCP setup
- MCP server development guide

**When to use:** Integrating external services with Claude Code.

[Full Documentation](./mcp/) | [Quick Start](./mcp/README.md#quick-start)

## Installation

All plugins follow the same installation pattern:

```bash
# Add the marketplace (one-time setup)
/plugin marketplace add NeoLabHQ/context-engineering-kit

# Install a specific plugin
/plugin install <plugin-name>@NeoLabHQ/context-engineering-kit
```

See individual plugin documentation for specific installation commands and verification steps.

## Common Workflows

### Starting a New Feature

1. **Setup** - Use [SDD](./sdd/) to specify and plan the feature
2. **Implement** - Use [TDD](./tdd/) or [SADD](./sadd/) for implementation
3. **Review** - Use [Code Review](./code-review/) to verify quality
4. **Commit** - Use [Git](./git/) to create proper commits
5. **Reflect** - Use [Reflexion](./reflexion/) to identify improvements
6. **Document** - Use [Docs](./docs/) to update documentation

### Investigating an Issue

1. **Analyze** - Use [Kaizen](./kaizen/) for root cause analysis
2. **Fix** - Implement the solution with [TDD](./tdd/)
3. **Review** - Verify with [Code Review](./code-review/)
4. **Commit** - Use [Git](./git/) to create descriptive commits

### Setting Up a New Project

1. **Architecture** - Use [DDD](./ddd/) for architecture patterns
2. **Tech Stack** - Use [Tech Stack](./tech-stack/) for language-specific practices
3. **Constitution** - Use [SDD](./sdd/) to set up project principles
4. **MCP** - Use [MCP](./mcp/) to integrate external services

## Scientific Foundation

Many plugins are based on peer-reviewed research and proven techniques:

- **Reflexion**: Self-Refine, Constitutional AI, LLM-as-a-Judge, Multi-Agent Debate
- **Kaizen**: Lean manufacturing, Agile methodologies, A3 problem solving
- **SDD**: GitHub Spec Kit, OpenSpec, BMad Method
- **Customaize Agent**: Anthropic Best Practices, Agent Persuasion Principles

See individual plugin documentation for specific research citations and effectiveness metrics.

## Support & Contribution

For issues, questions, or contributions, please visit the [GitHub repository](https://github.com/NeoLabHQ/context-engineering-kit).
