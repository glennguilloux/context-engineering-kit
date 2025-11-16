# Choosing Plugins

A decision framework for selecting the right Context Engineering Kit plugins based on your needs and workflow.

## Overview

With 12+ plugins available, choosing the right ones can be overwhelming. This guide helps you make informed decisions based on your:

- Development workflow and methodology
- Code quality requirements
- Team size and collaboration needs
- Token budget and performance constraints
- Specific problem domains

**Key Principle:** Start minimal. Install only what you need today. You can always add more plugins later.

## Decision Tree

Follow this decision tree to quickly identify relevant plugins:

```
What's your primary goal?

├─ Improve code quality
│  ├─ Before committing → Code Review + Reflexion
│  ├─ During development → Code Review + DDD
│  └─ After completion → Reflexion + Docs
│
├─ Follow development methodology
│  ├─ Specification-first → SDD
│  ├─ Test-first → TDD
│  ├─ Domain modeling → DDD
│  └─ Fast iteration → SADD + Reflexion
│
├─ Solve problems/debug
│  ├─ Root cause analysis → Kaizen
│  ├─ Complex bugs → Kaizen + Code Review
│  └─ Performance issues → Kaizen + Reflexion
│
├─ Create/maintain documentation
│  ├─ API docs → Docs + SDD
│  ├─ Project docs → Docs
│  └─ Specification docs → SDD
│
├─ Streamline Git workflow
│  ├─ Better commits → Git
│  ├─ PR creation → Git + Code Review
│  └─ Issue analysis → Git + SDD
│
├─ Setup project standards
│  ├─ Language-specific → Tech Stack
│  ├─ Code quality rules → DDD
│  └─ External integrations → MCP
│
└─ Create custom plugins
   └─ Plugin development → Customaize Agent
```

## By Use Case

### Code Quality and Review

**Goal:** Maintain high code quality through reviews and improvements.

#### Recommended Plugins

**Minimal Setup:**
```bash
/plugin install code-review@NeoLabHQ/context-engineering-kit
```

**Standard Setup:**
```bash
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**Comprehensive Setup:**
```bash
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install ddd@NeoLabHQ/context-engineering-kit
```

#### When to Use Each

**Code Review:**
- Before committing changes
- Reviewing pull requests
- Multi-perspective quality analysis
- Identifying bugs and security issues

**Reflexion:**
- After completing implementation
- When output needs improvement
- Learning from mistakes (memorize command)
- Multi-agent debate on complex decisions

**DDD (Domain-Driven Development):**
- Setting up code formatting standards
- Establishing architecture principles
- Continuous guidance on design patterns
- SOLID principles and Clean Architecture

### Development Workflow

**Goal:** Follow structured development methodologies.

#### Spec-Driven Development

**For:** Teams that value documentation and clear specifications before coding.

```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
```

**Combine with:**
- `git` - Issue analysis and PR creation
- `docs` - Documentation maintenance
- `code-review` - Quality gates during implementation

**Use when:**
- Building new features from scratch
- Working with unclear or evolving requirements
- Need comprehensive documentation
- Multiple team members collaborating
- Complex integrations required

**Don't use when:**
- Simple bug fixes or trivial changes
- Urgent hotfixes
- Purely cosmetic changes

#### Test-Driven Development

**For:** Developers who prioritize testing and test-first approaches.

```bash
/plugin install tdd@NeoLabHQ/context-engineering-kit
```

**Combine with:**
- `sadd` - Subagents for test implementation
- `code-review` - Test coverage analysis
- `kaizen` - Continuous test improvement

**Use when:**
- Building testable components
- Need high test coverage
- Working on critical business logic
- Preventing regressions

#### Domain-Driven Development

**For:** Projects requiring strong domain modeling and architecture.

```bash
/plugin install ddd@NeoLabHQ/context-engineering-kit
```

**Combine with:**
- `sdd` - Specification and planning
- `code-review` - Architecture validation
- `tech-stack` - Language-specific patterns

**Use when:**
- Complex business domains
- Need clear bounded contexts
- Long-term maintainability critical
- Large codebase with many developers

#### Subagent-Driven Development

**For:** Fast iteration with quality gates between tasks.

```bash
/plugin install sadd@NeoLabHQ/context-engineering-kit
```

**Combine with:**
- `code-review` - Quality validation between tasks
- `reflexion` - Improvement loops
- `tdd` - Test-first subagent tasks

**Use when:**
- Need fast iteration cycles
- Breaking work into isolated tasks
- Want fresh context for each subtask
- Quality review between steps important

### Problem Solving and Debugging

**Goal:** Systematically solve problems and debug issues.

#### Root Cause Analysis

**Minimal Setup:**
```bash
/plugin install kaizen@NeoLabHQ/context-engineering-kit
```

**Comprehensive Setup:**
```bash
/plugin install kaizen@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

#### When to Use Each

**Kaizen:**
- Bug investigation (`/kaizen:why`)
- Complex multi-factor problems (`/kaizen:cause-and-effect`)
- Performance issues (`/kaizen:analyse`)
- Incident documentation (`/kaizen:analyse-problem`)
- Process improvement (`/kaizen:plan-do-check-act`)
- Code exploration (`/kaizen:analyse`)

**Code Review (for debugging):**
- Understanding code behavior
- Finding hidden bugs
- Security vulnerability analysis
- Reviewing suspicious changes

**Reflexion (for debugging):**
- Validating fixes
- Comprehensive solution review
- Learning from debugging sessions
- Memorizing debugging insights

### Documentation and Specification

**Goal:** Create and maintain high-quality documentation.

#### Documentation Focus

**Minimal Setup:**
```bash
/plugin install docs@NeoLabHQ/context-engineering-kit
```

**With Specifications:**
```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
```

#### When to Use

**Docs:**
- Updating implementation documentation
- After development phases complete
- README maintenance
- API documentation updates

**SDD (for documentation):**
- Creating feature specifications
- Architecture documentation
- API contracts and data models
- Complete feature documentation lifecycle

### Git and Version Control

**Goal:** Streamline Git operations and code collaboration.

```bash
/plugin install git@NeoLabHQ/context-engineering-kit
```

**Combine with:**
- `code-review` - Pre-commit review and PR review
- `sdd` - Issue analysis and specification creation
- `docs` - PR description enhancement

#### Commands Available

**`/git:commit`:**
- Well-formatted conventional commits
- Automatic commit message generation
- Emoji support

**`/git:create-pr`:**
- Pull request creation with GitHub CLI
- Template-based PR descriptions
- Proper formatting

**`/git:analyze-issue`:**
- Convert GitHub issues to technical specs
- Prepare for implementation

**`/git:load-issues`:**
- Batch load open issues
- Context for planning work

### Project Setup and Standards

**Goal:** Establish project conventions and integrate external tools.

#### Tech Stack

```bash
/plugin install tech-stack@NeoLabHQ/context-engineering-kit
```

**Use when:**
- Starting new project
- Adding new language/framework
- Establishing coding standards
- Team onboarding

**Available commands:**
- `/tech-stack:add-typescript-best-practices` - TypeScript conventions

#### MCP Integration

```bash
/plugin install mcp@NeoLabHQ/context-engineering-kit
```

**Use for:**
- Integrating documentation servers (Context7)
- Semantic code retrieval (Serena)
- Building custom MCP servers

**Available commands:**
- `/mcp:setup-context7-mcp` - Documentation loading
- `/mcp:setup-serena-mcp` - Semantic code search
- `/mcp:build-mcp` - Create custom MCP servers

### Plugin Development

**Goal:** Create custom commands, skills, and plugins.

```bash
/plugin install customaize-agent@NeoLabHQ/context-engineering-kit
```

#### When to Use

**Creating new functionality:**
- `/customaize-agent:create-command` - New slash commands
- `/customaize-agent:create-skill` - New skills
- `/customaize-agent:create-hook` - Git hooks

**Testing and validation:**
- `/customaize-agent:test-skill` - Verify skills work
- `/customaize-agent:test-prompt` - Test any prompt

**Following best practices:**
- `/customaize-agent:apply-anthropic-skill-best-practices` - Skill quality

**Includes:**
- Prompt engineering skill with best practices
- Agent Persuasion Principles
- Anthropic official guidelines

## By Team Size

### Solo Developer

**Minimal Setup (Start Here):**
```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
```

**Standard Setup:**
```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install kaizen@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
```

**Rationale:**
- Limited need for formal specifications
- Quick iteration more valuable than process
- Quality checks still important
- Problem-solving tools essential

### Small Team (2-5 developers)

**Recommended Setup:**
```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**Add based on needs:**
- `ddd` - If complex domain
- `tdd` - If high test coverage required
- `docs` - If documentation important
- `kaizen` - For process improvement

**Rationale:**
- Specifications enable coordination
- Code review ensures consistency
- Git workflow standardizes commits/PRs
- Reflexion for quality improvements

### Medium Team (6-15 developers)

**Core Setup:**
```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install ddd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
/plugin install tech-stack@NeoLabHQ/context-engineering-kit
```

**Add based on needs:**
- `tdd` - For critical components
- `sadd` - For parallel development
- `kaizen` - For retrospectives and analysis
- `reflexion` - For individual improvements

**Rationale:**
- Formal specifications required
- Architecture standards critical
- Documentation maintenance essential
- Tech stack conventions needed

### Large Team (15+ developers)

**Required Setup:**
```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install ddd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
/plugin install tech-stack@NeoLabHQ/context-engineering-kit
/plugin install kaizen@NeoLabHQ/context-engineering-kit
```

**Rationale:**
- Everything must be documented
- Standards enforced consistently
- Process improvement essential at scale
- Git workflow standardization critical

## By Project Type

### Greenfield Project

**Recommended:**
```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install ddd@NeoLabHQ/context-engineering-kit
/plugin install tech-stack@NeoLabHQ/context-engineering-kit
```

**Rationale:**
- Establish architecture from start
- Define standards early
- Create specifications before implementation

### Legacy Codebase

**Recommended:**
```bash
/plugin install kaizen@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**Rationale:**
- Understand existing code (`/kaizen:analyse`)
- Ensure changes don't break things
- Gradual improvement through reflexion

### Library/Framework

**Recommended:**
```bash
/plugin install tdd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
```

**Rationale:**
- High test coverage essential
- API quality critical
- Documentation is the product

### Microservices

**Recommended:**
```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install ddd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
```

**Rationale:**
- Clear service boundaries (DDD)
- API contracts and specifications (SDD)
- Quality across services

## By Token Budget

### Limited Tokens (Cost-conscious)

**Minimal Setup (Commands only, no skills):**
```bash
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
```

**Strategy:**
- Use commands explicitly when needed
- Install plugins temporarily for specific tasks
- Uninstall when not actively using

**Temporarily uninstall skill-based plugins when not in active use:**
- `ddd` - Has software-architecture skill (always active)
- `tdd` - Has test-driven-development skill (always active)
- `sadd` - Has subagent-driven-development skill (always active)
- `kaizen` - Has kaizen skill (always active)

### Moderate Tokens (Balanced)

**Recommended Setup:**
```bash
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install sdd@NeoLabHQ/context-engineering-kit
```

**Strategy:**
- Mix of commands and skills
- Use skills for commonly-needed guidance
- Commands for specific operations

### Unlimited Tokens (Quality-focused)

**Comprehensive Setup:**
```bash
# Install all plugins
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install tdd@NeoLabHQ/context-engineering-kit
/plugin install sadd@NeoLabHQ/context-engineering-kit
/plugin install ddd@NeoLabHQ/context-engineering-kit
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install kaizen@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
/plugin install tech-stack@NeoLabHQ/context-engineering-kit
/plugin install mcp@NeoLabHQ/context-engineering-kit
/plugin install customaize-agent@NeoLabHQ/context-engineering-kit
```

**Strategy:**
- Maximum quality and guidance
- All skills active for comprehensive support
- All commands available when needed

## Quick Reference Matrix

**Note:** Token impact estimates are approximate and based on typical plugin usage patterns. Actual token consumption varies depending on skill content size and command invocation frequency.

| Plugin | Has Skills | Token Impact | Primary Use | Best For |
|--------|------------|--------------|-------------|----------|
| **Reflexion** | No | Low (commands only) | Improvement loops | All developers |
| **Code Review** | No | Low (commands only) | Quality review | All projects |
| **Git** | No | Low (commands only) | Git operations | All projects |
| **TDD** | Yes | Medium (skill active) | Test-first development | Critical code |
| **SADD** | Yes | Medium (skill active) | Fast iteration | Task isolation |
| **DDD** | Yes | Medium (skill active) | Domain modeling | Complex domains |
| **SDD** | No | High (workflow) | Spec-Driven | Teams, complex features |
| **Kaizen** | Yes | Medium (skill active) | Problem solving | All projects |
| **Docs** | No | Low (commands only) | Documentation | All projects |
| **Tech Stack** | No | Low (commands only) | Setup standards | New projects |
| **MCP** | No | Low (commands only) | External integrations | As needed |
| **Customaize** | Yes | Medium (skill active) | Plugin development | Meta work |

## Decision Guidelines

### Start Here

1. **Assess your immediate needs** - What problem are you solving today?
2. **Install minimal set** - 2-3 plugins maximum to start
3. **Learn the commands** - Use plugins before adding more
4. **Measure value** - Does the plugin improve your workflow?
5. **Add gradually** - Install additional plugins only when needed

### Questions to Ask

**"Should I install this plugin?"**

Ask yourself:
- Will I use it this week?
- Does it solve a current problem?
- Can I achieve the same with existing plugins?
- Is the token cost worth the benefit?

**If answers are "no," skip it for now.**

**"Should I keep this plugin installed?"**

Ask yourself:
- Have I used it in the last week?
- Do I remember what it does?
- Would I miss it if it was gone?

**If answers are "no," uninstall it.**

### Common Patterns

**"I want everything!"**
- Start with 3 plugins
- Add one at a time
- Use each for a week before adding more
- Some plugins overlap in functionality

**"I don't know what I need"**
- Install: `reflexion`, `code-review`, `git`
- Use for 2 weeks
- Identify gaps in your workflow
- Add specific plugins for those gaps

**"My context is always full"**
- See [Optimization - Minimizing Context](./optimization.md#minimizing-context-pollution)
- Uninstall plugins with skills if unused
- Keep only command-only plugins
- Use plugins temporarily, uninstall when done

## See Also

**Guides:**
- [Combining Plugins](./combining-plugins.md) - Effective plugin combinations
- [Custom Workflows](./custom-workflows.md) - Building workflows with chosen plugins
- [Optimization](./optimization.md) - Managing token costs for selected plugins
- [Team Workflows](./team-workflows.md) - Team plugin selection strategies

**Reference:**
- [Command Index](../reference/command-index.md) - All available commands
- [Skill Index](../reference/skill-index.md) - Skills and their token impact
- [Marketplace API](../reference/marketplace-api.md) - Installing chosen plugins

**Concepts:**
- [Token Efficiency](../concepts/token-efficiency.md) - Understanding plugin token costs
- [Granular Design](../concepts/granular-design.md) - Why plugins are focused

## Plugin Installation Reminder

Remember the installation syntax:

```bash
# Add marketplace (once)
/plugin marketplace add NeoLabHQ/context-engineering-kit

# Install plugin
/plugin install PLUGIN-NAME@NeoLabHQ/context-engineering-kit

# Example
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

## Summary

**Key Takeaways:**

1. **Start minimal** - 2-3 plugins maximum initially
2. **Add gradually** - One at a time, learn before adding more
3. **Consider tokens** - Skills consume tokens always, commands only when used
4. **Match your workflow** - Choose based on actual needs, not "nice to have"
5. **Remove unused** - Uninstall plugins you don't actively use

**Default recommendation for most developers:**

```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
```

These three cover quality improvement, code review, and Git operations—useful for almost any developer without heavy token costs.

From there, expand based on your specific needs using the decision tree and use case sections above.
