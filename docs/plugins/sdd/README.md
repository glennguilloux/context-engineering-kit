# Spec-Driven Development Plugin

> **Status:** Documentation in progress

## Overview

Comprehensive Spec-Driven Development (SDD) workflow using specialized agents. Based on Github Spec Kit, OpenSpec and BMad Method. Uses specialized agents for effective context management and quality review.

## Installation

```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
```

## Quick Info

**Plugin Type:** Commands
**Key Features:**
- Project constitution setup
- Feature specification generation
- Development planning
- Task creation with complexity analysis
- Implementation execution
- Documentation generation
- Specialized code architect, explorer, and reviewer agents

## Documentation Status

This plugin documentation is currently being written. For now, please refer to:

- [Main Plugin Directory](../README.md) - Overview of all plugins
- [Getting Started Guide](../../getting-started.md) - How to install and use plugins
- [User Guide](../../user-guide.md) - Comprehensive usage guide

## Available Commands

- `/sdd:00-setup` - Create or update the project constitution from interactive or provided principle inputs
- `/sdd:01-specify` - Create or update the feature specification from a natural language feature description
- `/sdd:02-plan` - Plan the feature development based on the feature specification
- `/sdd:03-tasks` - Create detailed implementation tasks from feature plans with complexity analysis
- `/sdd:04-implement` - Execute feature implementation following task list with TDD approach and quality review
- `/sdd:05-document` - Document completed feature implementation with API guides, architecture updates, and lessons learned
- `/sdd:brainstorm` - Refines rough ideas into fully-formed designs through collaborative questioning and exploration

## Available Agents

- **code-architect** - Designs system architecture and technical solutions
- **code-explorer** - Navigates and understands existing codebase structure
- **code-reviewer** - Reviews implementations against specifications and quality standards

## More Information

For the latest information about this plugin, see the main [README.md](../../README.md#spec-driven-development).

---

*This documentation is part of the [Context Engineering Kit](../../README.md) marketplace.*
