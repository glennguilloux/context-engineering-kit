# SDD (Specification Driven Development) Plugin

A comprehensive workflow for specification-driven feature development with specialized agents and systematic documentation. Based on GitHub Spec Kit and OpenSpec standards.

## Overview

The SDD Plugin provides a systematic 6-stage approach to building features through specification-driven development. Instead of jumping straight into code, it guides you through creating detailed specifications, understanding the codebase, planning architecture, implementing with clear tasks, and maintaining comprehensive documentation—resulting in well-designed features that integrate seamlessly with your existing code and follow industry standards.

## Philosophy

Specification Driven Development (SDD) ensures quality and consistency by following a documentation-first approach. Key principles:

- **Specify first** - Create detailed specifications before writing code
- **Understand context** - Research the codebase and domain thoroughly
- **Plan systematically** - Design architecture and break down into clear tasks
- **Document continuously** - Maintain living documentation alongside implementation
- **Quality gates** - Validate at each stage before proceeding

This plugin embeds these practices into a structured workflow using specialized agents and industry-standard templates.

## Quick Start

Here's a complete workflow example to get started with SDD:

```bash
# start claude code
claude 

# setup project constitution (run once per project)
/sdd:00-setup Use NestJS as backend framework, strictly follow SOLID principles and Clean Architecture.

# Generate new feature specification
/sdd:01-specify Add user authentication with OAuth

# Plan feature development
/sdd:02-plan 

# Create detailed implementation tasks
/sdd:03-tasks 

# Execute feature implementation
/sdd:04-implement 

# Document completed feature implementation
/sdd:05-document Focus on API documentation
```

Each command builds on the previous one, creating a complete specification-driven development workflow from idea to documented implementation.

## Commands

The SDD plugin provides multiple commands for different stages of the specification-driven development workflow:

### Core SDD Workflow Commands

- **`/sdd:00-setup [project-params]`** - Create or update project constitution and templates
- **`/sdd:01-specify [feature-description]`** - Create detailed feature specification
- **`/sdd:02-plan [plan-specifics]`** - Plan feature development with architecture and research
- **`/sdd:03-tasks [task-guidance]`** - Generate actionable, dependency-ordered tasks
- **`/sdd:04-implement [implementation-prefs]`** - Execute implementation with quality review
- **`/sdd:05-document [documentation-focus]`** - Document completed feature

### Additional Commands

- **`/sdd:brainstorm [initial-concept]`** - Refine rough ideas into fully-formed designs through collaborative questioning

**Usage Examples:**

```bash
/sdd:01-specify Add user authentication with OAuth2
/sdd:02-plan Focus on security and scalability
/sdd:03-tasks Prioritize MVP features first
/sdd:04-implement Use test-driven development
/sdd:05-document Focus on API documentation
```

Each command guides you through its specific stage with specialized agents and quality gates.

## The SDD Workflow

The SDD plugin implements a systematic 6-stage workflow based on GitHub Spec Kit standards:

### Stage 0: Setup (`/sdd:00-setup`)

**Goal**: Establish project constitution and templates

**What happens:**

- Creates or updates `specs/constitution.md` with project principles and governance
- Downloads and customizes templates from GitHub Spec Kit:
  - Plan template
  - Specification template
  - Tasks template
  - Spec checklist
- Ensures consistency across all project specifications
- Validates constitution against existing project patterns

**Example:**

```bash
/sdd:00-setup Add observability principle and testing standards
```

### Stage 1: Specification (`/sdd:01-specify`)

**Goal**: Create detailed feature specifications from natural language descriptions

**What happens:**

- Launches `business-analyst` agent to transform requirements into precise specifications
- Creates feature branch and spec directory (`specs/XXX-feature-name/`)
- Generates comprehensive specification using industry-standard template
- Validates specification quality with checklist
- Resolves ambiguities through structured clarification questions (max 3)
- Produces testable acceptance criteria and success metrics

**Example:**

```bash
/sdd:01-specify Add user authentication with OAuth2 support
```

**Output:**

- `specs/001-user-auth/spec.md` - Complete feature specification
- `specs/001-user-auth/spec-checklist.md` - Quality validation results

### Stage 2: Planning (`/sdd:02-plan`)

**Goal**: Research, explore codebase, and design architecture

**What happens:**

- Launches `researcher` agent for unknown technologies and dependencies
- Launches `code-explorer` agents to analyze existing codebase patterns
- Identifies similar features and architectural decisions
- Resolves clarifying questions about implementation approach
- Launches `software-architect` agents with different focus areas:
  - Minimal changes approach
  - Clean architecture approach
  - Pragmatic balance approach
- Presents architecture comparison with trade-offs and recommendations
- Creates implementation blueprint with specific files and components

**Example:**

```bash
/sdd:02-plan Focus on security and integration with existing auth system
```

**Output:**

- `specs/001-user-auth/research.md` - Technology and codebase research
- `specs/001-user-auth/design.minimal.md` - Minimal changes approach
- `specs/001-user-auth/design.clean.md` - Clean architecture approach
- `specs/001-user-auth/design.pragmatic.md` - Balanced approach
- `specs/001-user-auth/design.md` - Final chosen design
- `specs/001-user-auth/plan.md` - Complete implementation plan
- `specs/001-user-auth/data-model.md` - Entity definitions
- `specs/001-user-auth/contract.md` - API specifications

### Stage 3: Task Breakdown (`/sdd:03-tasks`)

**Goal**: Generate actionable, dependency-ordered implementation tasks

**What happens:**

- Launches `tech-lead` agent to break down specifications into concrete tasks
- Creates dependency-ordered task list with complexity analysis
- Organizes tasks by user story for independent implementation
- Defines clear acceptance criteria and completion checkboxes
- Identifies parallel execution opportunities
- Provides implementation strategy (top-to-bottom vs bottom-to-top)
- Flags high-risk tasks requiring decomposition or clarification

**Example:**

```bash
/sdd:03-tasks Prioritize MVP features and use TDD approach
```

**Output:**

- `specs/001-user-auth/tasks.md` - Complete task breakdown with dependencies

### Stage 4: Implementation (`/sdd:04-implement`)

**Goal**: Execute implementation plan with quality gates

**What happens:**

- Launches `developer` agents to implement tasks phase by phase
- Follows strict task execution order and dependencies
- Uses Test-Driven Development approach
- Tracks progress by marking completed tasks in `tasks.md`
- Validates each phase completion before proceeding
- Performs automated quality review using multiple code review agents:
  - Simplicity/DRY/Elegance review
  - Bugs/Correctness review  
  - Project conventions review
- Presents findings and asks for resolution decisions

**Example:**

```bash
/sdd:04-implement Focus on test coverage and follow existing patterns
```

### Stage 5: Documentation (`/sdd:05-document`)

**Goal**: Document completed implementation

**What happens:**

- Launches `tech-writer` agent to create comprehensive documentation
- Verifies all tasks are completed successfully
- Updates project documentation with:
  - API guides and usage examples
  - Architecture documentation
  - Integration instructions
  - Troubleshooting guides
- Updates README files for affected modules
- Maintains documentation standards and consistency

**Example:**

```bash
/sdd:05-document Focus on API documentation and integration examples
```

**Output:**

- Updated documentation in `docs/` directory
- Module-specific README updates
- API reference and usage guides

## Specialized Agents

The SDD plugin uses 7 specialized agents, each designed for specific aspects of the development workflow:

### `business-analyst`

**Purpose**: Transforms vague business needs into precise, actionable requirements

**Focus areas:**

- Requirements discovery and stakeholder analysis
- Competitive research and market intelligence  
- Specification quality assurance
- Acceptance criteria definition

**When triggered:**

- Automatically in Stage 1 (Specification)
- Used for specification validation and quality checks

**Output:**

- Complete feature specifications with acceptance criteria
- Business context and success metrics
- Stakeholder analysis and constraints
- Quality validation results

### `code-explorer`

**Purpose**: Deeply analyzes existing codebase features by tracing execution paths

**Focus areas:**

- Entry points and call chains
- Data flow and transformations
- Architecture layers and patterns
- Dependencies and integrations
- Implementation details

**When triggered:**

- Automatically in Stage 2 (Planning)
- Can be launched manually for codebase exploration

**Output:**

- Entry points with file:line references
- Step-by-step execution flow
- Key components and responsibilities
- Architecture insights
- List of essential files to read

### `researcher`

**Purpose**: Investigates unknown technologies, libraries, frameworks, and dependencies

**Focus areas:**

- Technology and framework research
- Library compatibility analysis
- Best practices discovery
- Performance and security considerations

**When triggered:**

- Automatically in Stage 2 (Planning) for unknowns
- Can be launched manually for technical research

**Output:**

- Technology comparison and recommendations
- Implementation guides and examples
- Integration points and constraints
- Security and performance considerations

### `software-architect`

**Purpose**: Designs feature architectures by analyzing existing patterns and creating implementation blueprints

**Focus areas:**

- Codebase pattern analysis
- Architecture design with multiple approaches
- Component design and interfaces
- Implementation roadmaps and build sequences

**When triggered:**

- Automatically in Stage 2 (Planning)
- Multiple agents launched with different focus areas

**Output:**

- Patterns and conventions analysis
- Multiple architecture approaches with trade-offs
- Complete component design
- Implementation blueprints with specific files
- Data flow and integration points

### `tech-lead`

**Purpose**: Breaks specifications into technical tasks using agile, TDD and kaizen principles

**Focus areas:**

- Task decomposition and dependency mapping
- Implementation strategy selection
- Risk assessment and complexity analysis
- Agile sprint planning integration

**When triggered:**

- Automatically in Stage 3 (Tasks)
- Can be launched manually for task planning

**Output:**

- Dependency-ordered task lists
- Complexity and uncertainty ratings
- Parallel execution opportunities
- Implementation strategy recommendations

### `developer`

**Purpose**: Executes implementation tasks with strict adherence to acceptance criteria

**Focus areas:**

- Test-driven development implementation
- Codebase pattern reuse
- Quality assurance and validation
- Progress tracking and error handling

**When triggered:**

- Automatically in Stage 4 (Implementation)
- Multiple agents for different implementation phases

**Output:**

- Working, tested code implementations
- Progress reports and completion status
- Quality validation results
- Error handling and debugging guidance

### `tech-writer`

**Purpose**: Creates and maintains comprehensive technical documentation

**Focus areas:**

- API documentation and usage guides
- Architecture documentation updates
- Integration instructions and examples
- Documentation standards compliance

**When triggered:**

- Automatically in Stage 5 (Documentation)
- Can be launched manually for documentation tasks

**Output:**

- Updated project documentation
- API reference guides
- Integration and troubleshooting documentation
- README updates for affected modules

## Usage Patterns

### Complete SDD workflow (recommended for new features)

Run the full specification-driven development process:

```bash
# 1. Set up project constitution and templates (run once per project)
/sdd:00-setup Add security and performance principles

# 2. Create detailed specification
/sdd:01-specify Add rate limiting to API endpoints with Redis backend

# 3. Plan architecture and research
/sdd:02-plan Focus on scalability and existing middleware patterns

# 4. Generate implementation tasks
/sdd:03-tasks Use TDD approach and prioritize MVP features

# 5. Execute implementation
/sdd:04-implement Focus on test coverage and error handling

# 6. Document the feature
/sdd:05-document Include API examples and troubleshooting guide
```

### Partial workflows for specific needs

**Start with brainstorming unclear ideas:**

```bash
/sdd:brainstorm User wants better search functionality but unclear requirements
```

**Jump into planning with existing specification:**

```bash
/sdd:02-plan Focus on performance optimization and caching strategy
```

**Generate tasks from existing plan:**

```bash
/sdd:03-tasks Break down complex user stories into smaller tasks
```

### Manual agent invocation

You can also launch agents manually for specific needs:

**Business analysis:**

```text
Launch business-analyst to refine requirements for user management feature
```

**Codebase exploration:**

```text
Launch code-explorer to trace how authentication works in this project
```

**Research:**

```text
Launch researcher to investigate Redis vs Memcached for caching
```

**Architecture design:**

```text
Launch software-architect to design the API rate limiting architecture
```

**Task planning:**

```text
Launch tech-lead to break down the payment integration story
```

**Implementation:**

```text
Launch developer to implement user registration with OAuth
```

**Documentation:**

```text
Launch tech-writer to document the new API endpoints
```

## Best Practices

### SDD Workflow Guidelines

1. **Start with setup**: Run `/sdd:00-setup` once per project to establish constitution and templates
2. **Be specific in specifications**: Detailed feature descriptions lead to better specifications and fewer clarification rounds
3. **Trust the quality gates**: Each stage validates the previous one—don't skip validation steps
4. **Answer clarifying questions thoroughly**: Specification stage limits questions to 3 most critical ones
5. **Review architecture options carefully**: Planning stage provides multiple approaches with trade-offs
6. **Follow task dependencies**: Implementation stage respects task order and dependencies for a reason
7. **Maintain living documentation**: Documentation stage keeps specs and docs synchronized

### Working with Agents

1. **Let agents complete their analysis**: Each agent provides valuable insights about your codebase
2. **Read suggested files**: Agents identify key files—read them to build comprehensive context
3. **Use agents for learning**: Exploration agents teach you about your own codebase patterns
4. **Provide context when launching manually**: Give agents specific goals and constraints

### Quality and Consistency

1. **Follow the constitution**: Project principles guide all decisions and implementations
2. **Use specifications as contracts**: Generated specs become the source of truth for implementation
3. **Validate at each stage**: Quality checklists prevent issues from propagating forward  
4. **Test-driven approach**: Tasks and implementation emphasize testing throughout

## When to Use This Plugin

**Use SDD workflow for:**

- New features requiring multiple files or components
- Features with unclear or evolving requirements
- Complex integrations with existing systems
- Features needing comprehensive documentation
- Projects requiring specification-driven development
- Features where multiple team members will work

**Use individual commands for:**

- `/sdd:brainstorm`: Refining vague or unclear ideas
- `/sdd:02-plan`: Architecture design for existing specs
- `/sdd:03-tasks`: Breaking down complex user stories
- Manual agent invocation: Specific analysis or design tasks

**Don't use for:**

- Single-line bug fixes or trivial changes
- Well-defined, simple tasks with clear implementation
- Urgent hotfixes requiring immediate action
- Purely cosmetic or styling changes

## Requirements

- Claude with access to SDD plugin
- Git repository for tracking specs and implementation
- Project structure supporting `specs/` directory
- Existing codebase (workflow learns from existing patterns)

## Troubleshooting

### Agents take too long

**Issue**: Research, exploration, or architecture agents are slow

**Solution**:

- This is normal for large codebases—agents perform comprehensive analysis
- Agents run in parallel when possible to optimize time
- The thoroughness pays off in better understanding and fewer rework cycles
- Consider breaking down very large features into smaller specifications

### Too many clarification questions

**Issue**: Specification stage asks too many questions

**Solution**:

- Be more specific and detailed in your initial feature description
- Include context about constraints, existing systems, and user needs upfront
- Provide business goals and success criteria in the initial request
- The system limits to 3 questions max—all are critical for quality specs

### Specification quality issues

**Issue**: Generated specifications fail quality checklist

**Solution**:

- The system automatically iterates to fix quality issues (max 3 attempts)
- Business analyst agent addresses specific failing criteria
- If issues persist, they're documented with explanations for manual review
- Consider providing more detailed requirements in the initial request

### Task complexity overwhelming

**Issue**: Generated tasks are too complex or numerous

**Solution**:

- Tech-lead agent identifies high-risk tasks and asks about decomposition
- Accept the decomposition offer for complex tasks
- Focus on MVP scope first—implement incrementally
- Use parallel task execution opportunities to reduce overall timeline

### Implementation failures

**Issue**: Developer agents can't complete tasks successfully

**Solution**:

- Implementation follows strict acceptance criteria—failures indicate unclear specs
- Review the specification and planning artifacts for missing information
- Use `/sdd:02-plan` to revise architecture if needed
- Consider breaking tasks down further or clarifying requirements

## Tips

### Getting Better Results

- **Provide context upfront**: Include business goals, user needs, and technical constraints in command arguments
- **Use the full workflow**: Each stage builds on the previous—skipping stages reduces quality
- **Review generated artifacts**: Specs, plans, and tasks contain valuable insights and decisions
- **Trust the process**: Quality gates prevent common issues from reaching implementation
- **Keep specs updated**: Update specifications when requirements change

### Working with Large Features

- **Start with MVP**: Focus on core functionality first, add enhancements in separate SDD cycles
- **Break into logical boundaries**: Separate features by user stories or system boundaries
- **Use constitution principles**: Let project constitution guide complexity and quality decisions

### Team Collaboration

- **Share specifications**: Generated specs serve as communication artifacts for team members
- **Document decisions**: Architecture and planning documents capture reasoning for future reference
- **Use task lists**: Generated tasks can be distributed among team members
- **Maintain documentation**: Living documentation stays synchronized with implementation
