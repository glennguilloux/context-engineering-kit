# Plugin Manifest Specification

Technical specification for the `plugin.json` file structure required for creating Claude Code plugins.

## Table of Contents

- [Overview](#overview)
- [File Structure](#file-structure)
- [Schema Definition](#schema-definition)
- [Field Reference](#field-reference)
- [Examples](#examples)
- [Validation](#validation)
- [Best Practices](#best-practices)

## Overview

The `plugin.json` file is the manifest that defines a Claude Code plugin's metadata, author information, and relationship to the marketplace.

### Purpose

The plugin manifest:
- Identifies the plugin with name and version
- Provides human-readable description
- Specifies author contact information
- Enables marketplace discovery and installation
- Supports version management

### Location

The `plugin.json` file must be located at:

```
your-plugin/
└── .claude-plugin/
    └── plugin.json
```

This location is required for Claude Code to recognize the plugin.

## File Structure

### Minimal Valid Manifest

```json
{
  "name": "plugin-name",
  "version": "1.0.0",
  "description": "Brief description of what the plugin does",
  "author": {
    "name": "Your Name",
    "email": "your.email@example.com"
  }
}
```

### Complete Example

```json
{
  "name": "my-awesome-plugin",
  "version": "1.2.3",
  "description": "Introduces commands for doing awesome things with your code, based on best practices and proven patterns.",
  "author": {
    "name": "Jane Developer",
    "email": "jane.developer@example.com"
  }
}
```

## Schema Definition

The plugin manifest follows this schema:

```typescript
interface PluginManifest {
  name: string;              // Required: Plugin identifier
  version: string;           // Required: Semantic version
  description: string;       // Required: Plugin description
  author: Author;            // Required: Author information
}

interface Author {
  name: string;              // Required: Author name
  email: string;             // Required: Author email
}
```

## Field Reference

### name

**Type:** `string`
**Required:** Yes
**Format:** Lowercase letters, numbers, and hyphens only

**Description:**
Unique identifier for the plugin. Used in installation commands and must match the directory name in the marketplace.

**Rules:**
- Must be lowercase
- Can contain letters, numbers, and hyphens
- Cannot start or end with a hyphen
- Must be unique within the marketplace
- Should be descriptive but concise

**Examples:**
```json
"name": "reflexion"
"name": "code-review"
"name": "test-driven-development"
"name": "git"
```

**Invalid:**
```json
"name": "My Plugin"        // Contains spaces and capitals
"name": "REFLEXION"        // Contains capitals
"name": "-invalid-"        // Starts/ends with hyphen
"name": "plugin_name"      // Contains underscore
```

### version

**Type:** `string`
**Required:** Yes
**Format:** Semantic versioning (MAJOR.MINOR.PATCH)

**Description:**
Plugin version following semantic versioning specification.

**Semantic Versioning:**
- **MAJOR**: Incompatible API changes
- **MINOR**: Backward-compatible functionality additions
- **PATCH**: Backward-compatible bug fixes

**Rules:**
- Must follow semver format: `X.Y.Z`
- All components must be non-negative integers
- Cannot contain leading zeros (except for 0 itself)

**Examples:**
```json
"version": "1.0.0"      // Initial release
"version": "1.2.3"      // Version 1, update 2, patch 3
"version": "2.0.0"      // Major version change
"version": "0.1.0"      // Pre-release version
```

**Invalid:**
```json
"version": "1.0"        // Missing patch version
"version": "v1.0.0"     // Contains 'v' prefix
"version": "1.0.0-beta" // Contains pre-release tag
"version": "01.00.00"   // Contains leading zeros
```

### description

**Type:** `string`
**Required:** Yes
**Length:** 50-500 characters recommended

**Description:**
Human-readable description of the plugin's purpose, features, and benefits.

**Rules:**
- Should be clear and concise
- Should explain what the plugin does
- Should mention key features or techniques
- Should be written in sentence case
- Should not include markup or special characters

**Good Examples:**
```json
"description": "Collection of commands that force LLM to reflect on previous response and output. Based on papers like Self-Refine and Reflexion."

"description": "Introduces commands for commit and PRs creation with conventional commit messages and proper formatting."

"description": "Specification Driven Development workflow commands and agents, based on Github Spec Kit and OpenSpec. Uses specialized agents for effective context management and quality review."
```

**Poor Examples:**
```json
"description": "A plugin"  // Too vague

"description": "THIS PLUGIN IS THE BEST!!!" // Unprofessional

"description": "See README for details" // Not self-contained
```

### author

**Type:** `object`
**Required:** Yes

**Description:**
Information about the plugin author or maintainer.

#### author.name

**Type:** `string`
**Required:** Yes

**Description:**
Full name of the plugin author or organization.

**Examples:**
```json
"name": "Jane Developer"
"name": "NeoLabHQ"
"name": "Anthropic"
```

#### author.email

**Type:** `string`
**Required:** Yes
**Format:** Valid email address

**Description:**
Contact email for the plugin author.

**Examples:**
```json
"email": "jane.developer@example.com"
"email": "contact@neolab.finance"
"email": "support@anthropic.com"
```

**Rules:**
- Must be a valid email format
- Should be a monitored email address
- Should be appropriate for public display

## Examples

### Example 1: Simple Plugin

```json
{
  "name": "git",
  "version": "1.0.0",
  "description": "Introduces commands for commit and PRs creation.",
  "author": {
    "name": "Vlad Goncharov",
    "email": "vlad.goncharov@neolab.finance"
  }
}
```

### Example 2: Complex Plugin

```json
{
  "name": "code-review",
  "version": "1.0.0",
  "description": "Introduce codebase and PR review commands and skills using multiple specialized agents.",
  "author": {
    "name": "Vlad Goncharov",
    "email": "vlad.goncharov@neolab.finance"
  }
}
```

### Example 3: Workflow Plugin

```json
{
  "name": "sdd",
  "version": "1.0.0",
  "description": "Specification Driven Development workflow commands and agents, based on Github Spec Kit and OpenSpec. Uses specialized agents for effective context management and quality review.",
  "author": {
    "name": "Vlad Goncharov",
    "email": "vlad.goncharov@neolab.finance"
  }
}
```

## Validation

### Required Fields Check

All plugins must include:
- ✓ `name` field
- ✓ `version` field
- ✓ `description` field
- ✓ `author` object with `name` and `email`

### Format Validation

- `name`: Lowercase with hyphens only
- `version`: Semantic versioning format (X.Y.Z)
- `email`: Valid email format

### Content Validation

- Description should be meaningful and informative
- Version should follow semver conventions
- Author information should be accurate

## Best Practices

### Naming

**Do:**
- Use descriptive, memorable names
- Keep names short but clear
- Use hyphens for multi-word names
- Be consistent with related plugins

**Don't:**
- Use generic names like "plugin" or "helper"
- Use overly long names
- Include version numbers in the name
- Use abbreviations unless widely known

**Good Names:**
```
reflexion
code-review
test-driven-development
git
```

**Poor Names:**
```
my-plugin
helper-utils
tdd-v2
cr
```

### Versioning

**Starting Version:**
- Use `1.0.0` for initial stable release
- Use `0.x.x` for pre-release/beta versions

**Version Updates:**
- **Patch** (0.0.X): Bug fixes, documentation updates
- **Minor** (0.X.0): New features, backward-compatible changes
- **Major** (X.0.0): Breaking changes, major redesigns

**Examples:**
```
1.0.0 → 1.0.1  // Bug fix
1.0.1 → 1.1.0  // New command added
1.1.0 → 2.0.0  // Command syntax changed (breaking)
```

### Description

**Do:**
- Start with what the plugin does
- Mention key features or techniques
- Reference notable methodologies or papers
- Keep it under 500 characters
- Use sentence case

**Don't:**
- Include installation instructions
- List all commands (use docs for that)
- Use marketing language
- Include special characters or emojis

**Formula:**
```
[What it does] + [Key features/approach] + [Optional: Based on X]
```

**Example:**
```
"Introduces commands for test-driven development, common anti-patterns and skills for testing using subagents."
```

### Author Information

**Do:**
- Use real, verifiable contact information
- Keep email address current
- Use organization name if appropriate
- Ensure email is monitored

**Don't:**
- Use placeholder emails
- Use personal email for organization plugins
- Include multiple authors (use main contact)

## Common Mistakes

### Invalid JSON

❌ **Trailing commas:**
```json
{
  "name": "my-plugin",
  "version": "1.0.0",  // Trailing comma before }
}
```

✅ **Correct:**
```json
{
  "name": "my-plugin",
  "version": "1.0.0"
}
```

### Missing Required Fields

❌ **Missing author:**
```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "My awesome plugin"
}
```

✅ **Correct:**
```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "My awesome plugin",
  "author": {
    "name": "Developer Name",
    "email": "dev@example.com"
  }
}
```

### Incorrect Formatting

❌ **Invalid name:**
```json
{
  "name": "My_Plugin",
  "version": "1.0.0"
}
```

✅ **Correct:**
```json
{
  "name": "my-plugin",
  "version": "1.0.0"
}
```

## Integration with Marketplace

### Plugin Directory Structure

```
marketplace/
├── .claude-plugin/
│   └── marketplace.json          # Marketplace manifest
└── plugins/
    ├── reflexion/
    │   └── .claude-plugin/
    │       └── plugin.json       # Plugin manifest
    ├── code-review/
    │   └── .claude-plugin/
    │       └── plugin.json       # Plugin manifest
    └── git/
        └── .claude-plugin/
            └── plugin.json       # Plugin manifest
```

### Marketplace Reference

The marketplace's `marketplace.json` references plugins:

```json
{
  "plugins": [
    {
      "name": "reflexion",
      "description": "...",
      "version": "1.0.0",
      "author": { ... },
      "source": "./plugins/reflexion",
      "category": "productivity"
    }
  ]
}
```

**Note:** The `name` and `version` should match the plugin's own `plugin.json`.

## Validation Tools

### Manual Validation

Check your manifest:
1. Validate JSON syntax (use JSONLint or IDE)
2. Verify all required fields present
3. Check naming conventions
4. Validate version format
5. Verify email format

### Automated Validation

Create a validation script:

```bash
# Check if plugin.json exists
if [ ! -f ".claude-plugin/plugin.json" ]; then
  echo "Error: plugin.json not found"
  exit 1
fi

# Validate JSON syntax
if ! jq empty .claude-plugin/plugin.json 2>/dev/null; then
  echo "Error: Invalid JSON syntax"
  exit 1
fi

# Check required fields
for field in name version description author; do
  if ! jq -e ".$field" .claude-plugin/plugin.json >/dev/null; then
    echo "Error: Missing required field: $field"
    exit 1
  fi
done

echo "Validation passed!"
```

## See Also

**Reference:**
- [Marketplace API](./marketplace-api.md) - Installing and managing plugins
- [Command Index](./command-index.md) - Documenting plugin commands
- [Skill Index](./skill-index.md) - Documenting plugin skills
- [Agent Index](./agent-index.md) - Documenting plugin agents

**Concepts:**
- [Granular Design](../concepts/granular-design.md) - Plugin architecture principles

**Guides:**
- [Choosing Plugins](../guides/choosing-plugins.md) - Understanding plugin metadata
