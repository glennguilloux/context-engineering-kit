# Custom Workflows

How to create custom, repeatable workflows combining multiple Context Engineering Kit plugins.

## Overview

While individual commands are powerful, real productivity comes from chaining commands into custom workflows that match your development process. This guide shows you how to:

- Create step-by-step workflows for common tasks
- Chain commands effectively
- Document workflows for reuse
- Build project-specific patterns
- Share workflows with your team

**Key Principle:** Workflows should be repeatable, documented, and optimized for your specific context.

## Understanding Workflows

### What is a Workflow?

A workflow is a sequence of commands that accomplish a specific goal:

```bash
# Example: Feature development workflow
/sdd:01-specify [feature]  # Step 1: Create spec
/sdd:02-plan               # Step 2: Plan architecture
/sdd:03-tasks              # Step 3: Break into tasks
/sdd:04-implement          # Step 4: Implement
/sdd:05-document           # Step 5: Document
/git:create-pr             # Step 6: Create PR
```

### Workflow Components

**Entry Point:** What triggers the workflow (new feature, bug report, refactoring task)

**Steps:** Sequence of commands and manual actions

**Decision Points:** Where to branch based on situation

**Exit Criteria:** When the workflow is complete

**Artifacts:** What the workflow produces (code, docs, specs)

## Core Workflow Patterns

### 1. Review-Improve-Commit Pattern

**Use for:** Ensuring quality before committing any changes

**Plugins needed:**
- Code Review
- Reflexion
- Git

**Workflow:**

```bash
# 1. Review your changes
/code-review:review-local-changes

# 2. Address any critical issues found
# ... fix bugs, security vulnerabilities ...

# 3. Reflect on overall approach
/reflexion:reflect

# 4. Implement suggested improvements
# ... refactor based on feedback ...

# 5. Commit with proper message
/git:commit

# 6. Memorize learnings (optional, periodic)
/reflexion:memorize
```

**When to use:**
- Before every commit
- After completing any feature or fix
- Before creating pull requests

**Expected outcome:**
- Clean, reviewed code
- Well-formatted commit message
- Captured learnings in CLAUDE.md

### 2. Problem-Solution-Validate Pattern

**Use for:** Systematically debugging and fixing issues

**Plugins needed:**
- Kaizen
- Code Review
- Reflexion
- Git

**Workflow:**

```bash
# 1. Identify root cause
/kaizen:why [problem description]

# For complex issues, escalate:
/kaizen:cause-and-effect [problem description]

# 2. Understand related code
/code-review:review-local-changes [relevant files]

# 3. Implement fix
# ... fix implementation ...

# 4. Validate solution
/reflexion:reflect

# 5. For major incidents, document
/kaizen:analyse-problem [incident description]

# 6. Commit the fix
/git:commit

# 7. Save debugging insights
/reflexion:memorize
```

**When to use:**
- Bug investigation and fixing
- Performance issues
- Incident response
- Root cause analysis

**Expected outcome:**
- Understood root cause
- Validated fix
- Documented incident (if major)
- Prevented future similar issues

### 3. Specify-Build-Document Pattern

**Use for:** Building new features with specifications

**Plugins needed:**
- SDD
- Code Review
- Docs
- Git

**Workflow:**

```bash
# 1. Create detailed specification
/sdd:01-specify [feature description]

# 2. Plan architecture and research
/sdd:02-plan [focus areas]

# 3. Break down into tasks
/sdd:03-tasks [strategy preferences]

# 4. Implement with quality gates
/sdd:04-implement [implementation preferences]
# Note: Code review happens automatically

# 5. Document the feature
/sdd:05-document [documentation focus]

# 6. Create pull request
/git:create-pr

# 7. Review the PR (optional, can be done by team)
/code-review:review-pr
```

**When to use:**
- New features
- Complex integrations
- Features requiring documentation
- Team collaboration scenarios

**Expected outcome:**
- Complete specification
- Well-architected implementation
- Comprehensive documentation
- Ready-to-review PR

### 4. Test-Implement-Validate Pattern

**Use for:** Test-driven development with quality assurance

**Plugins needed:**
- TDD
- SADD (optional)
- Code Review
- Reflexion

**Workflow:**

```bash
# TDD skill guides this automatically, but explicit steps:

# 1. Write failing test
# ... write test ...

# 2. Implement minimal code to pass
# ... implementation ...

# 3. Run test (should pass)
# ... test passes ...

# 4. Refactor
# ... improve code quality ...

# 5. Review test coverage
/code-review:review-local-changes

# 6. Reflect on implementation
/reflexion:reflect

# 7. Memorize testing patterns (periodic)
/reflexion:memorize
```

**When to use:**
- Implementing testable components
- Building critical business logic
- When high test coverage required
- Preventing regressions

**Expected outcome:**
- Well-tested code
- Good test coverage
- Clean implementation
- Documented testing patterns

### 5. Analyze-Improve-Standardize Pattern

**Use for:** Continuous improvement of code and processes

**Plugins needed:**
- Kaizen
- Reflexion
- Code Review

**Workflow:**

```bash
# 1. Analyze current state
/kaizen:analyse [target area]

# 2. Plan improvement using PDCA
/kaizen:plan-do-check-act [improvement goal]

# PLAN: Identify opportunities
# (Kaizen analysis provides this)

# DO: Implement improvement
# ... make changes ...

# CHECK: Review changes
/code-review:review-local-changes

# 3. Validate improvement
/reflexion:reflect

# 4. Document and standardize
/reflexion:memorize

# ACT: Next cycle or standardize
```

**When to use:**
- Technical debt reduction
- Performance optimization
- Process improvement
- Code quality initiatives

**Expected outcome:**
- Measured improvement
- Validated changes
- Standardized approach
- Documented learnings

## Workflow Templates

### Quick Fix Workflow

**Scenario:** Small bug fix, low risk

```bash
# 1. Understand the problem
/kaizen:why [bug description]

# 2. Implement fix
# ... quick fix ...

# 3. Quick review
/code-review:review-local-changes

# 4. Commit
/git:commit
```

**Time:** 5-10 minutes

### Feature Development Workflow

**Scenario:** New feature, medium complexity

```bash
# 1. Brainstorm if requirements unclear
/sdd:brainstorm [rough idea]

# 2. Create specification
/sdd:01-specify [refined feature]

# 3. Plan architecture
/sdd:02-plan

# 4. Break into tasks
/sdd:03-tasks

# 5. Implement
/sdd:04-implement

# 6. Document
/sdd:05-document

# 7. Create PR
/git:create-pr
```

**Time:** 2-8 hours depending on complexity

### Refactoring Workflow

**Scenario:** Improve code quality, no new features

```bash
# 1. Analyze current state
/kaizen:analyse [code area]

# 2. Identify improvements
/reflexion:critique

# 3. Plan refactoring
# ... identify safe refactoring steps ...

# 4. Refactor incrementally
# ... refactor in small steps ...

# 5. Review after each step
/code-review:review-local-changes

# 6. Validate improvements
/reflexion:reflect

# 7. Commit each safe step
/git:commit

# 8. Memorize patterns
/reflexion:memorize
```

**Time:** 1-4 hours

### PR Review Workflow

**Scenario:** Reviewing team member's pull request

```bash
# 1. Review the PR
/code-review:review-pr

# 2. For complex PRs, deeper analysis
/kaizen:analyse [PR changes]

# 3. Provide feedback
# ... add review comments ...

# 4. If concerns, request discussion
/reflexion:critique [specific concerns]
```

**Time:** 15-45 minutes

### Documentation Update Workflow

**Scenario:** Update or create project documentation

```bash
# 1. Update implementation docs
/docs:update-docs

# 2. For API documentation
/sdd:05-document Focus on API documentation

# 3. Review documentation quality
/reflexion:reflect

# 4. Commit documentation
/git:commit Documentation updates
```

**Time:** 30-60 minutes

### Incident Response Workflow

**Scenario:** Production issue requiring immediate attention

```bash
# 1. Quick root cause analysis
/kaizen:why [incident description]

# 2. Implement hotfix
# ... emergency fix ...

# 3. Quick validation
/reflexion:reflect

# 4. Deploy fix
# ... deployment ...

# 5. Post-incident analysis
/kaizen:analyse-problem [complete incident description]

# 6. Memorize prevention strategies
/reflexion:memorize

# 7. Create follow-up tasks
# ... long-term fixes, improvements ...
```

**Time:** 1-2 hours

## Project-Specific Workflows

### Example: API Development Project

**Project setup:**

```bash
# Once per project
/sdd:00-setup Follow OpenAPI standards and REST best practices
/ddd:setup-code-formating
/tech-stack:add-typescript-best-practices
```

**New endpoint workflow:**

```bash
# 1. Specify endpoint
/sdd:01-specify Add POST /api/users endpoint

# 2. Plan implementation
/sdd:02-plan Focus on validation and error handling

# 3. Generate tasks
/sdd:03-tasks Follow API conventions

# 4. Implement
/sdd:04-implement Include integration tests

# 5. Document API
/sdd:05-document Update OpenAPI spec

# 6. Create PR
/git:create-pr
```

### Example: React Component Library

**Project setup:**

```bash
# Once per project
/tech-stack:add-typescript-best-practices
/ddd:setup-code-formating
```

**New component workflow:**

```bash
# 1. Specify component
/sdd:01-specify Add DatePicker component

# 2. Plan implementation
/sdd:02-plan Focus on accessibility and theming

# 3. TDD approach for component
# Write test
# Implement component
# Refactor

# 4. Review accessibility
/code-review:review-local-changes

# 5. Document component
/docs:update-docs

# 6. Create PR with Storybook examples
/git:create-pr
```

### Example: Data Pipeline Project

**Project setup:**

```bash
# Once per project
/sdd:00-setup Follow data pipeline best practices
```

**New pipeline workflow:**

```bash
# 1. Specify pipeline
/sdd:01-specify Add ETL pipeline for user events

# 2. Plan architecture
/sdd:02-plan Focus on scalability and error handling

# 3. Implement with monitoring
/sdd:04-implement Include observability

# 4. Analyze for waste
/kaizen:analyse [pipeline code]

# 5. Optimize
# ... implement optimizations ...

# 6. Document pipeline
/sdd:05-document Include data flow diagrams

# 7. Create PR
/git:create-pr
```

## Advanced Workflow Patterns

### Conditional Workflows

Branch based on situation:

```bash
# Assess complexity first
If simple bug:
    /kaizen:why → fix → /git:commit

If complex bug:
    /kaizen:cause-and-effect →
    /kaizen:analyse-problem →
    fix →
    /reflexion:critique →
    /reflexion:memorize

If performance issue:
    /kaizen:analyse →
    /kaizen:plan-do-check-act →
    optimize →
    measure →
    /reflexion:memorize
```

### Iterative Workflows

Loop until criteria met:

```bash
# PDCA improvement loop
REPEAT:
    # Plan
    /kaizen:plan-do-check-act [goal]

    # Do
    Implement changes

    # Check
    /code-review:review-local-changes
    /reflexion:reflect

    # Act
    IF goal met:
        /reflexion:memorize
        BREAK
    ELSE:
        Continue to next iteration
```

### Parallel Workflows

Execute independently:

```bash
# Developer A: Implements feature
/sdd:04-implement

# Developer B: Prepares documentation
/docs:update-docs [related docs]

# Both: Review together
/code-review:review-pr
```

### Nested Workflows

Workflow within workflow:

```bash
# Main: Feature development
/sdd:01-specify
/sdd:02-plan
/sdd:03-tasks

# For each task in tasks.md:
    # Nested: Task implementation workflow
    Implement task
    /code-review:review-local-changes
    /reflexion:reflect
    Mark task complete

# Resume main workflow
/sdd:05-document
/git:create-pr
```

## Documenting Workflows

### In Project CLAUDE.md

Document team-standard workflows:

```markdown
# CLAUDE.md

## Standard Workflows

### Feature Development

1. Create specification: `/sdd:01-specify [feature]`
2. Plan architecture: `/sdd:02-plan`
3. Break into tasks: `/sdd:03-tasks`
4. Implement: `/sdd:04-implement`
5. Document: `/sdd:05-document`
6. Create PR: `/git:create-pr`

**Use for:** All new features

### Bug Fixes

1. Root cause: `/kaizen:why [bug]`
2. Implement fix
3. Review: `/code-review:review-local-changes`
4. Commit: `/git:commit`

**Use for:** All bug fixes except critical hotfixes

### Critical Hotfix

1. Quick analysis: `/kaizen:why [issue]`
2. Implement fix
3. Deploy immediately
4. Post-incident: `/kaizen:analyse-problem [incident]`
5. Create follow-up tasks

**Use for:** Production incidents only
```

### In Workflow Scripts

For frequently-used workflows, create helper scripts:

```bash
# scripts/feature-workflow.sh
#!/bin/bash

echo "Starting feature development workflow..."
echo "Step 1: Specification"
claude "/sdd:01-specify $1"

echo "Step 2: Planning"
claude "/sdd:02-plan"

echo "Step 3: Tasks"
claude "/sdd:03-tasks"

echo "Ready to implement. Run: claude '/sdd:04-implement'"
```

**Note:** This requires Claude CLI with command execution support.

### In Team Wiki

Create wiki pages for complex workflows:

```markdown
# Feature Development Workflow

## Overview
Complete workflow for developing new features following SDD methodology.

## Prerequisites
- Feature requirement document
- Plugins installed: SDD, Code Review, Git, Docs

## Steps

### 1. Specification (30-60 min)
- Command: `/sdd:01-specify [feature]`
- Input: Feature description
- Output: `specs/NNN-feature/spec.md`
- Review: Ensure spec passes quality checklist

### 2. Planning (1-2 hours)
...

## Troubleshooting

### "Specification quality check fails"
- Provide more detailed feature description
- Answer clarifying questions thoroughly
...
```

## Workflow Optimization

### Reduce Redundancy

**Before:**
```bash
/code-review:review-local-changes
/reflexion:reflect
/reflexion:critique
# Too much analysis!
```

**After:**
```bash
/code-review:review-local-changes
/reflexion:reflect
# Critique only for major decisions
```

### Skip Steps When Appropriate

**Full workflow:**
```bash
/sdd:01-specify
/sdd:02-plan
/sdd:03-tasks
/sdd:04-implement
/sdd:05-document
```

**For simple changes:**
```bash
# Skip specification, jump to implementation
/sdd:04-implement
# Skip documentation if already complete
```

### Batch Operations

**Instead of:**
```bash
Fix bug 1 → /git:commit
Fix bug 2 → /git:commit
Fix bug 3 → /git:commit
```

**Do:**
```bash
Fix all three bugs
/code-review:review-local-changes
/reflexion:reflect
/git:commit "Fix multiple related bugs"
```

### Parallel Execution

**Sequential (slower):**
```bash
Implement feature A
Review feature A
Implement feature B
Review feature B
```

**Parallel (faster):**
```bash
# Developer 1
Implement feature A

# Developer 2
Implement feature B

# Both
Review together
```

## Measuring Workflow Effectiveness

### Track Metrics

**Time metrics:**
- Time to complete workflow
- Time saved vs manual process
- Bottleneck identification

**Quality metrics:**
- Bugs found before commit
- Issues prevented
- Code review feedback volume

**Team metrics:**
- Workflow adoption rate
- Consistency across team
- Onboarding time for new members

### Iterate and Improve

Use Kaizen PDCA for workflow improvement:

```bash
# Analyze current workflow
/kaizen:analyse [workflow name]

# Plan improvement
/kaizen:plan-do-check-act Reduce feature workflow from 4h to 2h

# Do: Implement workflow changes
# Check: Measure improvement
# Act: Standardize or iterate
```

### Collect Team Feedback

```markdown
# Retrospective Questions

1. Which workflows work well?
2. Which workflows are cumbersome?
3. Where do we get stuck?
4. What steps could be eliminated?
5. What's missing?
```

## Common Workflow Pitfalls

### Over-Engineering Workflows

**Problem:** Workflow too complex for simple tasks

**Solution:**
- Create multiple workflows (simple, standard, comprehensive)
- Choose appropriate workflow for task complexity
- Allow skipping steps when justified

### Under-Documenting Workflows

**Problem:** Team uses workflows inconsistently

**Solution:**
- Document workflows in CLAUDE.md
- Include when to use each workflow
- Provide examples
- Regular team review

### Ignoring Workflow Feedback

**Problem:** Workflows don't improve over time

**Solution:**
- Regular retrospectives
- Track workflow metrics
- Update based on learnings
- Use `/reflexion:memorize` to capture improvements

### Rigid Workflow Adherence

**Problem:** Following workflow when situation calls for deviation

**Solution:**
- Workflows are guidelines, not laws
- Empower team to adapt
- Document common deviations
- Review and standardize successful deviations

## Example: Complete Feature Workflow

**Scenario:** Implementing user authentication feature

### Stage 1: Setup (one-time)

```bash
# Add marketplace
/plugin marketplace add NeoLabHQ/context-engineering-kit

# Install plugins
/plugin install sdd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
/plugin install docs@NeoLabHQ/context-engineering-kit
/plugin install ddd@NeoLabHQ/context-engineering-kit

# Setup project
/sdd:00-setup Follow SOLID principles and Clean Architecture
/ddd:setup-code-formating
```

### Stage 2: Specification (1 hour)

```bash
# Create spec
claude "I need to add user authentication to our API"
/sdd:01-specify Add JWT-based authentication with email/password login, OAuth2 providers (Google, GitHub), and refresh token rotation
```

**Output:** `specs/001-user-auth/spec.md`

### Stage 3: Planning (2 hours)

```bash
/sdd:02-plan Focus on security best practices and integration with existing user model
```

**Output:**
- `specs/001-user-auth/research.md`
- `specs/001-user-auth/plan.md`
- `specs/001-user-auth/data-model.md`
- `specs/001-user-auth/contract.md`

### Stage 4: Task Breakdown (30 min)

```bash
/sdd:03-tasks Use TDD approach, prioritize core authentication before OAuth
```

**Output:** `specs/001-user-auth/tasks.md`

### Stage 5: Implementation (4-8 hours)

```bash
/sdd:04-implement Follow existing code patterns and ensure test coverage
```

**During implementation:**
- Multiple subagents implement phases
- Automatic code review between phases
- Test-driven approach
- Progress tracked in tasks.md

### Stage 6: Documentation (1 hour)

```bash
/sdd:05-document Focus on API documentation, authentication flow diagrams, and security considerations
```

**Output:** Updated docs/ directory with API guides

### Stage 7: Pull Request (15 min)

```bash
# Create PR with GitHub CLI
/git:create-pr

# Review own PR
/code-review:review-pr
```

### Stage 8: Learning Capture (10 min)

```bash
# Capture insights for future
/reflexion:memorize
```

**Total time:** 8-12 hours for complete, documented, reviewed feature

## See Also

**Guides:**
- [Choosing Plugins](./choosing-plugins.md) - Selecting plugins for workflows
- [Combining Plugins](./combining-plugins.md) - Plugin patterns in workflows
- [Optimization](./optimization.md) - Optimizing workflow efficiency
- [Team Workflows](./team-workflows.md) - Documenting and sharing team workflows

**Concepts:**
- [Agent Workflows](../concepts/agent-workflows.md) - Agent patterns in workflows
- [Quality Gates](../concepts/quality-gates.md) - Quality checkpoints in workflows

**Reference:**
- [Command Index](../reference/command-index.md) - All workflow building blocks

## Summary

**Key Takeaways:**

1. **Workflows are sequences** - Chain commands to accomplish goals
2. **Match workflow to complexity** - Simple tasks need simple workflows
3. **Document workflows** - In CLAUDE.md, wiki, or scripts
4. **Iterate and improve** - Use PDCA on workflows themselves
5. **Share with team** - Consistency through documentation

**Core workflow patterns:**
- Review-Improve-Commit (daily use)
- Problem-Solution-Validate (debugging)
- Specify-Build-Document (new features)
- Test-Implement-Validate (TDD)
- Analyze-Improve-Standardize (continuous improvement)

**Workflow documentation locations:**
- **CLAUDE.md** - Team-standard workflows
- **Team wiki** - Detailed workflow guides
- **Scripts** - Automated workflow helpers
- **Examples** - Project-specific workflows

Start with basic patterns, evolve based on your needs, and always document what works.
