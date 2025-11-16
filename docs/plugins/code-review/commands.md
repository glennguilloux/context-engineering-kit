# Code Review Commands Reference

Complete reference for Code Review plugin commands.

## Command Overview

| Command | Purpose | Time | Agents Used |
|---------|---------|------|-------------|
| `/code-review:review-local-changes` | Review uncommitted changes | 1-3min | All 6 agents |
| `/code-review:review-pr` | Review pull request | 2-5min | All 6 agents |

## /code-review:review-local-changes

Comprehensive review of local uncommitted changes using specialized agents with code improvement suggestions.

### Syntax

```bash
/code-review:review-local-changes [file-pattern] [--focus=aspect]
```

### Parameters

- `file-pattern` (optional): Specific files or glob patterns (e.g., `src/**/*.ts`)
- `--focus` (optional): Specific aspect (security, performance, testing, quality)

### How It Works

1. **Detect Changes**: Identifies all uncommitted changes via `git diff`
2. **Parallel Review**: Spawns six specialized agent reviewers
3. **Analysis**: Each agent analyzes from their perspective
4. **Report Generation**: Compiles findings into structured report
5. **Action Items**: Provides prioritized list of fixes

### Agents Involved

All six specialized agents review in parallel:
- Bug Hunter
- Security Auditor
- Test Coverage Reviewer
- Code Quality Reviewer
- Contracts Reviewer
- Historical Context Reviewer

### Usage Examples

```bash
# Review all changes
> /code-review:review-local-changes

# Review specific directory
> /code-review:review-local-changes src/auth/

# Focus on security
> /code-review:review-local-changes --focus=security

# Review TypeScript files only
> /code-review:review-local-changes "**/*.ts"
```

### Output Structure

```markdown
# Local Changes Review

## Summary
- Files changed: 5
- Lines added: 150
- Lines removed: 30
- Overall risk: Medium

## Critical Issues (Must Fix Before Commit)
- [Bug Hunter] Potential null pointer in UserService.ts:45
- [Security] SQL injection risk in query builder

## High Priority (Should Fix)
- [Test Coverage] Missing tests for new authentication flow
- [Code Quality] Function complexity >15 in processOrder()

## Medium Priority (Consider)
- [Contracts] API response format inconsistent with standard
- [Historical] Different pattern than existing services

## Low Priority (Nice to Have)
- [Code Quality] Consider extracting helper functions

## Detailed Agent Reports
[Full reports from each agent]

## Action Items
- [ ] Fix null pointer in UserService.ts:45
- [ ] Add parameterized query or ORM usage
- [ ] Write tests for authentication flow
- [ ] Refactor processOrder() function
```

### Best Practices

1. **Review Before Commit**: Always run before committing
2. **Address Critical First**: Fix blocking issues immediately
3. **Create Issues**: For Medium/Low priority items
4. **Re-review After Fixes**: Verify fixes with another review
5. **Incremental Reviews**: Review smaller changes frequently

## /code-review:review-pr

Comprehensive pull request review using specialized agents.

### Syntax

```bash
/code-review:review-pr <pr-number> [--focus=aspect]
```

### Parameters

- `pr-number` (required): Pull request number (e.g., `#123` or `123`)
- `--focus` (optional): Specific aspect to emphasize

### Prerequisites

- GitHub CLI installed (`gh` command)
- Authenticated with GitHub (`gh auth login`)
- Permission to access the repository and PR

### How It Works

1. **Fetch PR**: Retrieves PR details via GitHub API
2. **Load Changes**: Gets diff of all files in PR
3. **Parallel Review**: Spawns six specialized agents
4. **Context Analysis**: Considers PR description and goals
5. **Report Generation**: Creates comprehensive review report

### Usage Examples

```bash
# Review PR by number
> /code-review:review-pr 123

# Review with security focus
> /code-review:review-pr #456 --focus=security

# Review after addressing comments
> /code-review:review-pr 123  # Re-review
```

### Output Structure

```markdown
# Pull Request Review: #123

## PR Information
- Title: Add OAuth authentication
- Author: @username
- Files changed: 12
- Lines added: 450
- Lines removed: 80

## Overall Assessment
**Verdict**: ⚠️ Needs improvements before merging

**Summary**: Good implementation with security concerns that must be addressed.

## Blocking Issues (Must Fix Before Merge)
- [Security] Tokens stored in localStorage - use httpOnly cookies
- [Bug Hunter] Race condition in token refresh logic

## Recommended Improvements
- [Test Coverage] 45% coverage - add tests for error cases
- [Code Quality] Large PR - consider splitting into smaller PRs
- [Contracts] Breaking change - needs version bump

## Optional Improvements
- [Historical] Consider using existing AuthService pattern
- [Code Quality] Extract configuration to constants

## Detailed Reviews
[Agent-specific findings]

## Recommendation
Request changes for blocking issues. Security and race condition must be fixed.
```

### GitHub Integration

The command:
- Fetches PR metadata
- Retrieves all changed files
- Accesses PR description and comments
- Can post review comments (future feature)

### Best Practices

1. **Review Draft PRs**: Catch issues early
2. **Focus Areas**: Use `--focus` for specialized reviews
3. **Review Updates**: Re-review after pushes
4. **Combine with Manual**: Automated + human review is best
5. **Document Decisions**: If disagreeing with findings

## Agent Specializations

### Focus Areas by Agent

**Bug Hunter** (`--focus=bugs`):
- Logic errors
- Edge cases
- Error handling
- Resource management

**Security Auditor** (`--focus=security`):
- Injection risks
- Authentication issues
- Authorization bypasses
- Data exposure

**Test Coverage** (`--focus=testing`):
- Test presence
- Coverage gaps
- Test quality
- Edge case testing

**Code Quality** (`--focus=quality`):
- Complexity
- Maintainability
- Design patterns
- Code smells

**Contracts** (`--focus=contracts`):
- API consistency
- Breaking changes
- Type safety
- Documentation

**Historical** (`--focus=patterns`):
- Pattern consistency
- Architectural alignment
- Convention adherence
- Technical debt

## Severity Levels

### Critical
- Must fix immediately
- Blocks commit/merge
- Security vulnerabilities
- Data corruption risks

### High
- Should fix before merge
- Significant bugs
- Test coverage gaps
- Important code quality issues

### Medium
- Consider fixing
- Minor bugs
- Code improvements
- Documentation needs

### Low
- Nice to have
- Style improvements
- Micro-optimizations
- Minor suggestions

## Integration Patterns

### Pre-Commit
```bash
> /code-review:review-local-changes
> claude "fix critical and high priority issues"
> /code-review:review-local-changes  # Verify
> /git:commit
```

### Pre-PR
```bash
> /code-review:review-local-changes
> /git:create-pr
> /code-review:review-pr <number>
```

### With Reflexion
```bash
> /code-review:review-local-changes
> /reflexion:critique  # Additional perspective
> /reflexion:memorize  # Save patterns
```

### With SDD
```bash
> /sdd:04-implement
> /code-review:review-local-changes
> /sdd:05-document
```

## Troubleshooting

### No issues found (but you know there are issues)

**Solutions:**
- Use `/reflexion:critique` for deeper analysis
- Manually specify focus area
- Check if changes are actually in git diff
- Provide more context about concerns

### Too many false positives

**Solutions:**
- Update CLAUDE.md with project standards
- Document architectural decisions
- Add comments explaining unusual patterns
- Configure review sensitivity

### Review skips important files

**Solutions:**
- Explicitly specify file patterns
- Check gitignore isn't excluding files
- Verify files have actual changes
- Review generated files separately

### PR review fails to fetch

**Solutions:**
- Verify GitHub CLI: `gh pr view <number>`
- Check authentication: `gh auth status`
- Confirm PR exists and is accessible
- Check network connection

## Performance Tips

1. **Smaller Changes**: Review <500 lines for faster results
2. **Incremental**: Review frequently vs. one large review
3. **Focused**: Use `--focus` for targeted analysis
4. **Parallel**: Changes are already reviewed in parallel
5. **Cache**: Agents may reuse context for similar reviews

## Output Customization

### Report Format

Default format is Markdown. To customize:

1. Update CLAUDE.md with preferred format
2. Specify output needs in context
3. Use findings to generate custom reports

### Integration with Tools

Export findings to:
- GitHub comments (manual or automated)
- Issue tracking systems
- Code quality dashboards
- CI/CD pipelines

## Further Reading

- [Agents Reference](./agents.md) - Detailed agent descriptions
- [Usage Examples](./usage-examples.md) - Real-world scenarios
- [Installation Guide](./installation.md) - Setup instructions
- [Main Documentation](./README.md) - Overview and best practices
