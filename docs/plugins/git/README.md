# Git Plugin

Commands for streamlined Git operations including commits and pull request creation with conventional commit messages.

## Overview

The Git plugin provides commands that automate and standardize Git workflows, ensuring consistent commit messages, proper PR formatting, and efficient issue management. It integrates GitHub best practices and conventional commits with emoji.

## Quick Start

```bash
# Install the plugin
/plugin install git@NeoLabHQ/context-engineering-kit

# Create a well-formatted commit
> /git:commit "Add user authentication"

# Create a pull request
> /git:create-pr "Add authentication system"

# Analyze a GitHub issue
> /git:analyze-issue 123

# Load all open issues
> /git:load-issues
```

## Key Features

### Conventional Commits
- Automatically formats commits with conventional commit standard
- Adds appropriate emoji for commit types
- Generates detailed commit messages
- Validates commit message format

### Pull Request Management
- Creates PRs using GitHub CLI
- Applies PR templates automatically
- Suggests appropriate labels and reviewers
- Links related issues

### Issue Management
- Analyzes GitHub issues for technical specifications
- Loads all open issues for planning
- Extracts requirements from issue descriptions
- Creates actionable development tasks

## Commands

| Command | Purpose |
|---------|---------|
| `/git:commit` | Create conventional commit with emoji |
| `/git:create-pr` | Create pull request with proper formatting |
| `/git:analyze-issue` | Analyze issue and create technical spec |
| `/git:load-issues` | Load all open issues as markdown files |

## When to Use

**Use Git commands when:**
- Committing code changes
- Creating pull requests
- Starting work on GitHub issues
- Planning sprint work from issues
- Maintaining commit history quality

**Integration workflow:**
```bash
# Complete feature workflow
> /git:analyze-issue 123        # Understand requirements
> claude "implement feature"     # Develop
> /code-review:review-local-changes  # Review
> /git:commit                    # Commit
> /git:create-pr                 # Create PR
```

## Conventional Commit Format

The plugin follows conventional commits specification:

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Commit Types with Emoji

- ✨ `feat`: New feature
- 🐛 `fix`: Bug fix
- 📝 `docs`: Documentation changes
- 💄 `style`: Code style changes (formatting)
- ♻️ `refactor`: Code refactoring
- ⚡ `perf`: Performance improvements
- ✅ `test`: Adding or updating tests
- 🔧 `chore`: Maintenance tasks
- 🔨 `build`: Build system changes
- 👷 `ci`: CI/CD changes

## Best Practices

### Commit Messages

1. **Be Specific**: Describe what changed and why
2. **Use Present Tense**: "Add feature" not "Added feature"
3. **Reference Issues**: Include issue numbers when applicable
4. **Keep Under 72 Characters**: For the subject line
5. **Explain Why**: In the commit body if needed

### Pull Requests

1. **Descriptive Title**: Clear summary of changes
2. **Detailed Description**: What, why, and how
3. **Link Issues**: Reference related issues
4. **Add Screenshots**: For UI changes
5. **Request Appropriate Reviewers**: Based on code areas

### Issue Analysis

1. **Extract Requirements**: Clear user stories
2. **Identify Technical Details**: APIs, data models, etc.
3. **Create Subtasks**: Break into manageable pieces
4. **Note Dependencies**: Other issues or PRs
5. **Estimate Complexity**: Help with planning

## Integration with Other Plugins

### With Code Review
```bash
> /code-review:review-local-changes
> /git:commit  # After addressing findings
```

### With SDD
```bash
> /git:analyze-issue 123
> /sdd:01-specify  # Use issue analysis
> /sdd:04-implement
> /git:commit
> /git:create-pr
```

### With Reflexion
```bash
> /git:commit
> /reflexion:memorize "Git commit patterns"
```

## GitHub CLI Integration

Most commands require GitHub CLI (`gh`) for full functionality:

- Creating PRs
- Loading issues
- Analyzing issues
- Setting labels and reviewers

See [Installation Guide](./installation.md) for GitHub CLI setup.

## Example Commit Messages

### Feature Commit
```
✨ feat(auth): add OAuth2 authentication

Implement OAuth2 with Google and GitHub providers
- Add OAuthController for callback handling
- Implement token exchange and validation
- Add user profile synchronization
- Include security measures (state validation, PKCE)

Closes #123
```

### Bug Fix Commit
```
🐛 fix(cart): prevent duplicate items in shopping cart

Fix race condition when adding items concurrently
- Add distributed lock for cart operations
- Implement idempotency key validation
- Add retry logic with exponential backoff

Fixes #456
```

### Refactoring Commit
```
♻️ refactor(order): extract order processing logic

Improve code organization and testability
- Extract OrderProcessor from OrderController
- Implement strategy pattern for order types
- Add dependency injection for better testing
- Reduce cyclomatic complexity from 18 to 6

Related to #789
```

## Troubleshooting

### Commit fails

**Issue**: `/git:commit` doesn't create commit

**Solution:**
- Ensure changes are staged: `git add .`
- Check git is initialized: `git status`
- Verify git configuration is complete

### PR creation fails

**Issue**: `/git:create-pr` doesn't work

**Solution:**
- Install GitHub CLI: `gh --version`
- Authenticate: `gh auth login`
- Push branch first: `git push origin <branch>`
- Ensure remote is set: `git remote -v`

### Issue analysis incomplete

**Issue**: `/git:analyze-issue` missing details

**Solution:**
- Check issue has detailed description
- Ensure issue is accessible (permissions)
- Provide more context manually if needed
- Use issue comments for additional details

## Further Reading

- [Commands Reference](./commands.md) - Detailed command documentation
- [Installation Guide](./installation.md) - Setup with GitHub CLI
- [Usage Examples](./usage-examples.md) - Real-world scenarios
- [Conventional Commits Spec](https://www.conventionalcommits.org/) - Standard reference
