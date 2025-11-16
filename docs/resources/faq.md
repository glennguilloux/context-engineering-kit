# Frequently Asked Questions (FAQ)

Answers to common questions about Context Engineering Kit installation, usage, and troubleshooting.

## Table of Contents

- [Getting Started](#getting-started)
- [Installation & Setup](#installation--setup)
- [Plugin Selection](#plugin-selection)
- [Usage & Workflows](#usage--workflows)
- [Troubleshooting](#troubleshooting)
- [Performance & Optimization](#performance--optimization)
- [Integration & Compatibility](#integration--compatibility)
- [Advanced Usage](#advanced-usage)

---

## Getting Started

### What is Context Engineering Kit?

Context Engineering Kit (CEK) is a curated collection of scientifically-proven context engineering techniques packaged as Claude Code plugins. Each plugin improves AI agent output quality through structured workflows, quality gates, and optimized prompts.

**Key benefits**:
- 8-21% improvement in output quality (benchmarked)
- Token-efficient design
- Modular architecture (install only what you need)
- Research-backed techniques

**Learn more**: [What is CEK?](../overview/what-is-cek.md)

---

### Do I need to install all plugins?

No. CEK is designed for granular installation—install only the plugins you need.

**Recommended starting points**:
- **New users**: Start with [Reflexion](../plugins/reflexion/) for immediate quality improvements
- **Development teams**: Add [Spec-Driven Development](../plugins/sdd/) for structured workflows
- **Code quality focus**: Install [Code Review](../plugins/code-review/) for comprehensive analysis

**See**: [Choosing Plugins Guide](../guides/choosing-plugins.md)

---

### How is CEK different from other Claude plugins?

CEK distinguishes itself through:

1. **Scientific validation** - Every technique backed by research papers and benchmarks
2. **Token optimization** - Commands over skills, granular loading
3. **Quality focus** - Measurable improvements in output quality
4. **No redundancy** - Plugins don't overlap or duplicate functionality
5. **Integration** - Combines best ideas from multiple projects

**Compare**: [Related Projects](./related-projects.md)

---

### Is CEK free to use?

Yes. Context Engineering Kit is open source under the MIT License.

**Costs you may incur**:
- Claude API usage (charged by Anthropic)
- MCP server API keys (some services like Perplexity have paid tiers)
- No additional cost for CEK itself

---

## Installation & Setup

### How do I install Context Engineering Kit?

Three-step process:

```bash
# 1. Open Claude Code
claude

# 2. Add the marketplace
/plugin marketplace add NeoLabHQ/context-engineering-kit

# 3. Install desired plugins
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**Full guide**: [Getting Started](../getting-started.md)

---

### Can I install CEK plugins without adding the marketplace?

No. You must add the marketplace first to make plugins available. The marketplace contains plugin metadata and installation sources.

Adding the marketplace doesn't load any plugins into context—it only makes them available for installation.

---

### How do I update installed plugins?

Update the marketplace to get latest plugin versions:

```bash
/plugin marketplace update NeoLabHQ/context-engineering-kit
```

Then reinstall plugins to get updates:

```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**Note**: Reinstalling replaces the existing version.

---

### What are the system requirements?

**Required**:
- Claude Code CLI installed
- Active Anthropic API key
- Internet connection for marketplace access

**Recommended**:
- Node.js 18+ (for MCP servers)
- Git (for git plugin functionality)
- GitHub CLI (for PR creation)

**Platform support**: Linux, macOS, Windows (via WSL)

---

### How do I uninstall a plugin?

Currently, you need to manually remove plugin files from Claude Code's plugin directory. Future versions will support:

```bash
/plugin uninstall <plugin-name>
```

**Workaround**: Remove plugin directory from `~/.claude/plugins/`

---

## Plugin Selection

### Which plugins should I start with?

Depends on your primary goal:

**For immediate quality improvements**:
- [Reflexion](../plugins/reflexion/) - Self-refinement loops

**For structured development**:
- [Spec-Driven Development](../plugins/sdd/) - Complete workflow
- [Git](../plugins/git/) - Commit and PR management

**For code quality**:
- [Code Review](../plugins/code-review/) - Multi-agent review
- [Test-Driven Development](../plugins/tdd/) - TDD methodology

**For problem analysis**:
- [Kaizen](../plugins/kaizen/) - Root cause analysis

**See**: [Plugin Comparison Matrix](../guides/choosing-plugins.md)

---

### Can I use multiple plugins together?

Yes. Plugins are designed to work together. Common combinations:

**Quality-focused workflow**:
```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install tdd@NeoLabHQ/context-engineering-kit
```

**Complete SDD workflow**:
```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
```

**See**: [Combining Plugins Guide](../guides/combining-plugins.md)

---

### Do plugins conflict with each other?

No. CEK plugins are designed with no overlap:

- Each plugin has unique commands
- Skills are domain-specific
- Agents have distinct roles
- No duplicate functionality

This granular design ensures plugins complement rather than conflict.

---

### How do I know what each plugin does?

Each plugin has comprehensive documentation:

```bash
# View all available plugins
/plugin

# Then read documentation
```

**Or browse**:
- [Plugin Overview](../plugins/README.md)
- Individual plugin pages in docs

---

## Usage & Workflows

### How do I use a plugin after installation?

Plugins provide commands you invoke explicitly:

```bash
# Example: Reflexion plugin
/reflexion:reflect           # Review and improve output
/reflexion:critique          # Multi-perspective review
/reflexion:memorize          # Update project knowledge
```

Some plugins also add skills that activate automatically when relevant.

**See**: [Command Index](../reference/command-index.md)

---

### What's the difference between commands and skills?

**Commands**:
- User-invoked with `/command-name`
- Execute specific operations
- Don't consume tokens when not in use
- Preferred for token efficiency

**Skills**:
- Always active when plugin installed
- Provide continuous guidance
- Consume tokens constantly
- Used for fundamental patterns

**Rule of thumb**: CEK prefers commands over skills for token efficiency.

**Learn more**: [Glossary](./glossary.md)

---

### How do I integrate CEK into my existing workflow?

Start small and expand:

1. **Phase 1**: Add reflexion to existing workflow
   ```bash
   # After completing any task
   /reflexion:reflect
   ```

2. **Phase 2**: Add code review before commits
   ```bash
   /code-review:review-local-changes
   /git:commit
   ```

3. **Phase 3**: Adopt full SDD workflow for new features
   ```bash
   /sdd:01-specify "New feature description"
   /sdd:02-plan
   /sdd:03-tasks
   /sdd:04-implement
   /sdd:05-document
   ```

**See**: [Team Workflow Patterns](../guides/team-workflows.md)

---

### Can I create custom commands?

Yes. Use the Customaize Agent plugin:

```bash
/plugin install customaize-agent@NeoLabHQ/context-engineering-kit

# Create custom command
/customaize-agent:create-command

# Create custom skill
/customaize-agent:create-skill
```

**Guide**: [Creating Custom Commands](../plugins/customaize-agent/creating-commands.md)

---

### How do I update CLAUDE.md effectively?

CLAUDE.md stores project-specific context. Update it through:

**Automated updates** (recommended):
```bash
/reflexion:memorize                    # After insights
/sdd:00-setup                          # Project constitution
/tech-stack:add-typescript-best-practices  # Best practices
```

**Manual updates**:
Edit CLAUDE.md directly with:
- Architecture decisions
- Coding standards
- Domain knowledge
- Technology choices

**Best practice**: Keep CLAUDE.md under 2000 tokens for efficiency.

---

## Troubleshooting

### Claude doesn't recognize my commands

**Possible causes**:

1. **Plugin not installed**
   ```bash
   # Check installed plugins
   /plugin

   # Install if missing
   /plugin install <name>@NeoLabHQ/context-engineering-kit
   ```

2. **Typo in command name**
   - Commands are case-sensitive
   - Use exact syntax: `/plugin:command`

3. **Marketplace not added**
   ```bash
   /plugin marketplace add NeoLabHQ/context-engineering-kit
   ```

---

### Plugin commands aren't working as expected

**Debugging steps**:

1. **Verify installation**
   ```bash
   /plugin
   # Confirm plugin appears in list
   ```

2. **Check command syntax**
   - Review [Command Index](../reference/command-index.md)
   - Ensure correct parameters

3. **Review context size**
   - Large context may affect performance
   - Try shorter prompts or fewer skills loaded

4. **Restart Claude Code**
   ```bash
   exit
   claude
   ```

---

### Code review is missing issues I can see

**Possible reasons**:

1. **Limited context** - Code review agents can only analyze what's in context
   - Solution: Ensure relevant files are loaded

2. **Specialized knowledge needed** - Some issues require domain expertise
   - Solution: Use CLAUDE.md to provide domain context

3. **New patterns not in training** - Emerging patterns may not be recognized
   - Solution: Update CLAUDE.md with project-specific patterns

**Enhancement**: Combine with MCP servers for broader context.

---

### Reflexion isn't improving output quality

**Troubleshooting**:

1. **Insufficient initial quality** - If first output is very poor, reflexion has limited starting point
   - Solution: Provide clearer initial prompts

2. **Missing context** - Reflexion needs context to judge quality
   - Solution: Load relevant files and documentation

3. **Undefined quality criteria** - Without clear goals, improvement is difficult
   - Solution: Specify quality criteria in prompts or CLAUDE.md

4. **Too many iterations** - Diminishing returns after 2-3 reflexions
   - Solution: Limit reflexion loops to 2-3 iterations

---

### MCP server not connecting

**Check**:

1. **Installation**: Verify MCP server is installed
   ```bash
   npm list -g | grep mcp
   ```

2. **Configuration**: Review `~/.config/claude/mcp.json`
   - Valid JSON syntax
   - Correct command path
   - Proper environment variables

3. **Server status**: Test MCP server directly
   ```bash
   # Test server startup
   <mcp-server-command>
   ```

4. **Claude Code restart**: Reload MCP connections
   ```bash
   exit
   claude
   ```

**Guide**: [Recommended MCP Servers](./recommended-mcp.md)

---

### Commands are slow to execute

**Performance factors**:

1. **Context size** - Large context increases processing time
   - Solution: Use granular plugin loading, remove unused skills

2. **Complex operations** - Multi-agent workflows take longer
   - Solution: Expected behavior for quality; optimize by reducing steps

3. **MCP server latency** - External servers add overhead
   - Solution: Use local MCP servers when possible

4. **API rate limits** - Anthropic API throttling
   - Solution: Check API usage, upgrade plan if needed

---

## Performance & Optimization

### How can I reduce token usage?

**Token optimization strategies**:

1. **Use commands over skills**
   - Install fewer skill-heavy plugins
   - Prefer command-based workflows

2. **Granular plugin loading**
   - Install only needed plugins
   - Uninstall unused plugins

3. **Optimize CLAUDE.md**
   - Keep under 2000 tokens
   - Remove outdated information
   - Use concise language

4. **Lazy context loading**
   - Load files only when needed
   - Use MCP servers for on-demand data

**Guide**: [Token Optimization](../guides/optimization.md)

---

### How do I measure token efficiency?

**Metrics to track**:

1. **Context size**: Monitor tokens in conversation
   - View in Claude Code interface
   - Aim for <50% of context window

2. **Plugin count**: Fewer plugins = fewer tokens
   - Target: 3-5 active plugins

3. **Skill count**: Skills consume constant tokens
   - Prefer command-heavy plugins

4. **CLAUDE.md size**: Should be concise
   - Target: <2000 tokens

---

### Which plugins are most token-efficient?

**Token efficiency ranking** (most to least efficient):

1. **Git** - Pure commands, no skills
2. **Docs** - Minimal skills, targeted commands
3. **Tech Stack** - One-time setup commands
4. **Customaize Agent** - Command-focused
5. **Reflexion** - Commands with minimal persistent context
6. **Code Review** - Specialized agents (loaded on demand)
7. **Kaizen** - One skill, multiple commands
8. **SDD** - Multiple agents, moderate skills
9. **DDD** - One comprehensive skill
10. **TDD** - One comprehensive skill
11. **SADD** - One comprehensive skill
12. **MCP** - Guide commands only

**Note**: Even "least efficient" plugins are optimized compared to alternatives.

---

### How often should I run reflexion?

**Recommended frequency**:

- **After complex tasks** - When output quality is critical
- **Before commits** - Review code changes
- **During problem-solving** - When stuck on difficult issues
- **Not on simple tasks** - Adds overhead without benefit

**Typical workflow**:
```bash
# Complex feature
<implement feature>
/reflexion:reflect        # Review quality
<make improvements>
/reflexion:memorize       # Update knowledge
```

**Limit**: 2-3 reflexion loops maximum (diminishing returns)

---

## Integration & Compatibility

### Does CEK work with other Claude Code plugins?

Yes. CEK plugins are designed to complement:

- Official Anthropic plugins
- Community plugins
- Custom plugins

**Best practice**: Avoid overlapping functionality from multiple sources.

---

### Can I use CEK with MCP servers?

Yes. CEK actively encourages MCP integration:

- [Context7](./recommended-mcp.md#context7) - Documentation access
- [Serena](./recommended-mcp.md#serena) - Semantic code search
- [Perplexity](./recommended-mcp.md#perplexity) - Research capabilities

**Setup**:
```bash
/plugin install mcp@NeoLabHQ/context-engineering-kit
/mcp:setup-context7-mcp
/mcp:setup-serena-mcp
```

---

### Does CEK support team workflows?

Yes. CEK is designed for professional development teams:

**Team benefits**:
- Consistent code quality (code review agents)
- Shared knowledge base (CLAUDE.md)
- Standardized workflows (SDD process)
- Quality gates (systematic review)

**Team setup**:
1. Define team conventions in CLAUDE.md
2. Standardize plugin installations
3. Create shared custom commands
4. Use git hooks for automated checks

**Guide**: [Team Workflows](../guides/team-workflows.md)

---

### Can I use CEK with CI/CD pipelines?

Yes. CEK commands can integrate with automation:

**Example Git hooks**:
```bash
# Pre-commit hook
/code-review:review-local-changes

# Pre-push hook
/reflexion:reflect
```

**Setup**:
```bash
/customaize-agent:create-hook
```

**Note**: Requires Claude API key in CI environment.

---

### Does CEK work with monorepos?

Yes. CEK plugins work in any repository structure:

**Monorepo considerations**:
- Use CLAUDE.md at root for shared conventions
- Add package-specific CLAUDE.md for unique requirements
- Install plugins globally or per-package
- Use MCP servers for cross-package navigation

---

## Advanced Usage

### How do I create a custom workflow?

Combine existing plugins into custom workflows:

**Example: Feature Development Workflow**
```bash
# 1. Specify feature
/sdd:01-specify "New authentication system"

# 2. Plan implementation
/sdd:02-plan

# 3. Generate tasks
/sdd:03-tasks

# 4. Implement with TDD
/sdd:04-implement

# 5. Review code
/code-review:review-local-changes

# 6. Reflect and improve
/reflexion:reflect

# 7. Commit changes
/git:commit

# 8. Update documentation
/sdd:05-document
```

**Guide**: [Custom Workflows](../guides/custom-workflows.md)

---

### Can I modify existing plugins?

Yes. CEK is open source:

1. **Fork the repository**
2. **Modify plugin files**
3. **Test changes locally**
4. **Submit PR** (optional, to contribute back)

**Customization guide**: [Customaize Agent Plugin](../plugins/customaize-agent/)

---

### How do I test my custom commands?

Use the testing command:

```bash
/customaize-agent:test-prompt
```

This implements RED-GREEN-REFACTOR cycle:
- **Red**: Identify failure cases
- **Green**: Verify success cases
- **Refactor**: Improve prompt quality

**Guide**: [Testing Prompts](../plugins/customaize-agent/testing-prompts.md)

---

### Can I share my custom plugins?

Yes. Options include:

1. **Create your own marketplace**
   - Host plugins on GitHub
   - Share marketplace URL
   - Users add with `/plugin marketplace add`

2. **Contribute to CEK**
   - Submit plugins as PRs
   - Go through review process
   - Become part of official marketplace

3. **Share locally**
   - Export plugin files
   - Users manually install

**Contribution guide**: [CONTRIBUTING.md](../../CONTRIBUTING.md)

---

### How do I stay updated with CEK developments?

**Stay informed**:

1. **Watch GitHub repository**
   - Star [NeoLabHQ/context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit)
   - Enable notifications for releases

2. **Update marketplace regularly**
   ```bash
   /plugin marketplace update NeoLabHQ/context-engineering-kit
   ```

3. **Check changelog**
   - Review CHANGELOG.md for updates
   - Read release notes

4. **Join discussions**
   - GitHub Discussions
   - Issue tracker

---

## Still Have Questions?

### Where can I get more help?

**Documentation**:
- [User Guide](../user-guide.md) - Comprehensive usage guide
- [Plugin Documentation](../plugins/) - Detailed plugin references
- [Guides](../guides/) - Step-by-step tutorials

**Community**:
- [GitHub Issues](https://github.com/NeoLabHQ/context-engineering-kit/issues) - Bug reports and feature requests
- [GitHub Discussions](https://github.com/NeoLabHQ/context-engineering-kit/discussions) - Community Q&A
- [Contributing Guide](../../CONTRIBUTING.md) - How to contribute

---

### How do I report a bug?

**Before reporting**:
1. Check [existing issues](https://github.com/NeoLabHQ/context-engineering-kit/issues)
2. Try troubleshooting steps above
3. Verify plugin is up to date

**Report bug**:
1. Open [new issue](https://github.com/NeoLabHQ/context-engineering-kit/issues/new)
2. Provide:
   - Plugin name and version
   - Command that failed
   - Expected vs actual behavior
   - Error messages
   - Steps to reproduce

---

### How do I request a feature?

**Feature request process**:

1. **Check existing requests** - May already be planned
2. **Open discussion** - Propose feature in GitHub Discussions
3. **Gather feedback** - Community input on usefulness
4. **Submit formal request** - Create issue with details

**Include in request**:
- Use case and motivation
- Proposed behavior
- Example usage
- Why existing plugins don't solve this

---

### Can I contribute to CEK?

Yes! We welcome contributions:

**Ways to contribute**:
- Fix bugs and issues
- Improve documentation
- Add plugin features
- Create new plugins
- Share workflows and examples
- Review pull requests

**Getting started**:
1. Read [CONTRIBUTING.md](../../CONTRIBUTING.md)
2. Find "good first issue" labels
3. Fork and create branch
4. Submit pull request

We appreciate all contributions, large and small!

---

**Didn't find your answer?** Ask in [GitHub Discussions](https://github.com/NeoLabHQ/context-engineering-kit/discussions) or [open an issue](https://github.com/NeoLabHQ/context-engineering-kit/issues/new).
