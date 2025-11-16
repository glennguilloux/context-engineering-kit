# Getting Started with Context Engineering Kit

Welcome to the Context Engineering Kit! This guide will help you get up and running in 5-10 minutes with advanced context engineering plugins that meaningfully improve your Claude Code agent's results.

## What is Context Engineering Kit?

The Context Engineering Kit is a curated marketplace of Claude Code plugins that implement scientifically-proven context engineering techniques to improve agent quality. For a comprehensive overview, see [What is CEK](overview/what-is-cek.md).

## Prerequisites

Before you begin, ensure you have:

1. **Claude Code installed** - The official CLI tool from Anthropic
   - If not installed, visit [Claude Code documentation](https://docs.anthropic.com/claude/docs/claude-code) for installation instructions

2. **A project to work with** - Any existing codebase or project directory
   - The plugins work best with established codebases where patterns can be learned
   - For new projects, plugins like SDD (Spec-Driven Development) help establish good patterns from the start

3. **Git repository** (recommended) - Many plugins integrate with Git workflows
   - Not strictly required but enhances functionality for plugins like Git, Code Review, and SDD

## Quick Start: Three Steps to Better Results

### Step 1: Add the Marketplace

First, launch Claude Code in your project directory:

```bash
cd /path/to/your/project
claude
```

Then add the Context Engineering Kit marketplace to make all plugins available:

```bash
/plugin marketplace add NeoLabHQ/context-engineering-kit
```

**What happens:**
- The marketplace metadata is downloaded and cached locally
- All available plugins become visible in your plugin list
- No plugins are installed yet - this only makes them available
- No agents, commands, or skills are loaded - your context remains clean

**Verify it worked:**

```bash
/plugin
```

You should see a list of available plugins from the marketplace, including reflexion, code-review, git, sdd, and others.

### Step 2: Install Your First Plugin

We recommend starting with the **Reflexion plugin** - it introduces feedback and refinement loops that improve output quality by 8-21% according to benchmark studies.

```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**What happens:**
- The Reflexion plugin is installed in your Claude Code environment
- Three new commands become available: `/reflexion:reflect`, `/reflexion:memorize`, `/reflexion:critique`
- Plugin-specific skills and agents are loaded into Claude's context
- The plugin is now ready to use in your current and future sessions

**Verify it worked:**

```bash
/plugin
```

You should see `reflexion@NeoLabHQ/context-engineering-kit` marked as installed.

### Step 3: Use Your First Command

Now let's see Reflexion in action. Inside Claude Code, ask Claude to help with something:

```
Suggest how to improve the error handling in this project
```

Claude will provide an initial response. Now, use Reflexion to improve that response:

```bash
/reflexion:reflect
```

**What happens:**
Claude reviews its previous response using self-refinement techniques, identifies areas for improvement, and generates an enhanced version with deeper analysis.

**Expected result:**
Claude will analyze its previous response critically, identify specific improvements (e.g., "I should have considered error propagation patterns"), and provide an enhanced response with more detail and better recommendations.

**Try the memorize command:**

```bash
/reflexion:memorize
```

**What happens:**
Claude identifies key learnings from the interaction, updates your project's `CLAUDE.md` file with curated insights, and builds a knowledge base that future Claude sessions can leverage.

## What's Next?

Now that you've experienced the power of context engineering, here are recommended next steps:

### Learn More About Available Plugins

Explore the full plugin catalog to find tools that match your workflow:

- **[Plugins Directory](plugins/)** - Detailed documentation for each plugin
- **[Plugin Overview](plugins/README.md)** - Comparison guide to help you choose

**Popular plugins to explore next:**

- **[Code Review](plugins/code-review/README.md)** - Multi-agent code review with specialized reviewers (security, bugs, quality, tests)
- **[Git](plugins/git/README.md)** - Streamlined Git workflows, commit creation, PR management
- **[Spec-Driven Development](plugins/sdd/README.md)** - Complete 6-stage workflow from specification to documentation
- **[Test-Driven Development](plugins/tdd/README.md)** - TDD best practices and anti-pattern detection
- **[Kaizen](plugins/kaizen/README.md)** - Root cause analysis using Five Whys, Fishbone diagrams, PDCA cycles

### Understand Core Concepts

Deepen your understanding of how the marketplace works:

- **[User Guide](./user-guide.md)** - Complete guide to using the marketplace
- **[Context Engineering Concepts](./concepts/)** - Learn about the techniques behind the plugins
- **[Plugin Architecture](./overview/architecture.md)** - How plugins maintain minimal token footprint

### Follow Workflow Guides

Learn proven workflows for common development tasks:

- **[Choosing Plugins](./guides/choosing-plugins.md)** - Guide to selecting the right plugins for your needs
- **[Combining Plugins](./guides/combining-plugins.md)** - Using multiple plugins together effectively
- **[Custom Workflows](./guides/custom-workflows.md)** - Creating tailored development workflows

### Install Additional Plugins

Install plugins that match your development workflow:

```bash
# For comprehensive code review
/plugin install code-review@NeoLabHQ/context-engineering-kit

# For streamlined Git operations
/plugin install git@NeoLabHQ/context-engineering-kit

# For Spec-Driven Development
/plugin install sdd@NeoLabHQ/context-engineering-kit

# For continuous improvement analysis
/plugin install kaizen@NeoLabHQ/context-engineering-kit

# For test-driven development
/plugin install tdd@NeoLabHQ/context-engineering-kit
```

### Keep Your Marketplace Updated

Periodically refresh the marketplace to get the latest plugins and updates:

```bash
/plugin marketplace update NeoLabHQ/context-engineering-kit
```

## Common First-Time Issues

### Issue: "Marketplace not found" or "Failed to add marketplace"

**Cause:** Network connectivity or incorrect marketplace name

**Solution:**
1. Check your internet connection
2. Verify the exact marketplace name: `NeoLabHQ/context-engineering-kit`
3. Ensure Claude Code is up to date: check for updates
4. Try again with the exact command:
   ```bash
   /plugin marketplace add NeoLabHQ/context-engineering-kit
   ```

### Issue: "Plugin not found" when installing

**Cause:** Marketplace not added or plugin name typo

**Solution:**
1. Verify the marketplace is added:
   ```bash
   /plugin marketplace list
   ```
2. Check available plugins:
   ```bash
   /plugin
   ```
3. Use the exact plugin name with marketplace suffix:
   ```bash
   /plugin install reflexion@NeoLabHQ/context-engineering-kit
   ```

### Issue: Commands not appearing after installation

**Cause:** Plugin installed but commands not loaded in current session

**Solution:**
1. Verify plugin is installed:
   ```bash
   /plugin
   ```
2. If installed, try restarting Claude Code:
   ```bash
   exit
   claude
   ```
3. Check that the plugin name matches exactly (case-sensitive)

### Issue: "Not enough context" or poor plugin results

**Cause:** Plugins work best with adequate codebase context

**Solution:**
1. Ensure you're running Claude Code from your project root directory
2. Let Claude read relevant files before using commands
3. For new projects, establish patterns first before using advanced plugins
4. Some plugins (like Code Review, SDD) require existing code to analyze

### Issue: Too many tokens used / Context too full

**Cause:** Multiple plugins loaded simultaneously

**Solution:**
1. The marketplace is designed to minimize token usage - each plugin loads only its specific functionality
2. Install only the plugins you actively use for your current task
3. Uninstall unused plugins:
   ```bash
   /plugin uninstall <plugin-name>@NeoLabHQ/context-engineering-kit
   ```
4. Prefer commands over skills - commands load context only when invoked

### Issue: Reflexion commands not improving results

**Cause:** Initial response was already high quality or lacked specific context

**Solution:**
1. Use Reflexion on complex tasks where initial responses may miss details
2. Provide more context before the initial request
3. Use `/reflexion:critique` for comprehensive multi-perspective review
4. Try `/reflexion:memorize` to build project-specific knowledge over time

## Understanding Plugin Types

The Context Engineering Kit includes several categories of plugins:

### Quality Improvement Plugins
- **Reflexion** - Self-refinement and feedback loops
- **Code Review** - Multi-agent code quality analysis
- **Kaizen** - Root cause analysis and continuous improvement

### Development Workflow Plugins
- **Spec-Driven Development** - Complete feature development workflow
- **Test-Driven Development** - TDD methodology and best practices
- **Subagent-Driven Development** - Task delegation with quality gates
- **Domain-Driven Development** - DDD principles and Clean Architecture

### Automation Plugins
- **Git** - Streamlined Git operations
- **Docs** - Documentation generation and updates
- **Tech Stack** - Framework-specific best practices setup

### Customization Plugins
- **Customaize Agent** - Create your own commands, skills, and hooks
- **MCP** - Model Context Protocol server integration

## Tips for Success

1. **Start small** - Begin with one or two plugins (Reflexion is ideal) and expand as you learn
2. **Read plugin docs** - Each plugin has detailed documentation with usage examples
3. **Use commands strategically** - Commands load context on-demand; use them when needed
4. **Build project knowledge** - Use `/reflexion:memorize` to accumulate insights in CLAUDE.md
5. **Combine plugins** - Many plugins work well together (e.g., SDD + TDD + Code Review)
6. **Keep marketplace updated** - Run `/plugin marketplace update` monthly for latest improvements
7. **Experiment** - Try different plugins for different tasks to find your ideal workflow

## Getting Help

- **Plugin Documentation**: Each plugin has detailed README in the `docs/plugins/` directory
- **User Guide**: Comprehensive guide at `docs/user-guide.md`
- **Research Papers**: Learn about the science behind plugins in `docs/research/`
- **Contributing**: See `CONTRIBUTING.md` to suggest improvements or add plugins

## Next Steps

Ready to dive deeper? Here's your recommended learning path:

1. **Complete the [User Guide](./user-guide.md)** - Learn all marketplace features
2. **Explore [Plugin Documentation](plugins/)** - Understand what each plugin offers
3. **Study [Core Concepts](./concepts/)** - Learn the techniques that make plugins effective
4. **Follow [Workflow Guides](./guides/)** - Apply plugins to real development scenarios
5. **Review [Research Papers](./research/)** - Understand the science and benchmarks

Welcome to better AI-assisted development with Context Engineering Kit!
