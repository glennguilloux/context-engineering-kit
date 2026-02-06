# Spec-Driven Development (SDD) Plugin

Comprehensive specification-driven development workflow that transforms vague ideas into production-ready implementations through structured planning, architecture design, and quality-gated execution.

Focused on:

- **Specification-first development** - Define what to build before how to build it
- **Multi-agent architecture** - Specialized agents for analysis, design, and implementation
- **Iterative refinement** - Continuous validation and quality gates at each stage
- **Documentation-driven** - Generate living documentation alongside implementation

## Plugin Target

- Reduce implementation rework - detailed specs catch issues before code is written
- Improve architecture decisions - structured exploration of alternatives with trade-offs
- Maintain project consistency - constitution and templates ensure uniform standards
- Enable complex feature development - break down large features into manageable, testable tasks

## Overview

The SDD plugin implements a structured software development methodology based on GitHub Spec Kit, OpenSpec, and the BMad Method. It uses specialized AI agents to guide you through the complete development lifecycle: from initial brainstorming through specification, architecture design, task breakdown, implementation, and documentation.

The workflow ensures that every feature is thoroughly specified, properly architected, and systematically implemented with quality gates at each stage. Each phase produces concrete artifacts (specification files, architecture documents, task lists) that serve as the source of truth for subsequent phases.


## Quick Start

```bash
# Install the plugin
/plugin install sdd@NeoLabHQ/context-engineering-kit

# Set up project standards (one-time)
/sdd:00-setup Use TypeScript, follow SOLID principles and Clean Architecture

# Start a new feature
/sdd:01-specify Add user authentication with OAuth2 providers

# Plan the architecture
/sdd:02-plan Use Passport.js for OAuth, prioritize security

# Create implementation tasks
/sdd:03-tasks Use TDD approach, prioritize MVP features

# Execute the implementation
/sdd:04-implement Focus on test coverage and error handling

# Document the feature
/sdd:05-document Include API examples and integration guide
```

[Usage Examples](./usage-examples.md)


## Workflow Diagram

```
┌─────────────────────────────────────────────┐
│ 1. Setup Project Standards                  │
│    /sdd:00-setup                            │
│    (create specs/constitution.md)           │
└────────────────────┬────────────────────────┘
                     │
                     │ project principles established
                     ▼
┌─────────────────────────────────────────────┐
│ 2. Create Specification                     │ ◀─── clarify requirements ───┐
│    /sdd:01-specify                          │                              │
│    (create specs/<feature>/spec.md)         │                              │
└────────────────────┬────────────────────────┘                              │
                     │                                                       │
                     │ validated specification                               │
                     ▼                                                       │
┌─────────────────────────────────────────────┐                              │
│ 3. Plan Architecture                        │──────────────────────────────┘
│    /sdd:02-plan                             │◀─── refine architecture ─────┐
│    (create plan.md, design.md, research.md) │                              │
└────────────────────┬────────────────────────┘                              │
                     │                                                       │
                     │ approved architecture                                 │
                     ▼                                                       │
┌─────────────────────────────────────────────┐                              │
│ 4. Break Down into Tasks                    │──────────────────────────────┘
│    /sdd:03-tasks                            │
│    (create tasks.md)                        │
└────────────────────┬────────────────────────┘
                     │
                     │ executable task list
                     ▼
┌─────────────────────────────────────────────┐
│ 5. Implement Tasks                          │ ◀─── fix issues ─────────────┐
│    /sdd:04-implement                        │                              │
│    (write code, run tests)                  │                              │
└────────────────────┬────────────────────────┘                              │
                     │                                                       │
                     │ working implementation                                │
                     ▼                                                       │
┌─────────────────────────────────────────────┐                              │
│ 6. Quality Review                           │──────────────────────────────┘
│    (automatic in /sdd:04-implement)         │
└────────────────────┬────────────────────────┘
                     │
                     │ approved changes
                     ▼
┌─────────────────────────────────────────────┐
│ 7. Document Changes                         │
│    /sdd:05-document                         │
│    (update docs/ directory)                 │
└─────────────────────────────────────────────┘
```


## Commands

- [/sdd:00-setup](./00-setup.md) - Project Constitution Setup
- [/sdd:01-specify](./01-specify.md) - Feature Specification
- [/sdd:02-plan](./02-plan.md) - Architecture Planning
- [/sdd:03-tasks](./03-tasks.md) - Task Generation
- [/sdd:04-implement](./04-implement.md) - Feature Implementation
- [/sdd:05-document](./05-document.md) - Feature Documentation
- [/sdd:create-ideas](./create-ideas.md) - Idea Generation
- [/sdd:brainstorm](./brainstorm.md) - Idea Refinement



## Available Agents

The SDD plugin uses specialized agents for different phases of development:

| Agent | Description | Used By |
|-------|-------------|---------|
| `business-analyst` | Requirements discovery, stakeholder analysis, specification writing | `/sdd:01-specify` |
| `researcher` | Technology research, dependency analysis, best practices | `/sdd:02-plan` |
| `code-explorer` | Codebase analysis, pattern identification, architecture mapping | `/sdd:02-plan` |
| `software-architect` | Architecture design, component design, implementation planning | `/sdd:02-plan` |
| `tech-lead` | Task decomposition, dependency mapping, sprint planning | `/sdd:03-tasks` |
| `developer` | Code implementation, TDD execution, quality review | `/sdd:04-implement` |
| `tech-writer` | Documentation creation, API guides, architecture docs | `/sdd:05-document` |

## Theoretical Foundation

The SDD plugin is based on established software engineering methodologies and research:

### Core Methodologies

- **[GitHub Spec Kit](https://github.com/github/spec-kit)** - Specification-driven development templates and workflows
- **OpenSpec** - Open specification format for software requirements
- **BMad Method** - Structured approach to breaking down complex features

### Supporting Research

- **[Specification-Driven Development](https://en.wikipedia.org/wiki/Design_by_contract)** - Design by contract and formal specification approaches
- **[Agile Requirements Engineering](https://www.agilealliance.org/agile101/)** - User stories, acceptance criteria, and iterative refinement
- **[Test-Driven Development](https://www.agilealliance.org/glossary/tdd/)** - Writing tests before implementation
- **[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)** - Separation of concerns and dependency inversion
- **[Vertical Slice Architecture](https://jimmybogard.com/vertical-slice-architecture/)** - Feature-based organization for incremental delivery
- **[Verbalized Sampling](https://arxiv.org/abs/2510.01171)** - Training-free prompting strategy for diverse idea generation. Achieves **2-3x diversity improvement** while maintaining quality. Used for `create-ideas`, `brainstorm` and `plan` commands

