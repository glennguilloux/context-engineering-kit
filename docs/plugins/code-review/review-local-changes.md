# /code-review:review-local-changes - Local Changes Review

Review uncommitted local changes using all specialized agents with code improvement suggestions.

- Purpose - Comprehensive review before committing
- Output - Structured report with findings by severity

```bash
/code-review:review-local-changes ["review-aspects"]
```

## Arguments

Optional review aspects to focus on (e.g., "security", "bugs", "tests")

## How It Works

1. **Change Detection**: Identifies all uncommitted changes in the working directory
   - Staged changes
   - Unstaged modifications
   - New files

2. **Parallel Agent Analysis**: Spawns six specialized agents simultaneously
   - Bug Hunter - Identifies potential bugs and edge cases
   - Security Auditor - Finds security vulnerabilities
   - Test Coverage Reviewer - Evaluates test coverage
   - Code Quality Reviewer - Assesses code structure
   - Contracts Reviewer - Reviews API contracts
   - Historical Context Reviewer - Analyzes codebase patterns

3. **Finding Aggregation**: Combines all agent reports
   - Categorizes by severity (Critical, High, Medium, Low)
   - Removes duplicates
   - Adds file and line references

4. **Report Generation**: Produces actionable report with prioritized findings

## Usage Examples

```bash
# Review all local changes
> /code-review:review-local-changes

# Focus on security aspects
> /code-review:review-local-changes security

# After implementing a feature
> claude "implement user authentication"
> /code-review:review-local-changes
```

## Best Practices

- Review before committing - Run review on local changes before `git commit`
- Address critical issues first - Fix Critical and High priority findings immediately
- Iterate after fixes - Run again to verify issues are resolved
- Combine with reflexion - Use `/reflexion:memorize` to save patterns for future reference
