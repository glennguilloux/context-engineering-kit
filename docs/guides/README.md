# Context Engineering Kit Guides

Practical how-to guides for getting the most out of the Context Engineering Kit plugins.

## Overview

This guides section provides hands-on, practical advice for using CEK plugins effectively in your development workflow. Whether you're working solo or on a team, these guides help you choose the right plugins, combine them effectively, and optimize your AI-assisted development workflow.

## Available Guides

### [Choosing Plugins](./choosing-plugins.md)

Decision framework for selecting the right plugins based on your needs:

- Code quality and review workflows
- Development methodologies (TDD, SDD, DDD)
- Problem-solving and debugging
- Documentation and specification
- Team collaboration patterns

**Start here if:** You're new to CEK and want to know which plugins to install.

### [Combining Plugins](./combining-plugins.md)

Best practices for using multiple plugins together:

- Recommended plugin combinations
- Starter packs for common scenarios
- Plugin compatibility matrix
- Workflow integration patterns

**Start here if:** You want to use multiple plugins together effectively.

### [Custom Workflows](./custom-workflows.md)

How to create custom workflows combining multiple plugins:

- Step-by-step workflow examples
- Command chaining patterns
- When to use commands vs skills
- Creating project-specific workflows

**Start here if:** You want to build repeatable, multi-step workflows.

### [Optimization](./optimization.md)

Tips for optimizing token usage and performance:

- Token-efficient plugin usage
- Commands vs skills trade-offs
- Minimizing context pollution
- Performance best practices

**Start here if:** You're concerned about token usage or performance.

### [Team Workflows](./team-workflows.md)

Patterns for using CEK in team settings:

- Shared CLAUDE.md conventions
- Team plugin standards
- Collaboration patterns
- Onboarding new team members

**Start here if:** Multiple developers on your team use Claude Code.

## Quick Start

### For Individual Developers

1. Read [Choosing Plugins](./choosing-plugins.md) to identify your needs
2. Install recommended plugins for your workflow
3. Review [Optimization](./optimization.md) for token-efficient usage
4. Explore [Custom Workflows](./custom-workflows.md) as you gain experience

### For Teams

1. Establish team conventions using [Team Workflows](./team-workflows.md)
2. Decide on standard plugin set with [Choosing Plugins](./choosing-plugins.md)
3. Create shared workflows from [Combining Plugins](./combining-plugins.md)
4. Document team-specific patterns in shared CLAUDE.md

### For Specific Use Cases

**Code Quality Focus:**
- Start with [Choosing Plugins - Code Quality](./choosing-plugins.md#code-quality-and-review)
- Review [Combining Plugins - Quality Workflow](./combining-plugins.md#code-quality-workflow)

**Spec-Driven Development:**
- Start with [Choosing Plugins - Development Workflow](./choosing-plugins.md#development-workflow)
- Follow [Custom Workflows - SDD](./custom-workflows.md#spec-driven-development-workflow)

**Problem Solving and Debugging:**
- Start with [Choosing Plugins - Problem Solving](./choosing-plugins.md#problem-solving-and-debugging)
- Review [Combining Plugins - Debugging Workflow](./combining-plugins.md#debugging-and-problem-solving-workflow)

## Core Concepts

### Plugins vs Commands vs Skills

**Plugins** are installable packages that provide commands and/or skills:

```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**Commands** are slash commands you invoke explicitly:

```bash
/reflexion:reflect
```

**Skills** are automatically applied context that guide Claude's behavior:

- Loaded automatically when plugin is installed
- Always active in the background
- Influence all of Claude's responses

Learn more in [Optimization - Commands vs Skills](./optimization.md#commands-vs-skills).

### Token Usage

Every plugin adds context to Claude's working memory:

- **Commands**: Only consume tokens when invoked
- **Skills**: Always consume tokens when plugin is installed
- **Agents**: Consume tokens for duration of subagent conversation

See [Optimization](./optimization.md) for detailed token management strategies.

### Plugin Categories

CEK plugins fall into several categories:

1. **Quality & Review**: Code review, reflexion, critique
2. **Development Workflows**: SDD, TDD, SADD, DDD
3. **Problem Solving**: Kaizen, root cause analysis
4. **Documentation**: Docs generation and maintenance
5. **Utilities**: Git operations, tech stack setup, MCP integration
6. **Meta**: Customaize agent for creating your own plugins

## Getting Help

### Common Issues

**"Too many plugins, context is full"**
- See [Optimization - Minimizing Context](./optimization.md#minimizing-context-pollution)
- Review [Choosing Plugins - Decision Tree](./choosing-plugins.md#decision-tree)

**"Don't know which plugins to use together"**
- Check [Combining Plugins](./combining-plugins.md#recommended-combinations)
- Review [Custom Workflows](./custom-workflows.md) for examples

**"Team members using plugins inconsistently"**
- Establish conventions with [Team Workflows](./team-workflows.md)
- Create shared CLAUDE.md standards

### Additional Resources

- [Main README](../../README.md) - Project overview and plugin list
- [Plugin Documentation](../../plugins/) - Individual plugin READMEs
- [Contributing Guide](../../CONTRIBUTING.md) - Creating custom plugins

## Philosophy

These guides emphasize:

**Pragmatism over perfection:**
- Use what works for your specific needs
- Start simple, add complexity as needed
- Not every feature needs every plugin

**Token efficiency:**
- Install only what you need
- Prefer commands over skills when possible
- Remove unused plugins

**Team consistency:**
- Establish clear conventions
- Document team-specific workflows
- Share knowledge through CLAUDE.md

**Continuous improvement:**
- Iterate on workflows
- Measure what works
- Adapt to changing needs

## Contributing

Found a useful workflow or plugin combination? We welcome contributions:

1. Document your workflow clearly
2. Include concrete examples
3. Explain when to use it
4. Submit PR to the repository

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for guidelines.

## Next Steps

Choose your path based on your current needs:

- **New to CEK?** → [Choosing Plugins](./choosing-plugins.md)
- **Want better workflows?** → [Combining Plugins](./combining-plugins.md)
- **Building custom processes?** → [Custom Workflows](./custom-workflows.md)
- **Concerned about tokens?** → [Optimization](./optimization.md)
- **Working on a team?** → [Team Workflows](./team-workflows.md)
