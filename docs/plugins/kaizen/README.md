# Kaizen Plugin

> **Status:** Documentation in progress

## Overview

Continuous improvement methodology inspired by Japanese philosophy and Agile practices. Introduces commands for analysis of root causes of issues and problems, including 5 Whys, Cause and Effect Analysis, and other techniques.

## Installation

```bash
/plugin install kaizen@NeoLabHQ/context-engineering-kit
```

## Quick Info

**Plugin Type:** Commands and Skills
**Key Features:**
- Root cause analysis (5 Whys)
- Fishbone/Cause-and-Effect analysis
- A3 problem solving
- PDCA cycle implementation
- Gemba Walk, Value Stream, and Muda analysis
- Bug tracing through call stacks

## Documentation Status

This plugin documentation is currently being written. For now, please refer to:

- [Main Plugin Directory](../README.md) - Overview of all plugins
- [Getting Started Guide](../../getting-started.md) - How to install and use plugins
- [User Guide](../../user-guide.md) - Comprehensive usage guide

## Available Commands

- `/kaizen:analyse` - Auto-selects best Kaizen method (Gemba Walk, Value Stream, or Muda) for target analysis
- `/kaizen:analyse-problem` - Comprehensive A3 one-page problem analysis with root cause and action plan
- `/kaizen:why` - Iterative Five Whys root cause analysis drilling from symptoms to fundamentals
- `/kaizen:root-cause-tracing` - Systematically traces bugs backward through call stack to identify source of invalid data or incorrect behavior
- `/kaizen:cause-and-effect` - Systematic Fishbone analysis exploring problem causes across six categories
- `/kaizen:plan-do-check-act` - Iterative PDCA cycle for systematic experimentation and continuous improvement

## Available Skills

- **kaizen** - Continuous improvement methodology with multiple analysis techniques

## More Information

For the latest information about this plugin, see the main [README.md](../../README.md#kaizen).

---

*This documentation is part of the [Context Engineering Kit](../../README.md) marketplace.*
