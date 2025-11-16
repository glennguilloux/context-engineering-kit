# Architecture

The Context Engineering Kit is built on a carefully designed architecture that balances power, efficiency, and simplicity. Understanding how the system works helps you make informed decisions about which plugins to use and how to combine them effectively.

## Overview

CEK implements a three-tier architecture:

```
Marketplace
    ↓
Plugins
    ↓
Components (Commands, Skills, Agents)
```

Each tier serves a specific purpose and has distinct loading characteristics.

## Architecture Principles

### 1. Lazy Loading

Components load only when needed:

- **Marketplace**: Metadata only, no content
- **Plugin**: Minimal registration, components on-demand
- **Command**: Prompt content on invocation
- **Skill**: Loaded at plugin installation
- **Agent**: Fresh context per task

### 2. Isolation

Each plugin operates independently:

- No shared state between plugins
- No dependencies between plugins
- Clear boundaries for component ownership
- Predictable behavior regardless of other installed plugins

### 3. Composability

Plugins work together naturally:

- Complementary functionality across plugins
- No conflicts or overlaps
- Commands can invoke other commands
- Workflows combine multiple plugins

### 4. Transparency

System behavior is observable and predictable:

- Clear plugin installation status
- Visible command availability
- Documented token impact
- Explicit agent invocations

## Tier 1: Marketplace

The marketplace is the entry point to CEK.

### Structure

```json
{
  "name": "context-engineering-kit",
  "version": "1.0.0",
  "description": "Hand-crafted collection...",
  "owner": {
    "name": "NeoLabHQ",
    "email": "vlad.goncharov@neolab.finance"
  },
  "plugins": [
    {
      "name": "reflexion",
      "description": "Collection of commands...",
      "version": "1.0.0",
      "author": {...},
      "source": "./plugins/reflexion",
      "category": "productivity"
    },
    ...
  ]
}
```

### Location

- **Repository**: `NeoLabHQ/context-engineering-kit`
- **File**: `.claude-plugin/marketplace.json`
- **Schema**: Anthropic's official marketplace schema

### Loading Characteristics

When you add the marketplace:

```bash
/plugin marketplace add NeoLabHQ/context-engineering-kit
```

**What loads**: Only metadata (plugin names, descriptions, versions, sources)

**Token impact**: ~0 tokens (metadata stays in system, not context)

**Effect**: Makes plugins discoverable and installable, nothing more

### Update Mechanism

```bash
/plugin marketplace update NeoLabHQ/context-engineering-kit
```

- Fetches latest marketplace.json from repository
- Updates plugin listings and versions
- No impact on installed plugins
- No context changes

## Tier 2: Plugins

Plugins are cohesive collections of related functionality.

### Structure

Each plugin follows this directory structure:

```
plugins/reflexion/
├── .claude-plugin/
│   └── plugin.json          # Plugin metadata
├── commands/
│   ├── reflect.md           # Command prompt
│   ├── critique.md          # Command prompt
│   └── memorize.md          # Command prompt
├── skills/
│   └── [skill-name]/
│       └── SKILL.md         # Skill prompt
└── agents/
    └── [agent-name].md      # Agent prompt
```

### Plugin Metadata

```json
{
  "name": "reflexion",
  "version": "1.0.0",
  "description": "Collection of commands...",
  "author": {
    "name": "Vlad Goncharov",
    "email": "vlad.goncharov@neolab.finance"
  }
}
```

### Loading Characteristics

When you install a plugin:

```bash
/plugin install reflexion@NeoLabHQ/context-engineering-kit
```

**What loads**:
1. Plugin metadata (name, version, description)
2. All skills in the plugin (content loaded into context)
3. Command registration (names and descriptions, not prompts)
4. Agent registration (names and descriptions, not prompts)

**Token impact**:
- Plugin metadata: ~50 tokens
- Each skill: 200-1000 tokens (varies by skill)
- Command registration: ~20 tokens per command
- Agent registration: ~20 tokens per agent

**Example** (Reflexion plugin):
- Metadata: ~50 tokens
- Commands (3): ~60 tokens
- Agents (if any): ~20 tokens per agent
- Skills (if any): varies

Total: ~150-500 tokens depending on configuration

### Categories

Plugins are organized by category:

- **productivity** - Workflow automation and quality tools
- **development** - Software engineering practices and patterns

Categories help with discovery but don't affect functionality.

### Dependencies

Plugins have NO dependencies:
- No required other plugins
- No external tools or services
- No configuration files needed

Each plugin is completely self-contained.

## Tier 3: Components

Components are the functional units within plugins.

### Commands

Commands are invokable actions that execute when called.

#### Structure

```markdown
# Command: reflect

You are a reflection specialist...

## Instructions

1. Review the previous response...
2. Identify potential improvements...
3. Generate refined output...

## Output Format

...
```

#### Loading Characteristics

Commands use lazy loading:

```bash
> /reflexion:reflect
```

**When registered** (plugin installation):
- Command name: `/reflexion:reflect`
- Brief description: "Reflect on previous response..."
- Token cost: ~20 tokens

**When invoked**:
- Full command prompt loads into context
- Token cost: 300-800 tokens (varies by command)
- Remains in context for execution
- Cleared after completion (not persisted)

#### Naming Convention

Commands follow the pattern: `/[plugin]:[action]`

Examples:
- `/reflexion:reflect`
- `/git:commit`
- `/code-review:review-pr`
- `/sdd:01-specify`

This prevents naming conflicts and makes plugin ownership clear.

#### Token Efficiency

Commands are more token-efficient than skills because:
1. Only load when invoked
2. Not persisted in context
3. Used for specific tasks, not continuous guidance
4. Can be invoked multiple times without redundancy

### Skills

Skills are always-on capabilities that guide Claude's behavior.

#### Structure

```markdown
# Skill: test-driven-development

You have expertise in test-driven development...

## Principles

1. Write tests before implementation
2. Follow Red-Green-Refactor cycle
3. Keep tests simple and focused

## When This Skill Activates

Apply these principles when:
- Writing test files
- Implementing features with tests
- Refactoring tested code
```

#### Loading Characteristics

Skills load at plugin installation:

```bash
/plugin install tdd@NeoLabHQ/context-engineering-kit
```

**What loads**:
- Full skill prompt into context
- Token cost: 200-1000 tokens per skill
- Remains in context permanently (while plugin installed)

**When active**:
- Always present while plugin installed
- Guides relevant behaviors automatically
- No explicit invocation needed

#### Use Cases

Skills are ideal for:
- Continuous guidance (coding style, architecture patterns)
- Background knowledge (best practices, principles)
- Implicit behaviors (test-first approach, SOLID principles)
- Cross-cutting concerns (security awareness, error handling)

#### Token Trade-offs

Skills have higher token costs because:
- Always loaded (not on-demand)
- Persist throughout session
- Apply broadly across many tasks

Use skills only when continuous presence is valuable.

### Agents

Agents are specialized sub-agents invoked for specific tasks.

#### Structure

```markdown
# Agent: bug-hunter

You are a bug detection specialist...

## Expertise

- Logic errors and edge cases
- Error handling gaps
- Race conditions
- Resource leaks

## Task

Review the provided code and identify:
1. Potential bugs
2. Edge cases not handled
3. Error-prone patterns

## Output Format

...
```

#### Loading Characteristics

Agents use fresh context:

```bash
# Invoked by command (e.g., /code-review:review-pr)
# or explicitly in command logic
```

**When invoked**:
- Creates new agent context
- Loads only agent prompt + task-specific data
- Executes independently
- Returns results
- Context discarded after completion

**Token impact**:
- Not loaded into main context
- Each agent uses its own token budget
- Multiple agents can run in parallel
- Main context remains clean

#### Use Cases

Agents are ideal for:
- Specialized analysis (bug detection, security audit)
- Multi-perspective review (multiple specialized reviewers)
- Complex tasks that would clutter main context
- Parallel processing of subtasks

#### Benefits

Fresh context per agent:
1. **Focus** - Agent sees only what it needs
2. **Expertise** - Specialized prompt for specific task
3. **Isolation** - No interference with main conversation
4. **Scalability** - Run many agents without context pollution

## Plugin Examples

### Example 1: Reflexion (Command-Heavy)

```
reflexion/
├── commands/
│   ├── reflect.md       # On-demand reflection
│   ├── critique.md      # On-demand critique
│   └── memorize.md      # On-demand memory update
└── skills/
    └── (none)           # No always-on skills
```

**Design rationale**: Reflection is an explicit action, not continuous behavior. Commands provide on-demand access without context pollution.

**Token efficiency**: Only pay for reflection when you use it.

### Example 2: TDD (Skill-Heavy)

```
tdd/
├── skills/
│   └── test-driven-development/
│       └── SKILL.md     # Always-on TDD guidance
└── commands/
    └── (none)           # No explicit commands
```

**Design rationale**: TDD is a continuous practice that should guide all development. Skill ensures test-first approach without manual invocation.

**Token cost**: Higher upfront cost, but valuable for continuous TDD adherence.

### Example 3: Code Review (Agent-Heavy)

```
code-review/
├── commands/
│   ├── review-pr.md            # Orchestrates agents
│   └── review-local-changes.md # Orchestrates agents
├── agents/
│   ├── bug-hunter.md           # Specialized reviewer
│   ├── security-auditor.md     # Specialized reviewer
│   ├── test-coverage-reviewer.md # Specialized reviewer
│   ├── code-quality-reviewer.md # Specialized reviewer
│   ├── contracts-reviewer.md   # Specialized reviewer
│   └── historical-context-reviewer.md # Specialized reviewer
└── skills/
    └── (none)
```

**Design rationale**: Code review requires multiple specialized perspectives. Agents provide deep analysis without overwhelming main context.

**Token efficiency**: Main context only sees orchestration; detailed analysis in agent contexts.

### Example 4: SDD (Balanced)

```
sdd/
├── commands/
│   ├── 00-setup.md      # Workflow steps
│   ├── 01-specify.md
│   ├── 02-plan.md
│   ├── 03-tasks.md
│   ├── 04-implement.md
│   └── 05-document.md
├── agents/
│   ├── code-architect.md   # Specialized planning
│   ├── code-explorer.md    # Codebase navigation
│   └── code-reviewer.md    # Implementation review
└── skills/
    └── (none)
```

**Design rationale**: Structured workflow with explicit steps (commands) and specialized analysis (agents). No continuous skills needed.

**Usage pattern**: Sequential command invocation, each delegating to appropriate agents.

## Interaction Patterns

### Pattern 1: Simple Command

```bash
> /git:commit
```

**Flow**:
1. User invokes command
2. Command prompt loads into context
3. Claude executes command logic
4. Output generated
5. Command prompt removed from context

**Token lifecycle**: Temporary, only during execution

### Pattern 2: Command with Memory

```bash
> /reflexion:memorize
```

**Flow**:
1. User invokes command
2. Command prompt loads
3. Claude analyzes conversation history
4. Updates CLAUDE.md file (persistent memory)
5. Command prompt removed

**Token lifecycle**: Command temporary, memory persists in CLAUDE.md

### Pattern 3: Command with Agents

```bash
> /code-review:review-pr
```

**Flow**:
1. User invokes command
2. Command prompt loads
3. Command spawns multiple agents:
   - bug-hunter
   - security-auditor
   - test-coverage-reviewer
   - code-quality-reviewer
   - contracts-reviewer
   - historical-context-reviewer
4. Each agent analyzes in parallel (fresh context)
5. Results aggregated
6. Comprehensive review generated
7. Command prompt removed, agent contexts discarded

**Token lifecycle**: Command temporary, agents use separate budgets

### Pattern 4: Workflow Sequence

```bash
> /sdd:01-specify
> /sdd:02-plan
> /sdd:03-tasks
> /sdd:04-implement
> /sdd:05-document
```

**Flow**:
1. Each command invoked sequentially
2. Commands read/write to shared state (files)
3. Each command loads, executes, unloads
4. Agents spawned as needed per command
5. Progress persisted in files

**Token lifecycle**: Only current command in context, state in files

### Pattern 5: Skill-Guided Development

```
(User installs TDD plugin with test-driven-development skill)

> claude "add user authentication"
```

**Flow**:
1. TDD skill loaded in context (from plugin installation)
2. User provides feature request
3. Skill guides Claude to:
   - Start with test cases
   - Implement to pass tests
   - Refactor with test safety net
4. Skill remains active throughout

**Token lifecycle**: Skill always present, guides implicitly

## Token Budget Management

Understanding token usage helps optimize plugin selection.

### Context Window

Claude Code's context window: ~200,000 tokens

**Allocation**:
- System prompt: ~5,000 tokens
- Conversation history: varies (10,000-100,000 tokens)
- Installed plugins: 500-5,000 tokens
- Active commands: 300-800 tokens per command
- Working files: varies

### Plugin Token Costs

Approximate costs per plugin type:

| Plugin Type | Token Cost | Example |
|-------------|-----------|---------|
| Command-only | 100-300 | reflexion, git |
| Skill-only | 500-1500 | tdd, ddd |
| Agent-based | 200-500 | code-review, sdd |
| Mixed | 1000-3000 | customaize-agent |

### Budget Strategy

**Conservative** (tight token budget):
- Install 2-3 command-heavy plugins
- Avoid skill-heavy plugins unless critical
- Use agents for complex tasks (offload from main context)

**Moderate** (typical usage):
- Install 5-7 plugins (mix of commands and skills)
- 1-2 skill-heavy plugins for core practices
- Several command-only plugins for utilities

**Aggressive** (ample budget):
- Install 10+ plugins
- Multiple skill-heavy plugins
- Full toolset available

### Monitoring Token Usage

Track your usage:

```bash
# Check installed plugins
/plugin list

# Check active skills
/skills list

# Estimate token usage
# - Count installed plugins
# - Multiply by average cost
# - Add conversation history
```

## Extension and Customization

### Creating New Plugins

CEK's architecture supports custom plugins:

1. **Create plugin structure**:
   ```
   my-plugin/
   ├── .claude-plugin/
   │   └── plugin.json
   └── commands/
       └── my-command.md
   ```

2. **Define metadata**:
   ```json
   {
     "name": "my-plugin",
     "version": "1.0.0",
     "description": "My custom plugin",
     "author": {...}
   }
   ```

3. **Add to marketplace** (for sharing):
   - Fork context-engineering-kit
   - Add plugin to plugins/
   - Update .claude-plugin/marketplace.json
   - Submit pull request

### Extending Existing Plugins

Customize plugins for your needs:

1. **Fork the repository**
2. **Modify plugin components**:
   - Edit command prompts
   - Add new commands
   - Customize agent specializations
3. **Test changes**
4. **Use your fork** as marketplace:
   ```bash
   /plugin marketplace add YOUR-USERNAME/context-engineering-kit
   ```

## Best Practices

### Plugin Selection

Choose plugins based on:
1. **Frequency of use** - High-frequency → commands, continuous → skills
2. **Token budget** - Limited → command-heavy, ample → include skills
3. **Task complexity** - Simple → commands, complex → agents
4. **Team workflow** - Align with existing processes

### Plugin Combination

Effective combinations:

**Quality-Focused Development**:
- reflexion (refinement)
- code-review (multi-perspective analysis)
- tdd (test-first approach)

**Workflow Automation**:
- sdd (structured development)
- git (version control)
- docs (documentation updates)

**Code Quality**:
- ddd (architecture and design)
- tdd (testing discipline)
- code-review (quality gates)

### Performance Optimization

Optimize token usage:

1. **Start minimal** - Install one plugin, assess value
2. **Add incrementally** - Install plugins as needs arise
3. **Remove unused** - Uninstall plugins not providing value
4. **Prefer commands** - Use command-based plugins when possible
5. **Leverage agents** - Offload complex tasks to agent contexts

## Architecture Benefits

The CEK architecture delivers:

### 1. Efficiency
- Minimal token overhead
- On-demand loading
- Parallel agent execution

### 2. Flexibility
- Mix and match plugins
- Custom workflows
- Extensible design

### 3. Simplicity
- Clear component roles
- Predictable behavior
- Easy to understand

### 4. Scalability
- Add plugins without degradation
- Agent-based parallelization
- Modular growth

### 5. Maintainability
- Isolated components
- Clear boundaries
- Independent updates

## Next Steps

Now that you understand the architecture:

- **[Scientific Basis](./scientific-basis.md)** - Learn about the research behind the design
- **[Getting Started](../getting-started.md)** - Install your first plugin
- **[Plugin Catalog](../plugins/)** - Explore available plugins
- **[Guides](../guides/)** - Optimize your plugin usage

## Further Reading

For deeper technical details:

- **[Reference Documentation](../reference/)** - Technical specifications for commands, skills, and agents
- **[Plugin Manifest](../reference/plugin-manifest.md)** - Plugin structure and configuration
- **[Marketplace API](../reference/marketplace-api.md)** - Marketplace integration details

---

**CEK's architecture balances power and efficiency, giving you sophisticated capabilities without sacrificing context window.**
