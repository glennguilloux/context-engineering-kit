# Reflexion Plugin - Installation Guide

## Prerequisites

- Claude Code installed and configured
- Context Engineering Kit marketplace added

## Installation

### Step 1: Add Marketplace (if not already added)

```bash
/plugin marketplace add NeoLabHQ/context-engineering-kit
```

This makes all plugins available but doesn't load anything into context yet.

### Step 2: Install Reflexion Plugin

```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

This installs the plugin and loads its commands into your Claude Code session.

## Verification

### Verify Installation

Check that the plugin is installed:

```bash
/plugin
```

You should see `reflexion` in the list of installed plugins.

### Verify Commands

Try listing available commands (the plugin commands should appear):

```bash
# Test reflect command
/reflexion:reflect --help

# Test critique command
/reflexion:critique --help

# Test memorize command
/reflexion:memorize --help
```

### Test Basic Usage

Run a simple test to ensure everything works:

```bash
# Have Claude do something simple
> claude "write a function to calculate fibonacci numbers"

# Reflect on it
> /reflexion:reflect
```

If the reflection runs successfully and provides feedback, the plugin is working correctly.

## What Gets Loaded

When you install the Reflexion plugin, the following are loaded into Claude's context:

### Commands
- `/reflexion:reflect` - Self-refinement command
- `/reflexion:critique` - Multi-perspective critique command
- `/reflexion:memorize` - Memory update command

### No Skills
The Reflexion plugin uses commands only (no automatic skills) to keep context lean and give you explicit control.

## Uninstalling

If you need to remove the plugin:

```bash
/plugin uninstall reflexion@NeoLabHQ/context-engineering-kit
```

This removes the commands from your session without affecting the marketplace.

## Troubleshooting

### Plugin not found

**Error:** `Plugin reflexion@NeoLabHQ/context-engineering-kit not found`

**Solution:**
```bash
# Make sure marketplace is added
/plugin marketplace add NeoLabHQ/context-engineering-kit

# Update marketplace
/plugin marketplace update NeoLabHQ/context-engineering-kit

# Try installation again
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

### Commands not working

**Error:** Commands don't execute or show errors

**Solution:**
```bash
# Reload Claude Code
# Exit and restart claude

# Reinstall the plugin
/plugin uninstall reflexion@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

### Marketplace update issues

**Error:** Can't update marketplace

**Solution:**
```bash
# Remove and re-add marketplace
/plugin marketplace remove NeoLabHQ/context-engineering-kit
/plugin marketplace add NeoLabHQ/context-engineering-kit
```

## Configuration

### CLAUDE.md Integration

The `/reflexion:memorize` command updates your project's `CLAUDE.md` file. Ensure:

1. You have write permissions in your project directory
2. The file exists or can be created (plugin will create if missing)
3. The file is tracked in git (optional but recommended)

### Custom Memory Location

By default, memorization updates `./CLAUDE.md`. If your project uses a different location or name for project memory, you may need to specify it in the command.

## Next Steps

- Read the [Commands Reference](./commands.md) for detailed command documentation
- Explore [Usage Examples](./usage-examples.md) for practical scenarios
- Review [Best Practices](./README.md#best-practices) in the main documentation

## Update Plugin

To get the latest version:

```bash
# Update marketplace
/plugin marketplace update NeoLabHQ/context-engineering-kit

# Reinstall plugin
/plugin uninstall reflexion@NeoLabHQ/context-engineering-kit
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```
