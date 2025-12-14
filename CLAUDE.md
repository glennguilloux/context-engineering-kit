# Context Engineering Kit

Claude Code plugin marketplace with advanced context engineering techniques focused on improving agent result quality.

## Project Structure

```
context-engineering-kit/
├── .claude-plugin/
│   └── marketplace.json    # Main marketplace manifest with all plugins
├── plugins/                 # Plugin source code
│   └── <plugin-name>/
│       ├── .claude-plugin/
│       │   └── plugin.json  # Plugin manifest
│       ├── README.md
│       ├── commands/        # Slash commands (*.md)
│       └── skills/          # Skills (*.md)
├── docs/                    # Documentation (GitBook)
│   └── plugins/
│       └── <plugin-name>/   # Plugin documentation
│           └── README.md
├── specs/                   # Feature specifications
├── Makefile                 # Development commands
└── CONTRIBUTING.md          # Contribution guidelines
```

## Available Plugins

code-review, customaize-agent, ddd, docs, git, kaizen, mcp, reflexion, sadd, sdd, tdd, tech-stack

## Development Commands

```bash
make help                    # Show all commands
make list-plugins            # List plugins with versions
make sync-docs-to-plugins    # Copy docs/plugins/*/README.md → plugins/*/README.md
make sync-plugins-to-docs    # Copy plugins/*/README.md → docs/plugins/*/README.md
make set-version PLUGIN=name VERSION=x.y.z  # Update plugin version
```

## Key Development Rules

### Plugin Design Philosophy

1. **Commands over skills** - Commands load on-demand; skill descriptions load into context by default
2. **Specialized agents** - Use agents with focused context to reduce hallucinations
3. **Setup-commands** - Use setup commands to update CLAUDE.md for persistent project context
4. **Minimal tokens** - Every token counts; keep prompts concise

### When Creating/Modifying Plugins

- Use `make set-version PLUGIN=<name> VERSION=<x.y.z>` to update versions consistently, do not modify manually.
- Keep README.md in sync between `plugins/<name>/` and `docs/plugins/<name>/` using `make sync-docs-to-plugins` and `make sync-plugins-to-docs` commands. Do not update both manually.
- Test plugins with Claude Code before committing using `plugins/customaize-agent:test-prompt` and `plugins/customaize-agent:test-skill` commands.

## Use Codemap CLI for Codebase Navigation

Codemap CLI is available for intelligent codebase visualization and navigation.

### Required Usage

IMPORTANT: Agent MUST run `codemap hook session-start` after forst user input, before any other commands or actions!

- **Working State**: Agent MUST use `codemap --diff --ref master` to research changes different from default branch, and `git diff` + `git status` to research current working state.

### Quick Start

```bash
codemap .                    # Project tree
codemap --only md .          # Just Markdown files
codemap --exclude .png .     # Hide assets
codemap --depth 2 .          # Limit depth
codemap --diff --ref master  # What changed vs master
codemap --deps .             # Dependency flow
```

### Options

| Flag | Description |
|------|-------------|
| `--depth, -d <n>` | Limit tree depth (0 = unlimited) |
| `--only <exts>` | Only show files with these extensions |
| `--exclude <patterns>` | Exclude files matching patterns |
| `--diff` | Show files changed vs main branch |
| `--ref <branch>` | Branch to compare against (with --diff) |
| `--deps` | Dependency flow mode |
| `--importers <file>` | Check who imports a file |
| `--skyline` | City skyline visualization |
| `--json` | Output JSON |

**Smart pattern matching** - no quotes needed:
- `.png` - any `.png` file
- `Fonts` - any `/Fonts/` directory
- `*Test*` - glob pattern

### Diff Mode

See what you're working on:

```bash
codemap --diff --ref master
codemap --diff --ref develop
```

### Available Hooks

| Command | Trigger | Description |
|---------|---------|-------------|
| `codemap hook session-start` | SessionStart | Full tree, hubs, branch diff, last session context |
| `codemap hook pre-edit` | PreToolUse (Edit\|Write) | Who imports file + what hubs it imports |
| `codemap hook post-edit` | PostToolUse (Edit\|Write) | Impact of changes (same as pre-edit) |
| `codemap hook prompt-submit` | UserPromptSubmit | Hub context for mentioned files + session progress |
| `codemap hook pre-compact` | PreCompact | Saves hub state to .codemap/hubs.txt |
| `codemap hook session-stop` | SessionEnd | Edit timeline with line counts and stats |

