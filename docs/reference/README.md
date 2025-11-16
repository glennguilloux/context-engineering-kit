# Reference Documentation

Complete technical reference for the Context Engineering Kit, including all commands, skills, agents, and API specifications.

## What's in This Section

This reference section provides comprehensive documentation for all components of the Context Engineering Kit:

### [Command Index](./command-index.md)

Complete alphabetical listing of all available commands across all plugins, with descriptions and usage patterns.

### [Skill Index](./skill-index.md)

Reference guide for all skills included in the marketplace, describing their purpose and when they're automatically applied.

### [Agent Index](./agent-index.md)

Catalog of all specialized agents available across plugins, with their capabilities and use cases.

### [Plugin Manifest Specification](./plugin-manifest.md)

Technical specification for the `plugin.json` file structure required for creating Claude Code plugins.

### [Marketplace API Reference](./marketplace-api.md)

Documentation for all marketplace-related commands for managing plugin repositories and installations.

## Reference vs. Guides

**Reference documentation** provides comprehensive, technical specifications:
- Command syntax and parameters
- Complete feature lists
- API specifications
- Schema definitions

**Guide documentation** (see `/docs/guides/`) provides:
- Step-by-step tutorials
- Usage examples
- Best practices
- Workflow walkthroughs

## Quick Navigation

### By Plugin Type

**Quality & Review**
- [Reflexion Commands](./command-index.md#reflexion)
- [Code Review Commands](./command-index.md#code-review)

**Development Workflows**
- [Spec-Driven Development Commands](./command-index.md#spec-driven-development-sdd)
- [Test-Driven Development Skills](./skill-index.md#test-driven-development)
- [Subagent-Driven Development Skills](./skill-index.md#subagent-driven-development)

**Git & Project Management**
- [Git Commands](./command-index.md#git)
- [Kaizen Commands](./command-index.md#kaizen)

**Customization & Documentation**
- [Customaize Agent Commands](./command-index.md#customaize-agent)
- [Docs Commands](./command-index.md#docs)

**Configuration**
- [Domain-Driven Development Commands](./command-index.md#domain-driven-development-ddd)
- [Tech Stack Commands](./command-index.md#tech-stack)
- [MCP Commands](./command-index.md#mcp)

## Reference Conventions

Throughout this reference documentation, we use the following conventions:

### Command Syntax

```
/plugin:command [optional-parameter] <required-parameter>
```

- Commands always start with `/`
- Plugin namespace and command name are separated by `:`
- Optional parameters are shown in `[brackets]`
- Required parameters are shown in `<angle-brackets>`

### Command Categories

Commands are categorized by their primary function:

- **Analysis** - Commands that analyze code, issues, or problems
- **Generation** - Commands that create new content or code
- **Review** - Commands that evaluate existing work
- **Configuration** - Commands that set up or modify project settings
- **Documentation** - Commands that create or update documentation

### Skill Behavior

Skills are automatically loaded prompts that modify Claude's behavior:

- **Automatic** - Applied to all interactions after plugin installation
- **Context-aware** - Applied only in relevant situations
- **Framework-specific** - Applied based on detected project technology

### Agent Types

Agents are specialized sub-instances with focused capabilities:

- **Reviewer** - Evaluates code or specifications
- **Explorer** - Navigates and understands codebase
- **Architect** - Designs systems and solutions
- **Auditor** - Checks for specific issues or vulnerabilities

## Finding What You Need

### I want to...

**Review my code**
- See [Code Review Commands](./command-index.md#code-review)
- See [Code Review Agents](./agent-index.md#code-review)

**Improve output quality**
- See [Reflexion Commands](./command-index.md#reflexion)

**Follow a development workflow**
- See [Spec-Driven Development Commands](./command-index.md#spec-driven-development-sdd)
- See [Test-Driven Development Skills](./skill-index.md#test-driven-development)

**Create git commits or PRs**
- See [Git Commands](./command-index.md#git)

**Analyze problems**
- See [Kaizen Commands](./command-index.md#kaizen)

**Create custom commands or skills**
- See [Customaize Agent Commands](./command-index.md#customaize-agent)

**Set up project best practices**
- See [Domain-Driven Development Commands](./command-index.md#domain-driven-development-ddd)
- See [Tech Stack Commands](./command-index.md#tech-stack)

**Integrate MCP servers**
- See [MCP Commands](./command-index.md#mcp)

**Install or manage plugins**
- See [Marketplace API Reference](./marketplace-api.md)

## Version Information

This reference documentation corresponds to Context Engineering Kit version 1.0.0.

All plugins in this marketplace follow semantic versioning (MAJOR.MINOR.PATCH).

## Contributing to Reference Docs

Reference documentation should be:
- **Complete** - Cover all features and parameters
- **Accurate** - Match actual implementation
- **Concise** - Provide just the facts
- **Structured** - Follow consistent format
- **Searchable** - Use clear headings and keywords

For contribution guidelines, see the main [CONTRIBUTING.md](../../CONTRIBUTING.md).
