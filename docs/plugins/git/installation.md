# Git Plugin - Installation Guide

## Prerequisites

- Claude Code installed
- Git installed and configured
- GitHub CLI (gh) recommended for PR and issue commands
- GitHub account with repository access

## Installation

### Step 1: Install Git Plugin

```bash
/plugin install git@NeoLabHQ/context-engineering-kit
```

### Step 2: Install GitHub CLI (Recommended)

Required for `/git:create-pr`, `/git:analyze-issue`, and `/git:load-issues` commands.

#### macOS
```bash
brew install gh
```

#### Linux
```bash
# Debian/Ubuntu
sudo apt install gh

# Fedora/RHEL
sudo dnf install gh

# Arch
sudo pacman -S github-cli
```

#### Windows
```bash
winget install GitHub.cli
# or
choco install gh
```

### Step 3: Authenticate GitHub CLI

```bash
gh auth login
```

Follow the prompts to authenticate with your GitHub account.

## Verification

### Verify Plugin Installation

```bash
/plugin
# Should list 'git' as installed
```

### Verify Git Configuration

```bash
git config --global user.name
git config --global user.email
```

If not configured:
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Verify GitHub CLI

```bash
gh --version
gh auth status
```

### Test Commands

```bash
# Test commit command (requires staged changes)
> /git:commit --help

# Test PR command (requires gh)
> /git:create-pr --help

# Test issue commands (requires gh)
> /git:analyze-issue --help
> /git:load-issues --help
```

## What Gets Loaded

### Commands
- `/git:commit` - Create conventional commits
- `/git:create-pr` - Create pull requests
- `/git:analyze-issue` - Analyze GitHub issues
- `/git:load-issues` - Load all open issues

### No Skills
Git plugin uses commands only for explicit control.

## Configuration

### Git Configuration

Ensure proper Git configuration:

```bash
# User information
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Default branch name
git config --global init.defaultBranch main

# Editor for commit messages
git config --global core.editor "code --wait"

# Pull strategy
git config --global pull.rebase false
```

### Conventional Commit Configuration

Customize commit types in CLAUDE.md:

```markdown
## Git Configuration

### Commit Types
- feat: New features
- fix: Bug fixes
- docs: Documentation only
- style: Formatting, missing semi colons
- refactor: Code changes without changing behavior
- perf: Performance improvements
- test: Adding tests
- chore: Updating grunt tasks etc

### Commit Rules
- Use present tense ("Add" not "Added")
- Keep subject line under 72 characters
- Reference issues when applicable
- Add emoji for visual clarity
- Detailed body for complex changes
```

## Troubleshooting

### Plugin not found

```bash
/plugin marketplace add NeoLabHQ/context-engineering-kit
/plugin marketplace update NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
```

### GitHub CLI not working

```bash
# Check installation
gh --version

# Re-authenticate
gh auth logout
gh auth login

# Check auth status
gh auth status
```

### Git not configured

```bash
# Set username
git config --global user.name "Your Name"

# Set email
git config --global user.email "your.email@example.com"

# Verify
git config --list
```

### Commit command fails

**Issue**: No changes to commit

**Solution:**
```bash
# Stage changes first
git add .

# Or stage specific files
git add file1.js file2.js

# Then commit
> /git:commit
```

### PR creation fails

**Issue**: Can't create PR

**Solution:**
```bash
# Ensure branch is pushed
git push origin <branch-name>

# Verify remote
git remote -v

# Check gh auth
gh auth status

# Try manual PR
gh pr create
```

## Uninstalling

```bash
/plugin uninstall git@NeoLabHQ/context-engineering-kit
```

This removes commands but doesn't affect Git or GitHub CLI.

## Optional: Git Aliases

Add helpful Git aliases:

```bash
# Status shortcut
git config --global alias.st status

# Short log
git config --global alias.lg "log --oneline --graph --decorate"

# Undo last commit (keep changes)
git config --global alias.undo "reset HEAD~1 --soft"

# Show last commit
git config --global alias.last "log -1 HEAD"
```

## Next Steps

- Read [Commands Reference](./commands.md) for detailed usage
- Explore [Usage Examples](./usage-examples.md) for workflows
- Check [Main Documentation](./README.md) for overview
- Review [Conventional Commits Spec](https://www.conventionalcommits.org/)
