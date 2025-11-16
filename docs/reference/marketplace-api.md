# Marketplace API Reference

Complete reference for all marketplace-related commands for managing plugin repositories and installations in Claude Code.

## Table of Contents

- [Overview](#overview)
- [Marketplace Commands](#marketplace-commands)
- [Plugin Management Commands](#plugin-management-commands)
- [Command Reference](#command-reference)
- [Workflow Examples](#workflow-examples)
- [Troubleshooting](#troubleshooting)

## Overview

The Claude Code marketplace system enables:
- Adding plugin repositories (marketplaces)
- Installing plugins from marketplaces
- Managing installed plugins
- Updating marketplace listings
- Viewing available plugins

### Key Concepts

**Marketplace:**
A Git repository containing multiple plugins, with a manifest file (`.claude-plugin/marketplace.json`) that lists available plugins.

**Plugin:**
A single extension with commands, skills, and/or agents, defined by a `plugin.json` manifest.

**Installation:**
The process of loading a plugin's commands, skills, and agents into Claude's context.

### Command Format

All marketplace and plugin commands follow this format:

```bash
/plugin [subcommand] [arguments]
```

## Marketplace Commands

Commands for managing marketplace repositories.

### /plugin marketplace add

Add a marketplace repository to make its plugins available for installation.

**Syntax:**
```bash
/plugin marketplace add <owner>/<repository>
```

**Parameters:**
- `owner` - GitHub username or organization
- `repository` - Repository name

**What It Does:**
1. Clones the marketplace repository
2. Reads the marketplace manifest
3. Makes all listed plugins discoverable
4. Does NOT install any plugins automatically

**Example:**
```bash
/plugin marketplace add NeoLabHQ/context-engineering-kit
```

**Output:**
```
Marketplace added successfully!
Available plugins: 12
Use /plugin to view all available plugins
```

**Important:**
- Adding a marketplace does NOT load any agents or skills into context
- You must explicitly install plugins after adding a marketplace
- Multiple marketplaces can be added simultaneously

**Use Cases:**
- First-time setup of a plugin collection
- Accessing plugins from a new repository
- Making custom plugin collections available

### /plugin marketplace update

Update an existing marketplace to get the latest plugin listings and versions.

**Syntax:**
```bash
/plugin marketplace update <owner>/<repository>
```

**Parameters:**
- `owner` - GitHub username or organization
- `repository` - Repository name

**What It Does:**
1. Fetches latest changes from the marketplace repository
2. Updates marketplace manifest
3. Refreshes plugin listings
4. Updates available versions
5. Does NOT automatically update installed plugins

**Example:**
```bash
/plugin marketplace update NeoLabHQ/context-engineering-kit
```

**Output:**
```
Marketplace updated successfully!
New plugins available: 2
Updated plugins: 5
Use /plugin update <plugin-name> to update installed plugins
```

**Important:**
- Updates marketplace metadata only
- Does NOT update already installed plugins
- Use `/plugin update` to update installed plugins after marketplace update

**Use Cases:**
- Getting latest plugin additions
- Checking for plugin updates
- Refreshing marketplace metadata
- Regular maintenance

**Recommended Frequency:**
- Before installing new plugins
- Weekly for active development
- Monthly for stable projects

### /plugin marketplace remove

Remove a marketplace repository from your system.

**Syntax:**
```bash
/plugin marketplace remove <owner>/<repository>
```

**Parameters:**
- `owner` - GitHub username or organization
- `repository` - Repository name

**What It Does:**
1. Removes marketplace metadata
2. Makes marketplace plugins unavailable for new installations
3. Does NOT uninstall already installed plugins from this marketplace

**Example:**
```bash
/plugin marketplace remove NeoLabHQ/context-engineering-kit
```

**Output:**
```
Marketplace removed successfully!
Installed plugins from this marketplace remain installed.
Use /plugin uninstall <plugin-name> to remove installed plugins.
```

**Important:**
- Installed plugins remain functional
- Cannot install new plugins from removed marketplace
- Can re-add marketplace later without losing installed plugins

**Use Cases:**
- Removing unused marketplace sources
- Cleaning up marketplace list
- Switching to different marketplace versions

### /plugin marketplace list

List all added marketplaces.

**Syntax:**
```bash
/plugin marketplace list
```

**Parameters:**
None

**What It Does:**
Displays all currently added marketplaces with their status and plugin counts.

**Example:**
```bash
/plugin marketplace list
```

**Output:**
```
Added Marketplaces:

1. NeoLabHQ/context-engineering-kit
   Plugins: 12
   Last Updated: 2025-11-15
   Status: Active

2. anthropics/claude-code
   Plugins: 8
   Last Updated: 2025-11-10
   Status: Active
```

**Use Cases:**
- Checking which marketplaces are available
- Verifying marketplace status
- Reviewing plugin sources

## Plugin Management Commands

Commands for managing individual plugins.

### /plugin install

Install a plugin from a marketplace.

**Syntax:**
```bash
/plugin install <plugin-name>@<owner>/<repository>
```

**Parameters:**
- `plugin-name` - Name of the plugin to install
- `owner` - GitHub username or organization
- `repository` - Repository name (marketplace)

**What It Does:**
1. Locates plugin in specified marketplace
2. Loads plugin's commands into Claude
3. Loads plugin's skills into context
4. Registers plugin's agents
5. Makes plugin functionality immediately available

**Example:**
```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**Output:**
```
Plugin installed successfully!

reflexion v1.0.0
Commands loaded: 3
Skills loaded: 0
Agents registered: 0

Available commands:
  /reflexion:reflect
  /reflexion:memorize
  /reflexion:critique

Type /reflexion:reflect to start using the plugin.
```

**Important:**
- Plugin functionality is immediately available after installation
- Skills are automatically applied to all subsequent interactions
- Commands can be used right away
- Agents are available to commands that invoke them

**Use Cases:**
- Adding new functionality to Claude
- Installing specific workflow support
- Enabling specialized analysis capabilities

**Multiple Installations:**
```bash
# Install multiple plugins
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit
```

### /plugin uninstall

Uninstall a plugin and remove its functionality.

**Syntax:**
```bash
/plugin uninstall <plugin-name>@<owner>/<repository>
```

**Parameters:**
- `plugin-name` - Name of the plugin to uninstall
- `owner` - GitHub username or organization
- `repository` - Repository name (marketplace)

**What It Does:**
1. Removes plugin's commands
2. Removes plugin's skills from context
3. Unregisters plugin's agents
4. Cleans up plugin resources

**Example:**
```bash
/plugin uninstall reflexion@NeoLabHQ/context-engineering-kit
```

**Output:**
```
Plugin uninstalled successfully!

reflexion v1.0.0
Commands removed: 3
Skills removed: 0
Agents unregistered: 0

The plugin's functionality is no longer available.
```

**Important:**
- All plugin functionality is immediately removed
- Skills no longer affect Claude's behavior
- Commands are no longer available
- Can be reinstalled at any time

**Use Cases:**
- Removing unused plugins
- Resolving plugin conflicts
- Reducing context usage
- Temporary plugin disable

### /plugin update

Update an installed plugin to the latest version.

**Syntax:**
```bash
/plugin update <plugin-name>@<owner>/<repository>
```

**Parameters:**
- `plugin-name` - Name of the plugin to update
- `owner` - GitHub username or organization
- `repository` - Repository name (marketplace)

**What It Does:**
1. Checks for newer plugin version
2. Downloads latest version
3. Updates commands, skills, and agents
4. Preserves plugin configuration

**Example:**
```bash
/plugin update reflexion@NeoLabHQ/context-engineering-kit
```

**Output:**
```
Plugin updated successfully!

reflexion: 1.0.0 → 1.1.0

Changes:
  New commands: 1
  Updated commands: 2
  New skills: 0
  Updated agents: 0

Type /plugin changelog reflexion to see detailed changes.
```

**Important:**
- Always update marketplace before updating plugins
- Review changelog for breaking changes
- Test updated plugins in non-production first
- Updates are immediate and cannot be rolled back easily

**Use Cases:**
- Getting new features
- Receiving bug fixes
- Staying current with improvements
- Following best practice updates

**Before Updating:**
```bash
# First, update the marketplace
/plugin marketplace update NeoLabHQ/context-engineering-kit

# Then update plugins
/plugin update reflexion@NeoLabHQ/context-engineering-kit
```

### /plugin

List all available and installed plugins.

**Syntax:**
```bash
/plugin
```

**Parameters:**
None

**What It Does:**
Displays all plugins from all added marketplaces, showing installation status.

**Example:**
```bash
/plugin
```

**Output:**
```
Available Plugins:

NeoLabHQ/context-engineering-kit:

✓ reflexion (v1.0.0) - INSTALLED
  Collection of commands that force LLM to reflect on previous response

✓ code-review (v1.0.0) - INSTALLED
  Introduce codebase and PR review commands using specialized agents

  git (v1.0.0)
  Introduces commands for commit and PRs creation

  tdd (v1.0.0)
  Introduces commands for test-driven development

  [... more plugins ...]

Legend:
  ✓ Installed
    Available
```

**Use Cases:**
- Discovering available plugins
- Checking installation status
- Finding plugin names for installation
- Reviewing plugin descriptions

### /plugin info

Show detailed information about a specific plugin.

**Syntax:**
```bash
/plugin info <plugin-name>@<owner>/<repository>
```

**Parameters:**
- `plugin-name` - Name of the plugin
- `owner` - GitHub username or organization
- `repository` - Repository name (marketplace)

**What It Does:**
Displays comprehensive information about a plugin including commands, skills, agents, and metadata.

**Example:**
```bash
/plugin info reflexion@NeoLabHQ/context-engineering-kit
```

**Output:**
```
Plugin: reflexion
Version: 1.0.0
Author: Vlad Goncharov <vlad.goncharov@neolab.finance>
Status: INSTALLED

Description:
Collection of commands that force LLM to reflect on previous response
and output. Based on papers like Self-Refine and Reflexion.

Commands (3):
  /reflexion:reflect   - Reflect on previous response and output
  /reflexion:memorize  - Memorize insights from reflections
  /reflexion:critique  - Comprehensive multi-perspective review

Skills (0):
  None

Agents (0):
  None

Installation:
  /plugin install reflexion@NeoLabHQ/context-engineering-kit

Documentation:
  See /docs/reference/command-index.md#reflexion
```

**Use Cases:**
- Learning about a plugin before installation
- Checking what commands a plugin provides
- Finding plugin documentation
- Verifying plugin version

## Command Reference

### Quick Reference Table

| Command | Purpose | Affects Context | Requires Marketplace |
|---------|---------|-----------------|----------------------|
| `/plugin marketplace add` | Add marketplace | No | No |
| `/plugin marketplace update` | Update marketplace | No | Yes |
| `/plugin marketplace remove` | Remove marketplace | No | Yes |
| `/plugin marketplace list` | List marketplaces | No | No |
| `/plugin install` | Install plugin | Yes | Yes |
| `/plugin uninstall` | Uninstall plugin | Yes | Yes |
| `/plugin update` | Update plugin | Yes | Yes |
| `/plugin` | List plugins | No | No |
| `/plugin info` | Show plugin details | No | Yes |

### Context Impact

**Commands that load into context:**
- `/plugin install` - Loads commands, skills, agents

**Commands that modify context:**
- `/plugin uninstall` - Removes commands, skills, agents
- `/plugin update` - Updates commands, skills, agents

**Commands with no context impact:**
- All `/plugin marketplace` commands
- `/plugin` (list)
- `/plugin info`

## Workflow Examples

### First-Time Setup

Complete workflow for setting up plugins from scratch:

```bash
# Step 1: Add the marketplace
/plugin marketplace add NeoLabHQ/context-engineering-kit

# Step 2: View available plugins
/plugin

# Step 3: Get info about specific plugin
/plugin info reflexion@NeoLabHQ/context-engineering-kit

# Step 4: Install desired plugins
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit

# Step 5: Start using plugins
/reflexion:reflect
```

### Regular Updates

Workflow for keeping plugins up to date:

```bash
# Step 1: Update marketplace metadata
/plugin marketplace update NeoLabHQ/context-engineering-kit

# Step 2: List plugins to see available updates
/plugin

# Step 3: Update specific plugins
/plugin update reflexion@NeoLabHQ/context-engineering-kit
/plugin update code-review@NeoLabHQ/context-engineering-kit

# Step 4: Verify updates
/plugin info reflexion@NeoLabHQ/context-engineering-kit
```

### Installing Specific Workflow

Example: Setting up for Spec-Driven Development:

```bash
# Add marketplace
/plugin marketplace add NeoLabHQ/context-engineering-kit

# Install SDD workflow
/plugin install sdd@NeoLabHQ/context-engineering-kit

# Install complementary plugins
/plugin install tdd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit
/plugin install git@NeoLabHQ/context-engineering-kit

# Start workflow
/sdd:00-setup
```

### Trying a Plugin Temporarily

Workflow for testing a plugin:

```bash
# Install plugin
/plugin install kaizen@NeoLabHQ/context-engineering-kit

# Try it out
/kaizen:why

# If not needed, uninstall
/plugin uninstall kaizen@NeoLabHQ/context-engineering-kit
```

### Managing Multiple Marketplaces

Working with multiple plugin sources:

```bash
# Add multiple marketplaces
/plugin marketplace add NeoLabHQ/context-engineering-kit
/plugin marketplace add anthropics/claude-code

# List all marketplaces
/plugin marketplace list

# View all available plugins
/plugin

# Install from specific marketplace
/plugin install reflexion@NeoLabHQ/context-engineering-kit
/plugin install git-helper@anthropics/claude-code
```

## Troubleshooting

### Common Issues

#### Marketplace Not Found

**Error:**
```
Error: Marketplace not found: NeoLabHQ/context-engineering-kit
```

**Solutions:**
1. Verify repository exists and is public
2. Check spelling of owner/repository
3. Ensure you have internet connectivity
4. Try adding full GitHub URL

#### Plugin Not Found

**Error:**
```
Error: Plugin 'reflexion' not found in marketplace
```

**Solutions:**
1. Update marketplace: `/plugin marketplace update NeoLabHQ/context-engineering-kit`
2. Verify plugin name spelling
3. Check plugin exists in marketplace with `/plugin`
4. Ensure marketplace was added correctly

#### Plugin Already Installed

**Error:**
```
Error: Plugin 'reflexion' is already installed
```

**Solutions:**
1. Use `/plugin update` to update the plugin
2. Use `/plugin uninstall` then `/plugin install` to reinstall
3. Check installed plugins with `/plugin`

#### Installation Failed

**Error:**
```
Error: Failed to install plugin 'reflexion'
```

**Solutions:**
1. Check marketplace is up to date
2. Verify plugin manifest is valid
3. Check for conflicting plugins
4. Try removing and re-adding marketplace
5. Review error logs for specific issues

#### Update Failed

**Error:**
```
Error: Failed to update plugin 'reflexion'
```

**Solutions:**
1. Update marketplace first: `/plugin marketplace update`
2. Check for breaking changes in changelog
3. Uninstall and reinstall if update fails
4. Verify internet connectivity

### Best Practices

#### Installation

**Do:**
- Update marketplace before installing new plugins
- Read plugin info before installation
- Install plugins you actually need
- Review plugin commands after installation

**Don't:**
- Install all plugins at once without review
- Install without checking plugin description
- Skip marketplace updates
- Install conflicting plugins

#### Updates

**Do:**
- Update marketplace before updating plugins
- Review changelogs before updating
- Test updates in development first
- Keep plugins reasonably current

**Don't:**
- Update without reading changes
- Update plugins during critical work
- Skip marketplace updates
- Leave plugins severely outdated

#### Maintenance

**Do:**
- Regularly review installed plugins
- Uninstall unused plugins
- Keep marketplace listings current
- Monitor plugin functionality

**Don't:**
- Accumulate unused plugins
- Ignore update notifications
- Let marketplaces become stale
- Keep broken plugins installed

## Version Management

### Semantic Versioning

Plugins follow semantic versioning (semver):

```
MAJOR.MINOR.PATCH
  1  .  2  .  3
```

**Version Meanings:**
- **MAJOR**: Breaking changes (incompatible)
- **MINOR**: New features (backward-compatible)
- **PATCH**: Bug fixes (backward-compatible)

**Update Safety:**
- **PATCH**: Always safe to update
- **MINOR**: Generally safe, may add features
- **MAJOR**: Review carefully, may break workflows

### Checking Versions

**Current version:**
```bash
/plugin info reflexion@NeoLabHQ/context-engineering-kit
```

**Available version:**
```bash
# Update marketplace first
/plugin marketplace update NeoLabHQ/context-engineering-kit

# Then check plugin info
/plugin info reflexion@NeoLabHQ/context-engineering-kit
```

## See Also

**Reference:**
- [Plugin Manifest](./plugin-manifest.md) - Plugin structure and metadata
- [Command Index](./command-index.md) - All available commands
- [Skill Index](./skill-index.md) - Skills in plugins
- [Agent Index](./agent-index.md) - Agents in plugins

**Guides:**
- [Choosing Plugins](../guides/choosing-plugins.md) - Plugin selection framework
- [Combining Plugins](../guides/combining-plugins.md) - Working with multiple plugins
- [Optimization](../guides/optimization.md) - Managing plugin token costs
