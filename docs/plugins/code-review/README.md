# Code Review Plugin

Comprehensive code review using multiple specialized agents for thorough code quality evaluation.

## Overview

The Code Review plugin implements a multi-agent code review system where specialized AI agents examine code from different perspectives including bug detection, security, test coverage, code quality, contracts, and historical context. This provides comprehensive, professional-grade code review before commits or pull requests.

## Quick Start

```bash
# Install the plugin
/plugin install code-review@NeoLabHQ/context-engineering-kit

# Review uncommitted local changes
> /code-review:review-local-changes

# Review a pull request
> /code-review:review-pr #123
```

## Key Features

### Multi-Agent Review System

Six specialized agents examine your code:

1. **Bug Hunter** - Identifies potential bugs, edge cases, error-prone patterns
2. **Security Auditor** - Finds security vulnerabilities and attack vectors
3. **Test Coverage Reviewer** - Evaluates test coverage and suggests missing tests
4. **Code Quality Reviewer** - Assesses structure, readability, maintainability
5. **Contracts Reviewer** - Reviews interfaces, API contracts, data models
6. **Historical Context Reviewer** - Analyzes changes relative to codebase history

### Comprehensive Analysis

- Catches bugs before they reach production
- Identifies security vulnerabilities early
- Ensures adequate test coverage
- Maintains code quality standards
- Validates API contracts and interfaces
- Considers historical context and patterns

### Actionable Reports

- Structured findings by severity
- Specific file and line references
- Code examples and suggestions
- Prioritized action items

## When to Use

**Use Code Review when:**
- Before committing local changes
- Before creating pull requests
- After implementing features
- When refactoring existing code
- Before deploying to production

**Typical workflow:**
1. Implement feature or changes
2. Run `/code-review:review-local-changes`
3. Address findings
4. Commit changes
5. Create PR with `/code-review:review-pr`

## Review Agents

### Bug Hunter

**Focus**: Identifies potential bugs and edge cases

**What it catches:**
- Null pointer exceptions
- Off-by-one errors
- Race conditions
- Memory leaks
- Resource leaks (file handles, connections)
- Unhandled error cases
- Invalid assumptions
- Logic errors

### Security Auditor

**Focus**: Security vulnerabilities and attack vectors

**What it catches:**
- SQL injection risks
- XSS vulnerabilities
- CSRF missing protection
- Authentication/authorization bypasses
- Insecure data storage
- Exposed secrets or credentials
- Insufficient input validation
- Insecure cryptography usage

### Test Coverage Reviewer

**Focus**: Test quality and coverage

**What it evaluates:**
- Test coverage percentage
- Missing test cases
- Edge case testing
- Integration test needs
- Test quality and meaningfulness
- Test maintainability
- Mock/stub usage

### Code Quality Reviewer

**Focus**: Code structure and maintainability

**What it evaluates:**
- Code complexity (cyclomatic complexity)
- Naming conventions
- Code duplication
- Function/class size
- Separation of concerns
- Design patterns usage
- Code smells
- Documentation quality

### Contracts Reviewer

**Focus**: API contracts and interfaces

**What it reviews:**
- API endpoint definitions
- Request/response schemas
- Interface consistency
- Breaking changes
- Backward compatibility
- Type safety
- Contract documentation

### Historical Context Reviewer

**Focus**: Changes relative to codebase history

**What it analyzes:**
- Consistency with existing patterns
- Alignment with project conventions
- Similar past changes
- Previous bug patterns
- Architectural drift
- Technical debt indicators

## Commands Overview

| Command | Purpose | Scope |
|---------|---------|-------|
| `/code-review:review-local-changes` | Review uncommitted changes | Working directory |
| `/code-review:review-pr` | Review pull request | Specific PR |

## Best Practices

### Effective Code Review

1. **Review Early**: Don't wait until PR creation
2. **Address All Findings**: Or document why you disagree
3. **Prioritize by Severity**: Critical and High first
4. **Run Multiple Times**: After fixes to verify
5. **Combine with Reflexion**: For deeper analysis

### Using Review Results

1. **Critical Issues**: Must fix before committing
2. **High Priority**: Should fix before PR
3. **Medium Priority**: Fix if time permits, or create issues
4. **Low Priority**: Nice to have, consider for refactoring

### Integration Patterns

**Pre-Commit Workflow**:
```bash
# Make changes
> claude "implement feature"

# Review
> /code-review:review-local-changes

# Fix issues
> claude "address critical and high priority findings"

# Verify
> /code-review:review-local-changes

# Commit
> /git:commit
```

**PR Workflow**:
```bash
# Create PR
> /git:create-pr

# Review PR
> /code-review:review-pr #123

# Address findings if needed
> claude "fix issues from PR review"

# Push updates
> git push
```

## Review Report Structure

Reviews provide structured output:

```markdown
# Code Review Report

## Executive Summary
[Overview of changes and quality assessment]

## Critical Issues (Must Fix)
- [Issue 1 with location and severity]
- [Issue 2 with location and severity]

## High Priority (Should Fix)
- [Issue 3]
- [Issue 4]

## Medium Priority (Consider Fixing)
- [Issue 5]
- [Issue 6]

## Low Priority (Nice to Have)
- [Issue 7]

## Detailed Agent Reports

### Bug Hunter Findings
[Detailed findings]

### Security Audit
[Security findings]

### Test Coverage Analysis
[Coverage findings]

### Code Quality Assessment
[Quality findings]

### Contract Review
[Contract findings]

### Historical Context
[Context findings]

## Action Items
- [ ] Critical action 1
- [ ] Critical action 2
- [ ] High priority action 1
```

## Performance Considerations

- **Review Time**: 1-3 minutes depending on change size
- **Parallel Processing**: Agents run in parallel for efficiency
- **Context Size**: Large diffs may take longer
- **Network**: Requires connection for agent spawning

## Integration with Other Plugins

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

### With Git
```bash
> /code-review:review-local-changes
> /git:commit  # After addressing findings
> /git:create-pr
> /code-review:review-pr
```

## Troubleshooting

### Review finds too many issues

**Issue**: Overwhelming number of findings

**Solutions:**
- Fix Critical and High priority first
- Create issues for Medium/Low priority
- Consider refactoring sessions for code quality
- Update code standards in CLAUDE.md

### Review misses obvious issues

**Issue**: Known bugs not caught

**Solutions:**
- Run Reflexion critique for additional perspective
- Check if issue is in scope of review
- Provide more context about the change
- Report to improve agent prompts

### Review takes too long

**Issue**: Review running for extended time

**Solutions:**
- Reduce change size (review incrementally)
- Check network connection
- Consider reviewing specific files only
- Normal for very large changesets (>1000 lines)

## Limitations

### What Code Review Covers
- Static code analysis
- Pattern recognition
- Best practices validation
- Security vulnerability detection
- Test coverage assessment

### What Code Review Doesn't Cover
- Runtime behavior (use testing)
- Performance profiling (use benchmarks)
- Load testing (use performance tools)
- Integration issues (use integration tests)
- Business logic validation (use domain experts)

## Scientific Foundation

The Code Review plugin implements proven patterns:

- **Multi-Agent Systems**: Specialized agents for thorough analysis
- **Ensemble Methods**: Multiple perspectives improve accuracy
- **Static Analysis**: Code pattern recognition
- **Security Auditing**: OWASP and security best practices
- **Test Coverage Analysis**: Coverage metrics and gap identification

## Further Reading

- [Commands Reference](./commands.md) - Detailed command documentation
- [Agents Reference](./agents.md) - Specialized agent descriptions
- [Installation Guide](./installation.md) - Setup and verification
- [Usage Examples](./usage-examples.md) - Real-world scenarios
