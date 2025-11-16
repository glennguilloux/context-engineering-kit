# Optimization Guide

Tips and strategies for optimizing token usage and performance when using Context Engineering Kit plugins.

## Overview

Claude Code has a context window limit, and every plugin, skill, and command consumes tokens from that window. This guide helps you:

- Understand token consumption patterns
- Optimize plugin selection and usage
- Minimize context pollution
- Balance quality and performance
- Troubleshoot context limit issues

**Key Principle:** Use only what you need, when you need it. Quality doesn't require maximum context usage.

## Understanding Token Usage

### Token Consumption by Component

**Plugin Installation:**
- Plugin metadata: ~50-100 tokens per plugin
- Command definitions: ~50-300 tokens per command
- Skill content: ~500-3000 tokens per skill

**During Usage:**
- Command invocation: Tokens for command output
- Subagent conversations: Tokens for entire subagent exchange
- File reads: Tokens for file content
- Tool usage: Tokens for tool results

### Context Window Structure

```
[System Prompt]            (fixed, ~2000 tokens)
[Skills]                   (varies by installed plugins)
[Commands]                 (varies by installed plugins)
[Conversation History]     (grows during session)
[Current Task Context]     (files, tool results, etc.)
[Generation Buffer]        (reserved for response)
```

**Total Available:** ~200,000 tokens (Claude 3.5 Sonnet)

### Plugin Token Impact

| Plugin | Skills | Skill Tokens | Commands | Command Tokens | Total Base |
|--------|--------|--------------|----------|----------------|------------|
| **Reflexion** | 0 | 0 | 3 | ~200 | ~200 |
| **Code Review** | 0 | 0 | 2 | ~500 | ~500 |
| **Git** | 0 | 0 | 4 | ~300 | ~300 |
| **TDD** | 1 | ~1500 | 0 | 0 | ~1500 |
| **SADD** | 1 | ~1200 | 0 | 0 | ~1200 |
| **DDD** | 1 | ~2000 | 1 | ~200 | ~2200 |
| **SDD** | 0 | 0 | 7 | ~1500 | ~1500 |
| **Kaizen** | 1 | ~2500 | 6 | ~800 | ~3300 |
| **Docs** | 0 | 0 | 1 | ~200 | ~200 |
| **Tech Stack** | 0 | 0 | 1 | ~150 | ~150 |
| **MCP** | 0 | 0 | 3 | ~400 | ~400 |
| **Customaize** | 1 | ~1800 | 6 | ~900 | ~2700 |

**Note:** These are estimates. Actual token usage varies.

### Token Accumulation Example

**Minimal setup:**
```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
```

**Token usage:** ~1000 tokens (0.5% of context)

**Comprehensive setup:**
```bash
# Install all plugins
```

**Token usage:** ~15,000 tokens (7.5% of context)

**Impact:** Comprehensive setup uses 15x more tokens but provides more guidance.

## Commands vs Skills Trade-offs

### Commands Only (Explicit Invocation)

**Pros:**
- Zero token cost until invoked
- Explicit control over usage
- Can install many without context impact
- Easy to understand what's active

**Cons:**
- Must remember to use them
- No automatic guidance
- Requires explicit workflow

**Best for:**
- Infrequently needed functionality
- Specific operations (Git, docs updates)
- Token-constrained environments
- Solo developers who control workflow

**Example plugins:**
- Reflexion (all commands, no skills)
- Code Review (all commands)
- Git (all commands)
- Docs (all commands)

### Skills (Always Active)

**Pros:**
- Automatic guidance on every response
- Influences all Claude behavior
- No need to remember to invoke
- Consistent application

**Cons:**
- Always consumes tokens
- Loaded even when not needed
- Can accumulate and fill context
- Less explicit control

**Best for:**
- Frequently needed guidance
- Methodology enforcement (TDD, DDD)
- Team consistency
- Quality-focused projects

**Example plugins:**
- TDD (test-driven-development skill)
- DDD (software-architecture skill)
- Kaizen (kaizen skill)
- SADD (subagent-driven-development skill)

### Hybrid Approach

**Optimal strategy:**

```bash
# Always-active guidance (skills)
/plugin install ddd@NeoLabHQ/context-engineering-kit  # Architecture guidance

# Explicit operations (commands)
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
```

**Result:**
- Continuous architecture guidance
- Explicit quality checks and operations
- ~2500 tokens base usage
- Balanced control and automation

## Minimizing Context Pollution

### Strategy 1: Install Temporarily

Install plugins only when needed, uninstall after:

```bash
# Before working on specifications
/plugin install sdd@NeoLabHQ/context-engineering-kit

# Complete SDD workflow
/sdd:01-specify
/sdd:02-plan
# ... etc ...

# After completing specification work
/plugin uninstall sdd

# Later, for documentation
/plugin install docs@NeoLabHQ/context-engineering-kit
/docs:update-docs
/plugin uninstall docs
```

**Best for:**
- Token-constrained environments
- Infrequently used plugins
- Focused work sessions

### Strategy 2: Core + Rotating Set

Keep core plugins installed, rotate others:

```bash
# Core (always installed)
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit

# Rotate based on current work
# Week 1: Feature development
/plugin install sdd@NeoLabHQ/context-engineering-kit

# Week 2: Bug fixing
/plugin uninstall sdd
/plugin install kaizen@NeoLabHQ/context-engineering-kit

# Week 3: Refactoring
/plugin uninstall kaizen
/plugin install ddd@NeoLabHQ/context-engineering-kit
```

**Best for:**
- Projects with varying focus
- Solo developers
- Flexible workflows

### Strategy 3: Project-Specific Sets

Different plugin sets for different projects:

```bash
# API Project
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit

# Data Pipeline Project
/plugin install kaizen@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit

# Library Project
/plugin install tdd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
```

**Best for:**
- Multiple distinct projects
- Teams with project specializations
- Clear separation of concerns

### Strategy 4: Skill-Free Configuration

Avoid all plugins with skills, use commands only:

```bash
# Only command-based plugins
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
/plugin install tech-stack@NeoLabHQ/context-engineering-kit
/plugin install mcp@NeoLabHQ/context-engineering-kit
```

**Token usage:** ~3000 tokens (1.5% of context)

**Best for:**
- Extreme token optimization
- Long conversations
- Large codebases already filling context
- Projects with tight constraints

## Optimizing Workflow Efficiency

### Reduce Command Redundancy

**Inefficient:**
```bash
/code-review:review-local-changes
/reflexion:reflect
/reflexion:critique
/kaizen:analyse
# Too much analysis!
```

**Efficient:**
```bash
/code-review:review-local-changes
# OR
/reflexion:reflect
# Choose one analysis method per task
```

**Guideline:** One comprehensive analysis per change, not multiple overlapping analyses.

### Batch Similar Operations

**Inefficient:**
```bash
Fix bug A
/code-review:review-local-changes
/git:commit

Fix bug B
/code-review:review-local-changes
/git:commit

Fix bug C
/code-review:review-local-changes
/git:commit
```

**Efficient:**
```bash
Fix bugs A, B, C
/code-review:review-local-changes
/git:commit "Fix multiple related bugs"
```

**Guideline:** Group related changes, review once, commit together.

### Skip Unnecessary Steps

**Not every change needs:**
- Formal specification (SDD)
- Root cause analysis (Kaizen)
- Multi-perspective critique (Reflexion)
- Comprehensive documentation (Docs)

**Match analysis depth to change complexity:**

| Change Type | Recommended Steps |
|-------------|------------------|
| Typo fix | Quick review, commit |
| Simple bug | Why analysis, fix, commit |
| Medium feature | Spec, plan, implement, commit |
| Complex feature | Full SDD workflow |

### Use Subagents Strategically

**Subagents are expensive:**
- Entire subagent conversation stays in context
- Multiple subagents multiply token usage
- Long subagent conversations fill context quickly

**Optimization strategies:**

**1. Clear subagent instructions:**
```bash
# Good: Specific goal
Launch code-explorer to find authentication entry points

# Bad: Open-ended exploration
Launch code-explorer to explore the codebase
```

**2. Limit subagent scope:**
```bash
# Good: Focused research
Launch researcher to compare Redis vs Memcached for caching

# Bad: Broad research
Launch researcher to find best practices
```

**3. Use subagents for complex tasks only:**
```bash
# Use subagent: Complex analysis
Launch software-architect to design payment integration

# Don't use subagent: Simple lookup
# Just read the file directly instead of launching code-explorer
```

## Token Monitoring

### Check Current Usage

Unfortunately, Claude Code doesn't show token usage directly. Estimate based on:

**Indicators of high token usage:**
- Responses getting slower
- Claude saying "context is getting full"
- Truncated responses
- "I don't have enough context" errors

**Indicators of healthy token usage:**
- Fast responses
- Complete outputs
- No context warnings

### Reducing Context Mid-Session

**If context is filling up:**

```bash
# 1. Uninstall unused plugins
/plugin uninstall [plugin-name]

# 2. Start new conversation
# (preserves CLAUDE.md but clears history)

# 3. Be more selective with file reads
# Read only essential files

# 4. Summarize and move on
# Instead of keeping full history
```

### Project Size Considerations

**Small projects (<100 files):**
- Can use comprehensive plugin sets
- Token usage dominated by plugins/skills
- File reads minimal impact

**Medium projects (100-1000 files):**
- Be selective with plugins
- File reads become significant
- Consider command-only plugins

**Large projects (>1000 files):**
- Minimal plugin set recommended
- File reads dominate token usage
- Focus on targeted operations
- Consider using MCP servers for code retrieval

## Performance Optimization

### Reduce Response Time

**Fast operations (commands):**
- `/git:commit` - Local operation
- `/reflexion:reflect` - Single analysis
- `/code-review:review-local-changes` - Focused review

**Slow operations (subagents):**
- `/sdd:02-plan` - Multiple subagents (researcher, explorer, architect)
- `/code-review:review-pr` - Multiple specialized review agents
- `/kaizen:analyse` - Comprehensive analysis with subagents

**Optimization:**
- Use fast operations frequently
- Reserve slow operations for important tasks
- Batch slow operations when possible

### Optimize SDD Workflow

**SDD is powerful but token-intensive:**

**Full workflow:**
```bash
/sdd:01-specify  # Business analyst subagent
/sdd:02-plan     # Multiple subagents (researcher, explorer, architect)
/sdd:03-tasks    # Tech lead subagent
/sdd:04-implement # Developer subagents + code review agents
/sdd:05-document  # Tech writer subagent
```

**Optimized workflow for smaller features:**
```bash
/sdd:01-specify  # Keep: Ensures clear requirements
# Skip /sdd:02-plan for simple features
/sdd:03-tasks    # Keep: Clear task breakdown
/sdd:04-implement # Keep: Implementation with quality gates
# Skip /sdd:05-document if docs already exist
```

**When to use full workflow:**
- Complex features (>8 hours implementation)
- Unclear requirements
- Multiple team members
- Integration with existing systems

**When to use optimized workflow:**
- Simple features (<4 hours implementation)
- Clear requirements
- Solo developer
- Straightforward implementation

### Optimize Code Review

**Full review (multiple agents):**
```bash
/code-review:review-local-changes
# Runs 6 specialized agents:
# - bug-hunter
# - code-quality-reviewer
# - contracts-reviewer
# - historical-context-reviewer
# - security-auditor
# - test-coverage-reviewer
```

**Selective review (ask for specific focus):**
```bash
claude "Review local changes focusing only on security and bugs"
# Or
/code-review:review-local-changes [specific files]
```

**When to use full review:**
- Before committing to main branch
- Complex changes
- Security-critical code
- Team code reviews

**When to use selective review:**
- Simple changes
- Non-critical code
- During active development

## Token Budget Planning

### By Team Size

**Solo developer:**
- Budget: Flexible
- Strategy: Install what helps, remove what doesn't
- Recommendation: Essential Pack (~1000 tokens)

**Small team (2-5):**
- Budget: ~3000-5000 tokens for plugins
- Strategy: Standardize on core plugins, optional additions
- Recommendation: Quality-Focused Pack

**Medium team (6-15):**
- Budget: ~5000-8000 tokens for plugins
- Strategy: Comprehensive standards, mandatory plugins
- Recommendation: Spec-Driven Pack

**Large team (15+):**
- Budget: ~8000-12000 tokens for plugins
- Strategy: Full methodology, all standards
- Recommendation: Enterprise Pack (if tokens allow)

### By Project Phase

**Initial development:**
- High plugin usage acceptable
- SDD + DDD + TDD for strong foundation
- ~8000 tokens

**Maintenance phase:**
- Reduce to essential plugins
- Code Review + Reflexion + Git + Kaizen
- ~3000 tokens

**Rapid iteration:**
- Minimal plugins
- Code Review + Git
- ~800 tokens

### By Codebase Size

**Small codebase (<10k LOC):**
- Plugin tokens: Not a concern
- File reads: Minimal
- Total budget: 80% available for conversation

**Medium codebase (10k-100k LOC):**
- Plugin tokens: Moderate concern
- File reads: Significant
- Total budget: 60% available for conversation

**Large codebase (>100k LOC):**
- Plugin tokens: Major concern
- File reads: Dominant
- Total budget: 40% available for conversation
- **Recommendation:** Use MCP servers for code retrieval

## Advanced Optimization Techniques

### Lazy Plugin Loading

Install plugins at the last possible moment:

```bash
# Don't install preemptively
# Wait until actually needed

# When starting bug investigation:
/plugin install kaizen@NeoLabHQ/context-engineering-kit
/kaizen:why [problem]

# When done with investigation:
/plugin uninstall kaizen
```

### Plugin Profiles

Create installation scripts for different scenarios:

```bash
# profile-essential.sh
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit

# profile-feature-dev.sh
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit

# profile-debugging.sh
/plugin install kaizen@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

### CLAUDE.md Optimization

**CLAUDE.md also consumes tokens:**
- Loaded at start of every conversation
- Large CLAUDE.md files impact token budget

**Optimization strategies:**

**1. Keep it focused:**
```markdown
<!-- Good: Concise, essential information -->
# Project Standards

- Use TypeScript strict mode
- Follow Clean Architecture
- Write tests for business logic
```

```markdown
<!-- Bad: Verbose, redundant information -->
# Project Standards

This project uses TypeScript which is a typed superset of JavaScript
that compiles to plain JavaScript. We have enabled strict mode which
provides the highest level of type safety by enabling all strict type
checking options...
[continues for paragraphs]
```

**2. Link to external docs:**
```markdown
<!-- Instead of including full documentation -->
# Authentication

See docs/authentication.md for complete authentication flow and implementation details.

Key points:
- JWT tokens with 15min expiry
- Refresh tokens stored in httpOnly cookies
- OAuth2 providers: Google, GitHub
```

**3. Use sections:**
```markdown
# CLAUDE.md

## Code Standards
[essential standards]

## Architecture Decisions
[key decisions only]

## Common Patterns
[frequently used patterns]

## Lessons Learned
[from /reflexion:memorize - keep recent only]
```

**4. Archive old learnings:**

Periodically move old learnings to separate file:

```markdown
# CLAUDE.md
## Recent Learnings (Last 30 days)
[recent insights]

See LEARNINGS_ARCHIVE.md for historical learnings.
```

### Conversation Management

**Start fresh when needed:**

Long conversations accumulate tokens. When context feels full:

```bash
# 1. Memorize current session learnings
/reflexion:memorize

# 2. Start new conversation
# CLAUDE.md persists, history clears
```

**Summarize and continue:**

Instead of keeping full history:

```bash
# You: Summarize what we've accomplished
# Claude: [summary]
# You: Great, let's continue with fresh context
# Start new conversation with summary
```

## Troubleshooting Token Issues

### "Context is full" Errors

**Symptoms:**
- Claude says context is full
- Responses truncated
- Can't complete operations

**Solutions:**

**1. Immediate relief:**
```bash
# Uninstall skill-heavy plugins
/plugin uninstall kaizen
/plugin uninstall ddd
/plugin uninstall tdd

# Start new conversation
```

**2. Long-term fix:**
```bash
# Audit installed plugins
/plugin

# Uninstall unused plugins
/plugin uninstall [unused-plugin]

# Keep only essential plugins
```

### Slow Responses

**Symptoms:**
- Commands take long to complete
- Subagents slow
- Overall sluggishness

**Solutions:**

**1. Reduce subagent usage:**
```bash
# Instead of full SDD workflow
/sdd:01-specify
/sdd:02-plan  # Skip this for simple features
/sdd:03-tasks
```

**2. Focus analyses:**
```bash
# Instead of open-ended
claude "Review this code for security issues only"

# Not
/code-review:review-local-changes  # All 6 agents
```

**3. Batch operations:**
```bash
# Complete multiple tasks
# Then one comprehensive review
# Not review after each tiny change
```

### High Token Usage

**Symptoms:**
- Warnings about context
- Sensing reduced available context
- Can't load necessary files

**Solutions:**

**1. Switch to command-only plugins:**
```bash
# Uninstall skill-heavy plugins
/plugin uninstall ddd
/plugin uninstall tdd
/plugin uninstall kaizen
/plugin uninstall sadd

# Replace with command-only equivalents
# Use commands explicitly when needed
```

**2. Optimize CLAUDE.md:**
```bash
# Review CLAUDE.md
# Remove redundant information
# Archive old learnings
# Link to external docs
```

**3. Use MCP servers:**
```bash
# For large codebases
/mcp:setup-serena-mcp  # Semantic code search
# Reduces need to load many files
```

## Summary

**Key Takeaways:**

1. **Understand token costs** - Skills always cost, commands only when used
2. **Start minimal** - Install only what you need today
3. **Remove unused** - Uninstall plugins you don't actively use
4. **Match depth to complexity** - Simple changes don't need comprehensive analysis
5. **Monitor context usage** - Watch for slowness and context warnings
6. **Optimize workflows** - Skip unnecessary steps, batch operations
7. **Manage CLAUDE.md** - Keep it focused and concise
8. **Use profiles** - Different plugin sets for different scenarios

**Token-efficient recommendations:**

**Solo developer, token-conscious:**
```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
# ~1000 tokens
```

**Team, balanced approach:**
```bash
/plugin install ddd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
# ~3500 tokens
```

**Quality-focused, tokens not a concern:**
```bash
# Install comprehensive set
# ~12000 tokens
```

**Remember:** Quality doesn't require maximum tokens. Focus on what adds value to your specific workflow.

## See Also

**Guides:**
- [Choosing Plugins](./choosing-plugins.md) - Selecting token-efficient plugins
- [Combining Plugins](./combining-plugins.md) - Managing token costs in combinations
- [Custom Workflows](./custom-workflows.md) - Optimizing workflow steps
- [Team Workflows](./team-workflows.md) - Team token management strategies

**Concepts:**
- [Token Efficiency](../concepts/token-efficiency.md) - Foundational token optimization principles
- [Granular Design](../concepts/granular-design.md) - Architecture for token efficiency

**Reference:**
- [Skill Index](../reference/skill-index.md) - Understanding skill token costs
- [Marketplace API](../reference/marketplace-api.md) - Managing plugin installations
