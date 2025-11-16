# Code Review Plugin - Installation Guide

## Prerequisites

- Claude Code installed and configured
- Context Engineering Kit marketplace added
- Git installed (for PR reviews)
- GitHub CLI (optional, for `/code-review:review-pr`)

## Installation

### Step 1: Add Marketplace (if not already added)

```bash
/plugin marketplace add NeoLabHQ/context-engineering-kit
```

### Step 2: Install Code Review Plugin

```bash
/plugin install code-review@NeoLabHQ/context-engineering-kit
```

## Verification

### Verify Installation

```bash
/plugin
```

You should see `code-review` in the list of installed plugins.

### Verify Commands

```bash
# Check available commands
/code-review:review-local-changes --help
/code-review:review-pr --help
```

### Test Basic Usage

```bash
# Make a small change
echo "// test comment" >> test.js

# Review the change
> /code-review:review-local-changes
```

If the review runs and provides a report, the plugin is working correctly.

## What Gets Loaded

### Commands
- `/code-review:review-local-changes` - Review uncommitted changes
- `/code-review:review-pr` - Review pull request

### Agents
- `bug-hunter` - Bug detection specialist
- `security-auditor` - Security analysis specialist
- `test-coverage-reviewer` - Test coverage specialist
- `code-quality-reviewer` - Code quality specialist
- `contracts-reviewer` - API contracts specialist
- `historical-context-reviewer` - Historical analysis specialist

## Optional: GitHub CLI Setup

For PR reviews, install GitHub CLI:

### macOS
```bash
brew install gh
```

### Linux
```bash
# Debian/Ubuntu
sudo apt install gh

# Fedora/RHEL
sudo dnf install gh
```

### Windows
```bash
winget install GitHub.cli
```

### Authenticate
```bash
gh auth login
```

## Configuration

### Git Configuration

Ensure git is configured:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Review Sensitivity

Adjust agent sensitivity (optional) by updating CLAUDE.md:

```markdown
## Code Review Configuration

### Review Sensitivity
- Bug Hunter: Strict (catch all potential issues)
- Security Auditor: Paranoid (zero tolerance)
- Test Coverage: 80% minimum expected
- Code Quality: Follow project standards in .eslintrc

### Review Focus
- Performance: Critical for API endpoints
- Security: Always maximum priority
- Testing: Unit tests required for business logic
```

## Uninstalling

```bash
/plugin uninstall code-review@NeoLabHQ/context-engineering-kit
```

## Troubleshooting

### Plugin not found

```bash
# Update marketplace
/plugin marketplace update NeoLabHQ/context-engineering-kit

# Reinstall
/plugin install code-review@NeoLabHQ/context-engineering-kit
```

### Commands not working

```bash
# Reload Claude Code
# Exit and restart

# Reinstall
/plugin uninstall code-review@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
```

### No changes detected

**Issue**: `/code-review:review-local-changes` reports no changes

**Solution:**
- Ensure you have uncommitted changes: `git status`
- Check you're in a git repository
- Verify files are modified, not just staged

### PR review fails

**Issue**: `/code-review:review-pr` doesn't work

**Solution:**
- Install GitHub CLI: `gh --version`
- Authenticate: `gh auth login`
- Ensure PR number is correct
- Check you have permissions to access the PR

## Next Steps

- Read the [Commands Reference](./commands.md) for detailed usage
- Explore [Agents Reference](./agents.md) to understand each specialist
- Review [Usage Examples](./usage-examples.md) for practical scenarios
- Check [Main Documentation](./README.md) for overview and best practices
