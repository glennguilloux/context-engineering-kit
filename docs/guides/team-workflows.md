# Team Workflows

Patterns and best practices for using Context Engineering Kit in team settings.

## Overview

Using CEK plugins on a team requires coordination, standards, and shared conventions. This guide covers:

- Establishing team plugin standards
- Shared CLAUDE.md conventions
- Onboarding new team members
- Collaboration patterns
- Consistency and quality gates
- Team decision-making

**Key Principle:** Consistency through documentation. Teams succeed when everyone follows the same patterns.

## Establishing Team Standards

### Phase 1: Discovery (Week 1-2)

**Goal:** Let individual developers experiment and share experiences.

#### Individual Experimentation

```bash
# Each developer installs Essential Pack
/plugin marketplace add NeoLabHQ/context-engineering-kit

/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
```

**Activities:**
- Try commands on real work
- Note what's helpful vs. cumbersome
- Identify pain points
- Share experiences in team chat/standup

#### Team Discussion

**Topics to discuss:**

1. **Which plugins helped most?**
   - Code Review catching bugs?
   - Reflexion improving code?
   - Git simplifying commits?

2. **Which plugins were confusing?**
   - Too complex?
   - Unclear when to use?
   - Redundant with existing process?

3. **What problems remain unsolved?**
   - Specification process?
   - Testing consistency?
   - Documentation maintenance?

4. **Token constraints?**
   - Any context limit issues?
   - Performance concerns?
   - Need optimization?

### Phase 2: Standardization (Week 3-4)

**Goal:** Agree on team-standard plugins and workflows.

#### Plugin Selection Meeting

**Agenda:**

1. **Core plugins (must install):**
   - Which plugins should everyone have?
   - Example: Code Review + Git for consistency

2. **Recommended plugins (optional but encouraged):**
   - Which plugins help but aren't mandatory?
   - Example: Reflexion for self-improvement

3. **Specialized plugins (role-specific):**
   - Which plugins for specific roles?
   - Example: SDD for feature leads, TDD for backend

4. **Prohibited plugins (team decides against):**
   - Which plugins conflict with team process?
   - Why? Document reasoning

#### Document Decisions

**Create `docs/PLUGINS.md`:**

```markdown
# Team Plugin Standards

## Required Plugins (Everyone)

### Code Review
**Why:** Consistent code quality checks before commits
**When:** Before every commit to main branch

### Git
**Why:** Standardized commit messages
**When:** Every commit

## Recommended Plugins (Encouraged)

### Reflexion
**Why:** Continuous improvement culture
**When:** After completing features, periodically

### Kaizen
**Why:** Systematic problem solving
**When:** Debugging, incident response, retrospectives

## Specialized Plugins (Role-Specific)

### SDD (Feature Leads Only)
**Why:** Formal specifications for complex features
**When:** New features requiring multiple developers

### TDD (Backend Team)
**Why:** High test coverage requirement
**When:** All backend implementation

## Installation

# Required for all developers
/plugin marketplace add NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit

# Add based on role and preference
```

### Phase 3: Implementation (Week 5-6)

**Goal:** Adopt standards in daily work.

#### Team Workflows Document

**Create `docs/WORKFLOWS.md`:**

```markdown
# Team Development Workflows

## Feature Development

### Small Features (<4 hours)

1. Create feature branch
2. Implement feature
3. Review: `/code-review:review-local-changes`
4. Address issues
5. Commit: `/git:commit`
6. Create PR: `/git:create-pr`
7. Team review in GitHub

### Large Features (>4 hours)

1. Specification: `/sdd:01-specify [feature]`
2. Team review of spec in daily standup
3. Planning: `/sdd:02-plan`
4. Task breakdown: `/sdd:03-tasks`
5. Implementation: `/sdd:04-implement`
6. Documentation: `/sdd:05-document`
7. PR: `/git:create-pr`
8. Team review

## Bug Fixes

### Minor Bugs

1. Root cause: `/kaizen:why [bug]`
2. Implement fix
3. Review: `/code-review:review-local-changes`
4. Commit: `/git:commit`

### Major Bugs / Incidents

1. Quick analysis: `/kaizen:why [issue]`
2. Implement hotfix
3. Deploy immediately
4. Post-incident: `/kaizen:analyse-problem [incident]`
5. Team retrospective
6. Create prevention tasks

## Code Review

### Self-Review (Before PR)

1. `/code-review:review-local-changes`
2. Address all critical issues
3. `/reflexion:reflect` (optional but encouraged)
4. Fix identified problems

### Team Review (PR)

1. Reviewer runs: `/code-review:review-pr`
2. Combines automated + human review
3. Discussion on complex issues
4. Approval only after both reviews pass

## Refactoring

1. Identify improvement area
2. Analyze: `/kaizen:analyse [target]`
3. Plan approach
4. Incremental changes with `/code-review:review-local-changes` after each
5. Team review of overall refactoring

## Documentation Updates

1. Update implementation: `/docs:update-docs`
2. Review documentation quality
3. Commit documentation separately
4. Include in PR or separate docs PR
```

### Phase 4: Optimization (Week 7+)

**Goal:** Refine based on actual usage.

#### Retrospective Questions

**What's working?**
- Which workflows are smooth?
- Which plugins provide most value?
- What's consistent across team?

**What's not working?**
- Which workflows are cumbersome?
- Which plugins are ignored?
- Where's inconsistency?

**What's missing?**
- Gaps in workflows?
- Need additional plugins?
- Better documentation needed?

#### Iterate Standards

Update `docs/PLUGINS.md` and `docs/WORKFLOWS.md` based on feedback:

```markdown
## Recent Changes

### 2024-01-15: Added Kaizen as recommended
**Reason:** Team found it valuable for debugging
**Who:** Everyone encouraged to use

### 2024-01-10: Removed mandatory TDD plugin
**Reason:** Frontend team doesn't need it, backend-only
**Who:** Backend team only
```

## Shared CLAUDE.md Conventions

### CLAUDE.md Structure

**Standardize structure across team:**

```markdown
# Project Name

## Overview
[Brief project description]

## Architecture Principles
[Core architectural decisions]

## Code Standards
[Formatting, naming, patterns]

## Development Workflows
[Links to WORKFLOWS.md]

## Domain Knowledge
[Business logic, terminology]

## Common Patterns
[Frequently used code patterns]

## Testing Standards
[Test requirements, patterns]

## Recent Learnings
[From /reflexion:memorize - last 30 days]

## Troubleshooting
[Common issues and solutions]
```

### Shared vs. Individual Content

**Shared (in version control):**
- Architecture principles
- Code standards
- Common patterns
- Testing standards
- Core domain knowledge

**Individual (local only):**
- Personal preferences
- Experimental techniques
- Work-in-progress notes

**Implementation:**

```bash
# .gitignore
CLAUDE.md.local

# Workflow
echo "# Personal notes" > CLAUDE.md.local
# Claude will read both CLAUDE.md and CLAUDE.md.local
```

### Updating CLAUDE.md

**Who can update:**
- Anyone can propose updates
- Changes require PR review
- Team lead approves architectural decisions

**When to update:**
```markdown
## When to Update CLAUDE.md

### Immediate Update (no review needed)
- Fix typos or formatting
- Add new troubleshooting tips
- Document new patterns

### Requires Review (create PR)
- Change architectural principles
- Modify code standards
- Update development workflows
- Add/remove plugins from standards

### Team Discussion (meeting needed)
- Major architectural changes
- Workflow overhauls
- Plugin strategy changes
```

### CLAUDE.md Best Practices

**1. Keep it concise:**
```markdown
<!-- Good -->
## Error Handling
- Use custom error classes
- Log errors with context
- Return user-friendly messages

<!-- Bad -->
## Error Handling
In our application, we have decided to implement a comprehensive
error handling strategy that involves creating custom error classes
for different types of errors that may occur in the system...
[continues for paragraphs]
```

**2. Link to detailed docs:**
```markdown
## Authentication
JWT-based auth with refresh tokens. See docs/authentication.md for implementation details.

Key points:
- 15min access token expiry
- Refresh tokens in httpOnly cookies
- OAuth2: Google, GitHub
```

**3. Use sections consistently:**
```markdown
## [Topic]

### What
[What it is]

### Why
[Why we chose this approach]

### How
[How to implement it]

### Examples
[Code examples]
```

**4. Archive old content:**
```markdown
## Recent Learnings (Last 30 days)
[Keep recent only]

## Archive
See LEARNINGS_ARCHIVE.md for historical learnings.
```

## Onboarding New Team Members

### Onboarding Checklist

**Create `docs/ONBOARDING.md`:**

```markdown
# Developer Onboarding

## Setup (Day 1)

### 1. Install Claude Code
Follow Claude Code installation instructions.

### 2. Add Context Engineering Kit Marketplace
\`\`\`bash
claude
/plugin marketplace add NeoLabHQ/context-engineering-kit
\`\`\`

### 3. Install Required Plugins
\`\`\`bash
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
\`\`\`

### 4. Install Recommended Plugins
\`\`\`bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install kaizen@NeoLabHQ/context-engineering-kit
\`\`\`

### 5. Review Team Standards
- Read docs/PLUGINS.md
- Read docs/WORKFLOWS.md
- Review CLAUDE.md

## Learning (Week 1)

### Day 1-2: Familiarization
- Explore codebase with Claude
- Try `/kaizen:analyse` on main components
- Read existing specs in specs/ directory

### Day 3-4: Simple Tasks
- Pick a small bug from backlog
- Follow bug fix workflow
- Practice code review commands
- Get PR reviewed by team

### Day 5: Feature Task
- Pick a small feature
- Follow feature development workflow
- Practice full workflow end-to-end

## Pairing (Week 2)

Pair with experienced team member on:
- Complex feature using SDD workflow
- Bug investigation using Kaizen
- Code review process
- Team collaboration patterns

## Resources

- Team Workflows: docs/WORKFLOWS.md
- Plugin Standards: docs/PLUGINS.md
- Project Context: CLAUDE.md
- Questions: #claude-help Slack channel
```

### Pairing Sessions

**Schedule pairing for:**

1. **First SDD workflow:**
   - Walk through specification creation
   - Review planning stage
   - Explain task breakdown
   - Observe implementation process

2. **First code review:**
   - Explain what to look for
   - How to interpret review output
   - When to approve vs. request changes
   - Team review standards

3. **First Kaizen analysis:**
   - Demonstrate root cause analysis
   - Show different analysis techniques
   - Practice on real bug
   - Document learnings

### Knowledge Sharing

**Weekly team sessions:**

1. **Plugin of the Week:**
   - Deep dive into one plugin
   - Share advanced usage tips
   - Discuss common pitfalls
   - Live demo on real work

2. **Workflow Review:**
   - Review one team workflow
   - Identify optimization opportunities
   - Share success stories
   - Update documentation

3. **Learnings Share:**
   - Everyone shares one insight
   - Review CLAUDE.md recent learnings
   - Discuss application to future work
   - Update team practices

## Collaboration Patterns

### Specification Collaboration

**For features requiring multiple developers:**

```bash
# Lead developer creates spec
/sdd:01-specify [feature]

# Team reviews spec in specs/ directory
# Comments and discussions in PR

# Lead developer updates based on feedback
/sdd:01-specify [updated description]

# Team approves specification

# Lead creates plan and tasks
/sdd:02-plan
/sdd:03-tasks

# Tasks distributed to team members
# Each developer implements assigned tasks

# Lead reviews progress and integrations
```

### Code Review Collaboration

**Two-stage review process:**

```bash
# Stage 1: Self-Review (Developer)
/code-review:review-local-changes
# Fix critical issues before PR

# Stage 2: Team Review (Reviewer)
/code-review:review-pr
# Combines automated + human judgment

# Discussion on GitHub PR
# Approval requires both reviews pass
```

### Incident Response Collaboration

**Team incident workflow:**

```bash
# On-call engineer: Quick analysis
/kaizen:why [incident]

# Implement hotfix
# Deploy immediately

# Team lead: Post-incident analysis
/kaizen:analyse-problem [complete incident description]

# Team retrospective
# Discuss root cause, prevention, improvements

# Create follow-up tasks
# Distribute to team members
```

### Refactoring Collaboration

**For large refactoring efforts:**

```bash
# Lead: Analyze and plan
/kaizen:analyse [target area]
/kaizen:plan-do-check-act [refactoring goal]

# Team discussion: Review plan
# Break into incremental steps

# Developers: Implement in sequence
# Each developer takes one step
# Review before next step

# Lead: Validate improvements
/reflexion:reflect
/reflexion:memorize

# Team: Retrospective on process
```

## Quality Gates for Teams

### Pre-Commit Gates

**Required for all commits to main:**

```bash
# 1. Self-review
/code-review:review-local-changes

# 2. All critical issues fixed
# No compromises on critical issues

# 3. Tests pass
# CI must be green

# 4. Proper commit message
/git:commit
```

**Enforcement:**
- Git hooks (use `/customaize-agent:create-hook`)
- PR templates
- Team code of conduct

### PR Approval Gates

**Required for PR approval:**

```bash
# 1. Automated review passes
/code-review:review-pr

# 2. Team member review
# At least one human approval

# 3. CI/CD passes
# All tests green

# 4. Documentation updated
# If applicable

# 5. Spec updated
# If requirements changed
```

### Release Gates

**Required before release:**

```bash
# 1. All PRs reviewed and approved

# 2. Integration tests pass

# 3. Documentation complete
/docs:update-docs

# 4. Release notes prepared

# 5. Team sign-off
# Lead approves release
```

## Team Metrics and Improvement

### Track Effectiveness

**Metrics to consider:**

1. **Plugin Adoption:**
   - % of team using required plugins
   - % of commits using `/git:commit`
   - % of PRs with automated review

2. **Quality Impact:**
   - Bugs found by `/code-review` before commit
   - Bugs found in PR review vs. production
   - Time to find and fix bugs

3. **Process Efficiency:**
   - Time from idea to specification
   - Time from spec to implementation
   - Time from implementation to review

4. **Team Consistency:**
   - Variation in commit message format
   - Variation in code review thoroughness
   - Variation in workflow adherence

### Continuous Improvement

**Monthly retrospective:**

```markdown
## Team Retrospective Template

### What's Working Well
- Plugin usage: [high/medium/low adoption]
- Workflow consistency: [consistent/variable]
- Quality metrics: [trending up/down/stable]

### What's Not Working
- Pain points: [list specific issues]
- Bottlenecks: [where we get stuck]
- Confusion: [unclear processes]

### Action Items
- [ ] Update workflow documentation for [X]
- [ ] Add plugin for [Y]
- [ ] Training session on [Z]
- [ ] Optimize [W] process

### Next Month's Focus
[One key improvement to focus on]
```

**Use Kaizen for team improvement:**

```bash
# Analyze team process
/kaizen:analyse [team workflow]

# Plan improvement
/kaizen:plan-do-check-act [improvement goal]

# Implement changes
# Measure impact
# Standardize or iterate
```

## Handling Disagreements

### Plugin Disagreements

**Scenario:** Team member wants to use plugin that others find unnecessary.

**Resolution process:**

1. **Understand motivation:**
   - What problem does it solve?
   - Why existing plugins insufficient?
   - What's the benefit?

2. **Trial period:**
   - Use plugin on one project/feature
   - Measure impact
   - Share results with team

3. **Team decision:**
   - Discuss results
   - Vote on adoption
   - Document decision either way

### Workflow Disagreements

**Scenario:** Developer wants to skip workflow steps.

**Resolution process:**

1. **Understand rationale:**
   - Why skip this step?
   - What's the time savings?
   - What's the risk?

2. **Conditional approach:**
   - Define when step can be skipped
   - Define when step is required
   - Document exceptions

3. **Update standards:**
   ```markdown
   ## Feature Development Workflow

   ### Standard Process
   [Full workflow]

   ### Fast Track (For Simple Features)
   You may skip [steps] when:
   - Feature is <2 hours implementation
   - No API changes
   - No database changes
   - No security implications
   ```

### Standard Disagreements

**Scenario:** Disagreement about architectural or coding standard.

**Resolution process:**

1. **Document both approaches:**
   - Write pros/cons for each
   - Include examples

2. **Trial implementation:**
   - Try both on real code
   - Measure results

3. **Team discussion:**
   - Present findings
   - Discuss trade-offs
   - Lead makes final decision

4. **Document decision:**
   ```markdown
   ## Architecture Decision Record (ADR)

   ### Context
   [What we were deciding]

   ### Decision
   [What we chose]

   ### Rationale
   [Why we chose it]

   ### Alternatives Considered
   [What we didn't choose and why]

   ### Consequences
   [Expected impact]
   ```

## Remote Team Considerations

### Asynchronous Communication

**Document everything:**
- All decisions in docs/
- All workflows written down
- All standards explicit
- No tribal knowledge

**Use CLAUDE.md for context:**
- New team member can read CLAUDE.md
- Gets up to speed without live session
- Context preserved for entire team

### Time Zone Challenges

**Workflow considerations:**

```markdown
## Async Code Review Process

1. Developer completes work (any time)
2. Self-review: `/code-review:review-local-changes`
3. Create PR: `/git:create-pr`
4. Automated review: `/code-review:review-pr` (optional)
5. Team members review async (any time)
6. Discussion in PR comments
7. Approval when both reviews pass

No synchronous review meeting required.
```

**Pair programming alternatives:**

- Recorded demo videos
- Detailed PR descriptions
- Step-by-step guides
- Scheduled overlap hours for critical pairing

### Shared Documentation

**Make everything discoverable:**

```
docs/
├── README.md           # Start here
├── ONBOARDING.md       # New developer guide
├── PLUGINS.md          # Plugin standards
├── WORKFLOWS.md        # Standard workflows
├── ARCHITECTURE.md     # Architecture decisions
└── TROUBLESHOOTING.md  # Common issues

CLAUDE.md               # Project context
```

**Update documentation immediately:**
- Don't wait for team meeting
- Create PR for changes
- Async review and approval
- Keep docs always current

## Team Anti-Patterns

### Anti-Pattern 1: No Standards

**Problem:**
- Everyone uses different plugins
- Inconsistent workflow
- Hard to collaborate
- Onboarding difficult

**Solution:**
- Document required plugins
- Define standard workflows
- Regular team sync
- Enforce in PR reviews

### Anti-Pattern 2: Over-Standardization

**Problem:**
- Rigid workflows slow team down
- No room for experimentation
- One-size-fits-all doesn't work
- Team feels constrained

**Solution:**
- Define core standards, optional extras
- Allow personal customization
- Document exceptions
- Regular review of standards

### Anti-Pattern 3: Documentation Rot

**Problem:**
- WORKFLOWS.md outdated
- PLUGINS.md doesn't match reality
- Team ignores docs
- New members confused

**Solution:**
- Regular doc review (monthly)
- Update docs as part of workflow changes
- Make doc updates easy (PR process)
- Reward doc contributions

### Anti-Pattern 4: Plugin Sprawl

**Problem:**
- Team installs everything
- Context always full
- Slow responses
- Confusion about what to use

**Solution:**
- Minimize required plugins
- Clear guidelines on optional plugins
- Regular audit of installed plugins
- Token budget awareness

### Anti-Pattern 5: Lack of Training

**Problem:**
- Team installs plugins but doesn't use them
- Poor understanding of capabilities
- Miss opportunities for improvement
- Inconsistent usage

**Solution:**
- Regular training sessions
- Plugin of the week
- Share success stories
- Pair programming for new workflows

## Example Team Scenarios

**Note:** The following scenarios are illustrative examples based on common team patterns. They demonstrate how different team sizes and structures might adopt CEK plugins, not specific real-world case studies.

### Scenario 1: Small Startup (5 developers)

**Setup:**
```bash
# Required plugins
- code-review
- git
- reflexion

# Optional plugins
- sdd (for feature leads)
- kaizen (for everyone)
```

**Workflow:**
- Lightweight process
- Fast iteration
- Quality gates via code review
- Continuous improvement via reflexion

**Expected Benefits:**
- Consistent code quality
- Fast onboarding
- Minimal process overhead
- Strong improvement culture

### Scenario 2: Enterprise Team (20 developers)

**Setup:**
```bash
# Required plugins
- sdd
- ddd
- code-review
- git
- docs

# Recommended plugins
- kaizen
- reflexion
- tdd (backend only)
```

**Workflow:**
- Formal specifications for all features
- Architecture review required
- Documentation mandatory
- Multiple quality gates

**Expected Benefits:**
- Consistent architecture
- Well-documented codebase
- Smooth team coordination
- Predictable delivery

### Scenario 3: Open Source Project (50+ contributors)

**Setup:**
```bash
# Required for maintainers
- code-review
- git

# Recommended for contributors
- reflexion
- docs
```

**Workflow:**
- Contributors self-review before PR
- Maintainers use automated review
- Documentation required for features
- Flexible process for contributors

**Expected Benefits:**
- Consistent PR quality
- Easier maintainer reviews
- Better documentation
- Lower maintenance burden

## Summary

**Key Takeaways:**

1. **Standardize gradually** - Start minimal, evolve based on needs
2. **Document everything** - Written standards enable consistency
3. **Share CLAUDE.md** - Common context for entire team
4. **Quality gates** - Self-review before team review
5. **Continuous improvement** - Regular retrospectives and updates
6. **Flexible standards** - Allow customization within bounds
7. **Onboarding focus** - Invest in new developer experience
8. **Metric-driven** - Measure adoption and effectiveness

**Minimum team standards:**

```bash
# Required plugins
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit

# Required documents
docs/PLUGINS.md      # Plugin standards
docs/WORKFLOWS.md    # Standard workflows
docs/ONBOARDING.md   # New developer guide
CLAUDE.md            # Shared project context
```

**Team workflow template:**

```markdown
# WORKFLOWS.md

## Feature Development
1. Specification (if needed)
2. Implementation
3. Self-review: `/code-review:review-local-changes`
4. Commit: `/git:commit`
5. PR: `/git:create-pr`
6. Team review

## Bug Fixes
1. Analysis: `/kaizen:why`
2. Fix implementation
3. Self-review
4. Commit with fix details
```

## See Also

**Guides:**
- [Choosing Plugins](./choosing-plugins.md) - Team plugin selection framework
- [Combining Plugins](./combining-plugins.md) - Team plugin combinations and starter packs
- [Custom Workflows](./custom-workflows.md) - Building and documenting team workflows
- [Optimization](./optimization.md) - Team token management strategies

**Concepts:**
- [Quality Gates](../concepts/quality-gates.md) - Team quality assurance patterns
- [Token Efficiency](../concepts/token-efficiency.md) - Balancing team needs and token costs

**Reference:**
- [Marketplace API](../reference/marketplace-api.md) - Installing and managing team plugins
