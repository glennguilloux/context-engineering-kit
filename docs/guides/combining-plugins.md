# Combining Plugins

Best practices for using multiple Context Engineering Kit plugins together to create powerful workflows.

## Overview

Individual plugins are powerful, but combining them creates synergistic workflows that cover the entire development lifecycle. This guide shows you:

- Recommended plugin combinations
- Starter packs for common scenarios
- Plugin compatibility insights
- Integration patterns and examples

**Key Principle:** Combinations should complement, not overlap. Choose plugins that address different stages of your workflow.

## Recommended Starter Packs

Pre-configured plugin combinations for common development scenarios.

### Essential Pack (Minimal)

**For:** Every developer, minimal token usage

```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
```

**What you get:**
- Quality improvement loops
- Code review before commits
- Streamlined Git operations

**Token impact:** Low (commands only, no skills)

**Typical workflow:**
```bash
# 1. Implement feature
# 2. Review changes
/code-review:review-local-changes

# 3. Reflect and improve
/reflexion:reflect

# 4. Commit with proper message
/git:commit

# 5. Memorize learnings
/reflexion:memorize
```

### Quality-Focused Pack

**For:** Developers prioritizing code quality and maintainability

```bash
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install ddd@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
```

**What you get:**
- Multi-agent code review
- Reflexion and improvement loops
- Domain-driven design guidance (skill always active)
- Git workflow automation

**Token impact:** Medium (ddd has always-active skill)

**Typical workflow:**
```bash
# 1. Setup code standards (once per project)
/ddd:setup-code-formating

# 2. Implement feature (guided by DDD skill)
# ... coding ...

# 3. Review with multiple agents
/code-review:review-local-changes

# 4. Iterate with reflexion
/reflexion:reflect

# 5. Multi-perspective critique
/reflexion:critique

# 6. Commit changes
/git:commit
```

### Spec-Driven Pack

**For:** Teams following Spec-Driven Development methodology

```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
```

**What you get:**
- Complete SDD workflow (6 stages)
- Code review between implementation phases
- Git operations for spec branches
- Documentation maintenance

**Token impact:** High (SDD uses subagents extensively)

**Typical workflow:**
```bash
# 1. Setup constitution (once per project)
/sdd:00-setup Follow Clean Architecture and SOLID principles

# 2. Create specification
/sdd:01-specify Add user authentication with OAuth2

# 3. Plan and research
/sdd:02-plan Focus on security

# 4. Break down tasks
/sdd:03-tasks Prioritize MVP

# 5. Implement (includes automatic code review)
/sdd:04-implement

# 6. Document feature
/sdd:05-document

# 7. Create PR
/git:create-pr
```

### Test-Driven Pack

**For:** Developers prioritizing test coverage and TDD methodology

```bash
/plugin install tdd@NeoLabHQ/context-engineering-kit
/plugin install sadd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**What you get:**
- TDD methodology skill (always active)
- Subagent-driven task isolation
- Test coverage review
- Improvement loops

**Token impact:** Medium-High (two always-active skills)

**Typical workflow:**
```bash
# 1. Implement with TDD (skill guides approach)
# ... write test first, then implementation ...

# 2. Review test coverage
/code-review:review-local-changes

# 3. Reflect on implementation
/reflexion:reflect

# 4. Memorize patterns
/reflexion:memorize
```

### Problem-Solving Pack

**For:** Debugging, root cause analysis, and systematic problem solving

```bash
/plugin install kaizen@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**What you get:**
- Kaizen analysis techniques (5 Whys, Fishbone, PDCA, etc.)
- Kaizen skill for continuous improvement
- Code review for understanding behavior
- Reflexion for solution validation

**Token impact:** Medium (kaizen skill always active)

**Typical workflow:**
```bash
# 1. Identify problem
/kaizen:why Users seeing 500 errors on checkout

# 2. For complex issues
/kaizen:cause-and-effect API latency over 3 seconds

# 3. Review related code
/code-review:review-local-changes

# 4. Implement fix
# ... fix implementation ...

# 5. Validate fix
/reflexion:reflect

# 6. Document learnings
/kaizen:analyse-problem Production checkout failure
/reflexion:memorize
```

### Enterprise Pack

**For:** Large teams requiring comprehensive standards and documentation

```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install ddd@NeoLabHQ/context-engineering-kit
/plugin install tdd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
/plugin install tech-stack@NeoLabHQ/context-engineering-kit
/plugin install kaizen@NeoLabHQ/context-engineering-kit
```

**What you get:**
- Complete development methodology
- Architecture and testing guidance
- Comprehensive quality checks
- Documentation maintenance
- Problem-solving frameworks

**Token impact:** Very High (multiple always-active skills)

**Use when:**
- Quality is paramount
- Token cost not a constraint
- Team consistency critical
- Comprehensive process required

## Plugin Compatibility Matrix

### Highly Compatible (Use Together Frequently)

| Plugin 1 | Plugin 2 | Why They Work Well |
|----------|----------|-------------------|
| **SDD** | **Code Review** | Code review integrated into SDD implementation stage |
| **SDD** | **Git** | Spec branches, issue analysis, PR creation |
| **SDD** | **Docs** | Documentation stage updates docs systematically |
| **Code Review** | **Reflexion** | Review → Reflect → Improve cycle |
| **Kaizen** | **Code Review** | Problem analysis → Code understanding → Solution |
| **Kaizen** | **Reflexion** | Analysis → Solution → Validation → Memorize |
| **TDD** | **SADD** | Test-first approach with task isolation |
| **TDD** | **Code Review** | Test coverage validation |
| **DDD** | **SDD** | Architecture principles guide specification |
| **Git** | **Code Review** | Pre-commit review → Commit |

### Compatible (Work Well Together)

| Plugin 1 | Plugin 2 | Integration Point |
|----------|----------|------------------|
| **DDD** | **TDD** | Both guide implementation approach |
| **DDD** | **Code Review** | Architecture validation |
| **SADD** | **Code Review** | Review between subagent tasks |
| **Docs** | **Any** | Documentation complements any workflow |
| **Tech Stack** | **Any** | Setup stage for any workflow |
| **Customaize** | **Any** | Create custom integrations |

### Overlapping (Choose One)

| Plugin 1 | Plugin 2 | Overlap | Recommendation |
|----------|----------|---------|----------------|
| **SDD** | **TDD** | Both define full workflow | Use SDD for complex features, TDD for focused components |
| **SDD** | **SADD** | Both use subagents | Use SDD for full feature lifecycle, SADD for task-based work |
| **Kaizen** | **Reflexion** | Both do analysis | Use Kaizen for problems, Reflexion for improvements |

## Workflow Combinations

### Code Quality Workflow

**Goal:** Ensure high code quality before committing

**Plugins:** Code Review + Reflexion + Git

```bash
# 1. Implement feature
# ... coding ...

# 2. Multi-agent review
/code-review:review-local-changes

# 3. Address critical issues
# ... fix bugs, security issues ...

# 4. Reflect and improve
/reflexion:reflect

# 5. Implement improvements
# ... refactor based on feedback ...

# 6. Commit with proper message
/git:commit

# 7. Save learnings for future
/reflexion:memorize
```

**Why this works:**
- Code Review catches bugs, security issues, and quality problems
- Reflexion validates overall approach and suggests improvements
- Git automates commit messages
- Memorize captures patterns in CLAUDE.md

### Feature Development Workflow

**Goal:** Build new features with specifications and quality gates

**Plugins:** SDD + Code Review + Docs + Git

```bash
# 1. Create specification
/sdd:01-specify Add real-time notifications with WebSockets

# 2. Plan and research
/sdd:02-plan Focus on scalability and existing patterns

# 3. Break into tasks
/sdd:03-tasks Use iterative approach

# 4. Implement with quality gates
/sdd:04-implement
# (Code review happens automatically during implementation)

# 5. Document feature
/sdd:05-document Include API examples

# 6. Create pull request
/git:create-pr

# 7. Review PR
/code-review:review-pr
```

**Why this works:**
- Specification creates shared understanding
- Planning prevents architectural mistakes
- Tasks provide clear roadmap
- Automatic code review during implementation
- Documentation stays synchronized
- PR creation and review streamlined

### Debugging and Problem Solving Workflow

**Goal:** Systematically debug issues and implement solutions

**Plugins:** Kaizen + Code Review + Reflexion + Git

```bash
# 1. Start with quick root cause analysis
/kaizen:why Payment processing fails intermittently

# If complex, escalate to comprehensive analysis
/kaizen:cause-and-effect Payment failures

# 2. Understand related code
/code-review:review-local-changes

# 3. Implement fix
# ... fix implementation ...

# 4. Validate solution
/reflexion:reflect

# 5. Document incident (for major issues)
/kaizen:analyse-problem Payment processing outage

# 6. Commit fix
/git:commit

# 7. Memorize debugging insights
/reflexion:memorize
```

**Why this works:**
- Kaizen identifies root cause systematically
- Code Review helps understand existing implementation
- Reflexion validates the fix approach
- A3 problem solving documents major incidents
- Memorize prevents similar issues

### Test-Driven Development Workflow

**Goal:** Implement features test-first with quality assurance

**Plugins:** TDD + SADD + Code Review + Reflexion

```bash
# 1. Break feature into tasks
# Use SADD to isolate tasks

# 2. For each task, follow TDD
# - Write failing test
# - Implement minimal code to pass
# - Refactor
# (TDD skill guides this automatically)

# 3. Review test coverage
/code-review:review-local-changes

# 4. Improve based on feedback
/reflexion:reflect

# 5. Memorize testing patterns
/reflexion:memorize
```

**Why this works:**
- TDD skill enforces test-first approach
- SADD provides fresh context per task
- Code Review validates test coverage
- Reflexion identifies testing improvements

### Continuous Improvement Workflow

**Goal:** Iteratively improve code and processes

**Plugins:** Kaizen + Reflexion + Code Review

```bash
# 1. Analyze current state
/kaizen:analyse codebase for technical debt

# 2. Plan improvement cycle
/kaizen:plan-do-check-act Reduce build time from 10min to 5min

# Plan Phase: Identify slowest parts
/kaizen:analyse build pipeline

# 3. Implement improvement
# ... optimize build ...

# Do Phase: Make changes

# 4. Review changes
/code-review:review-local-changes

# 5. Validate improvement
/reflexion:reflect

# Check Phase: Measure impact

# 6. Document learnings
/reflexion:memorize

# Act Phase: Standardize or iterate
```

**Why this works:**
- PDCA provides structured improvement framework
- Kaizen analysis identifies opportunities
- Code Review validates changes
- Reflexion confirms improvements
- Memorize standardizes successful patterns

## Advanced Integration Patterns

### Sequential Chaining

Execute commands in sequence for complete workflows:

```bash
# Quality chain
/code-review:review-local-changes
# (review output)
/reflexion:reflect
# (implement improvements)
/git:commit

# Problem-solving chain
/kaizen:why
# (implement fix)
/reflexion:reflect
/reflexion:memorize
```

### Conditional Branching

Choose different paths based on situation:

```bash
# For simple problems
/kaizen:why → fix → /git:commit

# For complex problems
/kaizen:cause-and-effect →
/kaizen:analyse-problem →
fix →
/reflexion:critique →
/reflexion:memorize

# For urgent vs. planned work
Urgent: Code Review → Git → (skip reflection)
Planned: SDD → Code Review → Reflexion → Git
```

### Feedback Loops

Create improvement cycles:

```bash
# Implementation loop
Implement → /code-review:review-local-changes →
Fix issues → /reflexion:reflect →
Improve → /reflexion:memorize

# PDCA loop
/kaizen:plan-do-check-act →
Implement (Do) →
/code-review:review-local-changes (Check) →
/reflexion:memorize (Act)
```

### Parallel Execution

Some commands work on different aspects simultaneously:

```bash
# Parallel analysis (same code, different perspectives)
/code-review:review-local-changes (technical quality)
# AND
/kaizen:analyse (waste and efficiency)

# Both provide complementary insights
```

## Best Practices for Combinations

### Start Simple, Add Gradually

1. **Week 1:** Use Essential Pack (Reflexion + Code Review + Git)
2. **Week 2-3:** Add methodology plugin based on needs (SDD, TDD, or DDD)
3. **Week 4+:** Add specialized plugins (Kaizen, Docs, etc.)

### Match Combinations to Task Type

| Task Type | Recommended Combination |
|-----------|------------------------|
| New feature | SDD + Code Review + Git + Docs |
| Bug fix | Kaizen + Code Review + Reflexion |
| Refactoring | Code Review + Reflexion + DDD |
| Testing | TDD + SADD + Code Review |
| Documentation | Docs + SDD |
| Setup | Tech Stack + DDD |

### Avoid Over-Combination

**Don't do this:**
```bash
# Too many plugins for simple change
/sdd:01-specify
/sdd:02-plan
/sdd:03-tasks
/code-review:review-local-changes
/reflexion:reflect
/reflexion:critique
/kaizen:analyse
# ... just to fix a typo!
```

**Do this instead:**
```bash
# Fix the typo
# Quick review
/code-review:review-local-changes
# Commit
/git:commit
```

**Rule of thumb:** Use plugins proportional to change complexity.

### Create Project Templates

Document standard combinations for your team:

```markdown
# CLAUDE.md

## Standard Workflows

### Feature Development
1. /sdd:01-specify [feature]
2. /sdd:02-plan
3. /sdd:03-tasks
4. /sdd:04-implement
5. /sdd:05-document
6. /git:create-pr

### Bug Fixes
1. /kaizen:why [problem]
2. Fix implementation
3. /code-review:review-local-changes
4. /git:commit

### Code Improvements
1. /kaizen:analyse [target]
2. /reflexion:reflect
3. Implement improvements
4. /reflexion:memorize
```

### Use Memorization Strategically

Capture learnings from combined workflows:

```bash
# After completing workflow
/reflexion:memorize

# This updates CLAUDE.md with:
# - Insights from code review
# - Root causes from kaizen analysis
# - Patterns from reflexion
# - Best practices discovered
```

## Token Management with Combinations

### Low Token Combinations

Commands-only plugins, minimal overlap:

```bash
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
```

**Estimated token impact:** ~500-1000 tokens for commands definitions

### Medium Token Combinations

Mix of skills and commands:

```bash
/plugin install ddd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**Estimated token impact:** ~2000-3000 tokens (DDD skill adds context)

### High Token Combinations

Multiple skills or subagent-heavy plugins:

```bash
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install ddd@NeoLabHQ/context-engineering-kit
/plugin install tdd@NeoLabHQ/context-engineering-kit
/plugin install kaizen@NeoLabHQ/context-engineering-kit
```

**Estimated token impact:** ~5000-8000 tokens (multiple always-active skills)

**See [Optimization](./optimization.md) for detailed token management strategies.**

## Team Adoption Patterns

### Phase 1: Individual Adoption

**Week 1-2:**
- Each developer installs Essential Pack
- Experiments with workflows
- Shares experiences

**Week 3-4:**
- Team discusses which additional plugins help
- Identifies common needs
- Agrees on standard combinations

### Phase 2: Team Standards

**Week 5-6:**
- Document standard combinations in team CLAUDE.md
- Create workflow templates
- Establish when to use each combination

### Phase 3: Optimization

**Week 7+:**
- Review token usage
- Optimize combinations
- Remove unused plugins
- Refine workflows

**See [Team Workflows](./team-workflows.md) for detailed team adoption strategies.**

## Troubleshooting Combinations

### Commands Not Working Together

**Problem:** Commands from different plugins conflict

**Solution:**
- Most CEK plugins are designed to work together
- If conflicts occur, check command order
- Some workflows expect specific sequences (e.g., SDD stages)

### Too Much Output

**Problem:** Multiple plugins produce overwhelming output

**Solution:**
- Use commands selectively, not all at once
- Choose one analysis plugin per task (Kaizen OR Reflexion)
- Use Code Review for specific reviews, not exploratory analysis

### Skills Conflicting

**Problem:** Multiple skills give conflicting guidance

**Solution:**
- DDD + TDD + Kaizen skills actually complement each other
- If genuinely conflicting, uninstall one
- DDD for architecture, TDD for testing, Kaizen for quality
- Choose based on which aspect is most important for your project

### Context Limits

**Problem:** Too many plugins fill context window

**Solution:**
- Uninstall plugins with skills if not actively using
- Keep command-only plugins (minimal token cost)
- Install plugins temporarily for specific tasks
- See [Optimization](./optimization.md)

## Summary

**Key Takeaways:**

1. **Use starter packs** - Pre-configured combinations for common scenarios
2. **Start with Essential Pack** - Reflexion + Code Review + Git works for everyone
3. **Match task complexity** - Simple changes need fewer plugins
4. **Create workflow templates** - Document standard combinations for your team
5. **Manage tokens** - Skills add context, commands don't until used
6. **Iterate combinations** - Adjust based on what works for your workflow

**Recommended starting combinations by role:**

- **Solo developer:** Essential Pack
- **Quality-focused:** Quality-Focused Pack
- **Team lead:** Spec-Driven Pack
- **TDD practitioner:** Test-Driven Pack
- **Debugger/firefighter:** Problem-Solving Pack
- **Enterprise team:** Enterprise Pack (if tokens allow)

## See Also

**Guides:**
- [Choosing Plugins](./choosing-plugins.md) - Selecting individual plugins to combine
- [Custom Workflows](./custom-workflows.md) - Building workflows with plugin combinations
- [Optimization](./optimization.md) - Token management for multiple plugins
- [Team Workflows](./team-workflows.md) - Team plugin combination strategies

**Concepts:**
- [Token Efficiency](../concepts/token-efficiency.md) - Managing combined plugin costs
- [Quality Gates](../concepts/quality-gates.md) - Review patterns in combinations

**Reference:**
- [Command Index](../reference/command-index.md) - Commands to combine
- [Skill Index](../reference/skill-index.md) - Understanding skill interactions
