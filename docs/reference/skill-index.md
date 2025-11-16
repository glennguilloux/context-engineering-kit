# Skill Index

Complete index of all skills available across Context Engineering Kit plugins. Skills are automatically loaded prompts that enhance Claude's behavior in specific contexts.

## Table of Contents

- [What Are Skills?](#what-are-skills)
- [All Skills](#all-skills)
- [Skills by Plugin](#skills-by-plugin)
- [Skills by Type](#skills-by-type)
- [How Skills Work](#how-skills-work)

## What Are Skills?

Skills are specialized prompts that are automatically loaded into Claude's context when a plugin is installed. Unlike commands that you invoke explicitly, skills work passively to enhance Claude's behavior and decision-making in specific areas.

### Key Characteristics

- **Automatic Application**: Skills are applied without explicit invocation
- **Context Enhancement**: They provide domain knowledge and best practices
- **Token-Efficient**: Carefully crafted to minimize context usage
- **Specialized Knowledge**: Each skill focuses on a specific domain or technique

### Skill vs. Command

| Feature | Skills | Commands |
|---------|--------|----------|
| **Invocation** | Automatic | Explicit (`/plugin:command`) |
| **Purpose** | Enhance behavior | Perform specific actions |
| **Visibility** | Background | Foreground |
| **Context** | Always loaded | Invoked when needed |

## All Skills

| Skill | Plugin | Description | Type |
|-------|--------|-------------|------|
| `kaizen` | kaizen | Continuous improvement methodology with multiple analysis techniques | Methodology |
| `prompt-engineering` | customaize-agent | Well known prompt engineering techniques and patterns, includes Anthropic Best Practices and Agent Persuasion Principles | Development |
| `software-architecture` | ddd | Includes Clean Architecture, SOLID principles, and other design patterns | Architecture |
| `subagent-driven-development` | sadd | Dispatches fresh subagent for each task with code review between tasks, enabling fast iteration with quality gates | Development |
| `test-driven-development` | tdd | Introduces TDD methodology, best practices, and skills for testing using subagents | Development |

## Skills by Plugin

### Test-Driven Development (TDD)

**Plugin:** `tdd`
**Install:** `/plugin install tdd@NeoLabHQ/context-engineering-kit`

#### test-driven-development

Introduces TDD methodology, best practices, and skills for testing using subagents.

**What It Provides:**
- TDD cycle knowledge (Red-Green-Refactor)
- Best practices for writing tests first
- Common anti-patterns to avoid
- Testing strategies for different scenarios
- Integration with subagent workflows

**When It's Applied:**
- When writing or modifying code
- During test creation and execution
- When discussing testing strategies
- In code review contexts

**Key Principles:**
- Write failing tests before implementation
- Keep tests simple and focused
- Test behavior, not implementation
- Use descriptive test names
- Maintain fast test execution

### Subagent-Driven Development (SADD)

**Plugin:** `sadd`
**Install:** `/plugin install sadd@NeoLabHQ/context-engineering-kit`

#### subagent-driven-development

Dispatches fresh subagent for each task with code review between tasks, enabling fast iteration with quality gates.

**What It Provides:**
- Subagent orchestration patterns
- Task delegation strategies
- Code review integration between tasks
- Quality gate implementation
- Iteration and feedback loops

**When It's Applied:**
- When breaking down complex tasks
- During multi-step implementations
- When quality gates are needed
- In collaborative agent workflows

**Key Principles:**
- Each task gets a fresh subagent context
- Mandatory review between task transitions
- Clear task boundaries and interfaces
- Quality verification at each step
- Fast iteration with safety

### Domain-Driven Development (DDD)

**Plugin:** `ddd`
**Install:** `/plugin install ddd@NeoLabHQ/context-engineering-kit`

#### software-architecture

Includes Clean Architecture, SOLID principles, and other design patterns.

**What It Provides:**
- Clean Architecture principles
- SOLID design principles
- Domain-Driven Design patterns
- Separation of concerns
- Dependency management patterns

**When It's Applied:**
- When designing system architecture
- During code structure decisions
- When refactoring code
- In architectural discussions

**Key Principles:**

**SOLID:**
- **S**ingle Responsibility Principle
- **O**pen/Closed Principle
- **L**iskov Substitution Principle
- **I**nterface Segregation Principle
- **D**ependency Inversion Principle

**Clean Architecture:**
- Independent of frameworks
- Testable business logic
- Independent of UI
- Independent of database
- Independent of external agencies

### Kaizen

**Plugin:** `kaizen`
**Install:** `/plugin install kaizen@NeoLabHQ/context-engineering-kit`

#### kaizen

Continuous improvement methodology with multiple analysis techniques.

**What It Provides:**
- Japanese continuous improvement philosophy
- Root cause analysis techniques
- Problem-solving frameworks
- Lean development practices
- Systematic improvement methods

**When It's Applied:**
- When analyzing problems or issues
- During improvement planning
- When investigating bugs or inefficiencies
- In retrospective contexts

**Key Techniques:**
- Five Whys analysis
- Fishbone (Cause and Effect) diagrams
- A3 problem solving
- PDCA (Plan-Do-Check-Act) cycles
- Gemba walks
- Value stream mapping
- Muda (waste) identification

**Key Principles:**
- Continuous incremental improvement
- Respect for people and processes
- Data-driven decision making
- Root cause focus (not symptoms)
- Systematic problem solving

### Customaize Agent

**Plugin:** `customaize-agent`
**Install:** `/plugin install customaize-agent@NeoLabHQ/context-engineering-kit`

#### prompt-engineering

Well known prompt engineering techniques and patterns, includes Anthropic Best Practices and Agent Persuasion Principles.

**What It Provides:**
- Anthropic's official best practices
- Agent Persuasion Principles from research
- Prompt structure patterns
- Context optimization techniques
- Subagent instruction patterns

**When It's Applied:**
- When creating commands or skills
- During prompt refinement
- When designing subagent workflows
- In custom extension development

**Key Techniques:**
- Clear instruction structure
- Role assignment patterns
- Chain-of-thought prompting
- Few-shot examples
- Context window optimization
- Agent persuasion strategies

**Key Principles:**
- Clarity over cleverness
- Explicit over implicit
- Test-driven prompt development
- Iterative refinement
- Audience-appropriate language

## Skills by Type

### Development Methodology Skills

Skills that introduce development practices and workflows.

| Skill | Plugin | Focus Area |
|-------|--------|------------|
| `test-driven-development` | tdd | Testing-first development approach |
| `subagent-driven-development` | sadd | Multi-agent task orchestration |
| `kaizen` | kaizen | Continuous improvement practices |

### Architecture & Design Skills

Skills that provide architectural guidance and design principles.

| Skill | Plugin | Focus Area |
|-------|--------|------------|
| `software-architecture` | ddd | Clean Architecture, SOLID, DDD patterns |

### Prompt & Agent Skills

Skills for creating and optimizing prompts and agent behaviors.

| Skill | Plugin | Focus Area |
|-------|--------|------------|
| `prompt-engineering` | customaize-agent | Prompt creation and optimization |

## How Skills Work

### Loading Mechanism

When you install a plugin with skills:

1. Plugin is installed via marketplace command
2. Skills are loaded into Claude's context
3. Skills remain active for all subsequent interactions
4. Skills are applied automatically based on context

### Context Integration

Skills integrate seamlessly with Claude's existing knowledge:

```
[Claude Base Knowledge]
    ↓
[Installed Skills]
    ↓
[Your Project Context]
    ↓
[Current Task]
```

### Skill Activation

Skills are context-aware and activate based on:

- **Task Type**: Different skills for different activities
- **Keywords**: Certain terms trigger skill application
- **Project Context**: Detected technology stack
- **User Intent**: Inferred goals from conversation

### Example: TDD Skill in Action

When TDD skill is installed:

**Without TDD Skill:**
```
User: Add a function to calculate total price
Claude: *creates implementation directly*
```

**With TDD Skill:**
```
User: Add a function to calculate total price
Claude: Let's write a test first:
- Test: calculateTotal should sum item prices
- Test: calculateTotal should apply discount
- Then implement the function to pass tests
```

## Skill Interaction

### Multiple Skills

When multiple skills are installed, they work together:

```bash
# Install complementary skills
/plugin install tdd@NeoLabHQ/context-engineering-kit
/plugin install sadd@NeoLabHQ/context-engineering-kit
/plugin install ddd@NeoLabHQ/context-engineering-kit
```

Result: Claude applies TDD approach, uses subagents for tasks, and follows SOLID principles simultaneously.

### Skill Priority

When skills overlap, they complement rather than conflict:

- More specific guidance takes precedence
- General principles apply broadly
- Context determines which skill aspects activate

## Best Practices for Using Skills

### Installation Strategy

**Recommended:**
- Start with one or two core skills
- Add skills as you need specific capabilities
- Install complementary skills for workflows

**Avoid:**
- Installing all skills without need
- Redundant skills that overlap too much
- Skills irrelevant to your project type

### Monitoring Skill Impact

Notice skill effects in Claude's responses:

- **TDD Skill**: Suggests writing tests first
- **Architecture Skill**: Mentions SOLID principles
- **Kaizen Skill**: Proposes root cause analysis
- **Prompt Engineering Skill**: Structures responses clearly

### Skill Verification

To verify a skill is working:

1. Note behavior before installation
2. Install the plugin with the skill
3. Observe changes in Claude's approach
4. Check for skill-specific patterns or suggestions

## Token Efficiency

Skills are designed for minimal token usage:

- **Concise Principles**: Core concepts, not full explanations
- **Trigger-Based**: Applied only when relevant
- **Complementary**: Work with Claude's base knowledge
- **Optimized Wording**: Maximum impact, minimum tokens

Typical skill size: 200-500 tokens

## Skill Development

Want to create your own skills? See:

- [Customaize Agent Plugin](./command-index.md#customaize-agent)
- `/customaize-agent:create-skill` command
- `/customaize-agent:test-skill` command
- `/customaize-agent:apply-anthropic-skill-best-practices` command

## Disabling Skills

Skills are tied to plugin installation:

- **Keep Skill**: Keep plugin installed
- **Remove Skill**: Uninstall the plugin

Skills cannot be disabled individually while keeping the plugin active.

## Skill Updates

Skills update when you update the plugin:

```bash
# Update plugin to get latest skill improvements
/plugin marketplace update NeoLabHQ/context-engineering-kit
/plugin update plugin-name@NeoLabHQ/context-engineering-kit
```

## See Also

**Reference:**
- [Command Index](./command-index.md) - Explicit commands to invoke
- [Agent Index](./agent-index.md) - Specialized agents used by plugins
- [Plugin Manifest](./plugin-manifest.md) - Plugin structure including skills
- [Marketplace API](./marketplace-api.md) - Managing skill-containing plugins

**Guides:**
- [Choosing Plugins](../guides/choosing-plugins.md) - Understanding skill impact on token usage
- [Optimization](../guides/optimization.md) - Managing skill token costs

**Concepts:**
- [Token Efficiency](../concepts/token-efficiency.md) - Skills vs commands trade-offs
