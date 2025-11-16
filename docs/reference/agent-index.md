# Agent Index

Complete catalog of all specialized agents available across Context Engineering Kit plugins. Agents are sub-instances of Claude with focused capabilities and specialized knowledge.

## Table of Contents

- [What Are Agents?](#what-are-agents)
- [All Agents](#all-agents)
- [Agents by Plugin](#agents-by-plugin)
- [Agents by Type](#agents-by-type)
- [How Agents Work](#how-agents-work)

## What Are Agents?

Agents are specialized sub-instances of Claude that are invoked by commands to perform focused tasks. Each agent has:

- **Specialized Knowledge**: Expertise in a specific domain
- **Focused Capabilities**: Limited scope for optimal performance
- **Clear Responsibilities**: Well-defined role and purpose
- **Fresh Context**: Clean slate for unbiased analysis

### Agent vs. Skill vs. Command

| Feature | Agents | Skills | Commands |
|---------|--------|--------|----------|
| **Invocation** | By commands | Automatic | Explicit |
| **Purpose** | Specialized analysis | Enhance behavior | Perform actions |
| **Context** | Fresh instance | Always loaded | Current context |
| **Scope** | Narrow focus | Broad enhancement | Specific task |

## All Agents

| Agent | Plugin | Role | Specialization |
|-------|--------|------|----------------|
| `bug-hunter` | code-review | Reviewer | Identifies potential bugs, edge cases, and error-prone patterns |
| `code-architect` | sdd | Architect | Designs system architecture and technical solutions |
| `code-explorer` | sdd | Explorer | Navigates and understands existing codebase structure |
| `code-quality-reviewer` | code-review | Reviewer | Evaluates code structure, readability, and maintainability |
| `code-reviewer` | sdd | Reviewer | Reviews implementations against specifications and quality standards |
| `contracts-reviewer` | code-review | Reviewer | Reviews interfaces, API contracts, and data models |
| `historical-context-reviewer` | code-review | Reviewer | Analyzes changes in relation to codebase history and patterns |
| `security-auditor` | code-review | Auditor | Identifies security vulnerabilities and potential attack vectors |
| `test-coverage-reviewer` | code-review | Reviewer | Evaluates test coverage and suggests missing test cases |

## Agents by Plugin

### Code Review

**Plugin:** `code-review`
**Install:** `/plugin install code-review@NeoLabHQ/context-engineering-kit`

The Code Review plugin uses multiple specialized agents for comprehensive code quality analysis. These agents work together to provide thorough reviews from different perspectives.

#### bug-hunter

**Role:** Bug Detection Specialist

**Responsibilities:**
- Identify potential bugs and defects
- Detect edge cases and boundary conditions
- Find error-prone patterns
- Spot race conditions and concurrency issues
- Identify null/undefined reference risks
- Detect off-by-one errors
- Find resource leak potential

**Analysis Focus:**
- Logic errors
- Error handling gaps
- Type mismatches
- Async/await issues
- Exception scenarios
- Data validation weaknesses

**Output:**
- List of potential bugs with severity
- Edge cases to consider
- Recommended fixes
- Testing suggestions

#### code-quality-reviewer

**Role:** Code Quality Analyst

**Responsibilities:**
- Evaluate code structure and organization
- Assess readability and maintainability
- Review naming conventions
- Check code complexity
- Identify code smells
- Evaluate documentation quality
- Check adherence to style guidelines

**Analysis Focus:**
- Code organization
- Function/method length and complexity
- Variable and function naming
- Code duplication
- Coupling and cohesion
- Comments and documentation
- Consistency with codebase patterns

**Output:**
- Quality metrics and observations
- Refactoring suggestions
- Readability improvements
- Maintainability recommendations

#### contracts-reviewer

**Role:** Interface & Contract Specialist

**Responsibilities:**
- Review API interfaces and contracts
- Validate data models and schemas
- Check type definitions
- Evaluate API design
- Review interface consistency
- Validate request/response structures
- Check contract compatibility

**Analysis Focus:**
- API endpoint design
- Request/response schemas
- Type definitions and interfaces
- Data model relationships
- Contract versioning
- Backward compatibility
- API documentation

**Output:**
- Contract issues and improvements
- Type safety recommendations
- API design suggestions
- Schema validation feedback

#### historical-context-reviewer

**Role:** Codebase History Analyst

**Responsibilities:**
- Analyze changes in historical context
- Identify pattern deviations
- Review consistency with existing code
- Detect architectural drift
- Evaluate change impact
- Check alignment with codebase evolution
- Identify potential regressions

**Analysis Focus:**
- Code pattern consistency
- Architectural alignment
- Historical change patterns
- Refactoring impact
- Technical debt introduction
- Evolution trajectory
- Legacy compatibility

**Output:**
- Context-aware recommendations
- Pattern alignment feedback
- Historical impact analysis
- Consistency suggestions

#### security-auditor

**Role:** Security Analysis Specialist

**Responsibilities:**
- Identify security vulnerabilities
- Detect potential attack vectors
- Review authentication and authorization
- Check input validation
- Identify injection risks
- Review cryptographic usage
- Detect sensitive data exposure

**Analysis Focus:**
- SQL/NoSQL injection risks
- XSS vulnerabilities
- CSRF protection
- Authentication flaws
- Authorization bypasses
- Insecure dependencies
- Data exposure risks
- Cryptographic weaknesses

**Output:**
- Security vulnerabilities with severity
- Attack vector descriptions
- Mitigation recommendations
- Security best practice violations

#### test-coverage-reviewer

**Role:** Test Coverage Analyst

**Responsibilities:**
- Evaluate test coverage completeness
- Identify untested code paths
- Suggest missing test cases
- Review test quality
- Check edge case coverage
- Evaluate test maintainability
- Assess test effectiveness

**Analysis Focus:**
- Code path coverage
- Edge case testing
- Error condition testing
- Integration test coverage
- Test quality and clarity
- Test maintainability
- Test performance

**Output:**
- Coverage gaps and priorities
- Missing test case suggestions
- Test improvement recommendations
- Coverage metrics and analysis

### Spec-Driven Development (SDD)

**Plugin:** `sdd`
**Install:** `/plugin install sdd@NeoLabHQ/context-engineering-kit`

The SDD plugin uses specialized agents for effective context management and quality review throughout the Spec-Driven Development workflow.

#### code-architect

**Role:** System Architecture Designer

**Responsibilities:**
- Design system architecture
- Create technical solutions
- Define component structures
- Plan data flows
- Design APIs and interfaces
- Establish architectural patterns
- Make technology choices

**Analysis Focus:**
- System design
- Component architecture
- Data modeling
- API design
- Integration patterns
- Scalability considerations
- Performance optimization

**Output:**
- Architecture designs
- Technical specifications
- Component diagrams
- API specifications
- Implementation plans

**Used By:**
- `/sdd:02-plan` - Planning feature architecture
- `/sdd:03-tasks` - Breaking down architectural tasks

#### code-explorer

**Role:** Codebase Navigation Specialist

**Responsibilities:**
- Navigate existing codebase
- Understand code structure
- Identify relevant modules
- Map dependencies
- Locate integration points
- Discover patterns and conventions
- Build mental model of codebase

**Analysis Focus:**
- File and directory structure
- Module organization
- Dependency relationships
- Existing patterns
- Code conventions
- Integration points
- Related functionality

**Output:**
- Codebase structure analysis
- Relevant module identification
- Pattern documentation
- Integration point mapping
- Convention guidelines

**Used By:**
- `/sdd:02-plan` - Understanding existing code
- `/sdd:04-implement` - Finding integration points

#### code-reviewer

**Role:** Implementation Quality Reviewer

**Responsibilities:**
- Review implementations against specs
- Verify quality standards
- Check specification compliance
- Evaluate implementation quality
- Validate testing approach
- Review documentation completeness
- Ensure best practices followed

**Analysis Focus:**
- Specification alignment
- Quality standard compliance
- Implementation correctness
- Test coverage adequacy
- Documentation quality
- Best practice adherence
- Code review feedback

**Output:**
- Review feedback and suggestions
- Specification compliance status
- Quality assessment
- Improvement recommendations
- Approval or revision requests

**Used By:**
- `/sdd:04-implement` - Quality gates between tasks

## Agents by Type

### Reviewer Agents

Agents that evaluate code, implementations, or specifications for quality and correctness.

| Agent | Plugin | Focus Area |
|-------|--------|------------|
| `bug-hunter` | code-review | Bug detection and edge cases |
| `code-quality-reviewer` | code-review | Code quality and maintainability |
| `code-reviewer` | sdd | Specification compliance |
| `contracts-reviewer` | code-review | API contracts and interfaces |
| `historical-context-reviewer` | code-review | Historical consistency |
| `test-coverage-reviewer` | code-review | Test coverage and quality |

### Auditor Agents

Agents that perform specialized security or compliance audits.

| Agent | Plugin | Focus Area |
|-------|--------|------------|
| `security-auditor` | code-review | Security vulnerabilities |

### Architect Agents

Agents that design systems and technical solutions.

| Agent | Plugin | Focus Area |
|-------|--------|------------|
| `code-architect` | sdd | System architecture and design |

### Explorer Agents

Agents that navigate and understand existing codebases.

| Agent | Plugin | Focus Area |
|-------|--------|------------|
| `code-explorer` | sdd | Codebase navigation and understanding |

## How Agents Work

### Agent Invocation

Agents are invoked by commands, not called directly by users:

```bash
# This command uses multiple reviewer agents
/code-review:review-local-changes

# Behind the scenes:
# → bug-hunter analyzes for bugs
# → code-quality-reviewer checks quality
# → security-auditor scans for vulnerabilities
# → test-coverage-reviewer evaluates tests
# → contracts-reviewer validates interfaces
# → historical-context-reviewer checks consistency
```

### Multi-Agent Orchestration

Commands often orchestrate multiple agents to provide comprehensive analysis:

**Sequential Analysis:**
```
Command → Agent 1 → Agent 2 → Agent 3 → Synthesized Result
```

**Parallel Analysis:**
```
         ┌─ Agent 1 ─┐
Command ─┼─ Agent 2 ─┼─ Synthesized Result
         └─ Agent 3 ─┘
```

**Debate Pattern:**
```
Command → Agent 1 ─┐
       → Agent 2 ─┼─ Debate → Consensus → Result
       → Agent 3 ─┘
```

### Fresh Context Advantage

Each agent starts with:
- Clean slate (no bias from previous analysis)
- Specialized focus (narrow domain expertise)
- Specific perspective (unique analytical lens)
- Fresh evaluation (uninfluenced by other agents)

This enables:
- Unbiased analysis
- Diverse perspectives
- Comprehensive coverage
- Specialized expertise

## Agent Collaboration Patterns

### Code Review Pattern (code-review plugin)

Multiple specialized reviewers analyze the same code:

1. **bug-hunter** identifies bugs and edge cases
2. **code-quality-reviewer** evaluates maintainability
3. **security-auditor** finds security issues
4. **contracts-reviewer** validates interfaces
5. **test-coverage-reviewer** checks test adequacy
6. **historical-context-reviewer** ensures consistency

Result: Comprehensive multi-perspective code review

### SDD Workflow Pattern (sdd plugin)

Agents support different workflow stages:

1. **Planning**: `code-architect` designs solution
2. **Understanding**: `code-explorer` maps codebase
3. **Implementation**: `code-reviewer` validates quality
4. **Iteration**: Cycle through agents as needed

Result: Quality-gated implementation workflow

## Agent Benefits

### Specialized Expertise

Each agent is an expert in its domain:
- Deep knowledge in narrow area
- Focused analytical capabilities
- Domain-specific patterns and practices
- Specialized detection algorithms

### Unbiased Analysis

Fresh context means:
- No preconceptions from previous analysis
- Independent evaluation
- Diverse perspectives
- Reduced groupthink

### Comprehensive Coverage

Multiple agents provide:
- Different analytical lenses
- Overlapping coverage areas
- Redundant critical checks
- Complete analysis surface

### Quality Assurance

Agent-based workflows enable:
- Systematic quality gates
- Consistent review standards
- Automated quality checks
- Predictable quality outcomes

## Agent Limitations

### Context Boundaries

Agents have:
- Limited context window
- Focused scope (by design)
- No access to full conversation history
- Fresh start for each invocation

### Communication Overhead

Multi-agent patterns require:
- Synthesis of multiple perspectives
- Potential for conflicting advice
- Need for orchestration logic
- Time for multiple analyses

### Specialization Trade-offs

Narrow focus means:
- May miss broader context
- Requires multiple agents for full coverage
- Potential for gaps between agent domains
- Need for careful agent selection

## Using Agents Effectively

### Choose the Right Command

Select commands that use appropriate agents:

**For Code Review:**
```bash
/code-review:review-local-changes  # Uses all review agents
/code-review:review-pr            # Uses all review agents
```

**For Development Workflow:**
```bash
/sdd:02-plan       # Uses code-architect and code-explorer
/sdd:04-implement  # Uses code-reviewer for quality gates
```

### Trust the Process

Agents work best when:
- You trust their specialized expertise
- You consider all perspectives
- You apply their recommendations thoughtfully
- You iterate based on feedback

### Provide Context

Help agents help you:
- Clear change descriptions
- Relevant background information
- Specific concerns or focus areas
- Expected behavior descriptions

## Agent Development

Want to create custom agents? See:

- [Customaize Agent Plugin](./command-index.md#customaize-agent)
- [Subagent-Driven Development Skill](./skill-index.md#subagent-driven-development)
- `/customaize-agent:test-prompt` command
- [Plugin Development Guide](../guides/plugin-development.md)

## See Also

**Reference:**
- [Command Index](./command-index.md) - Commands that invoke agents
- [Skill Index](./skill-index.md) - Skills that enhance agent behavior
- [Marketplace API](./marketplace-api.md) - Managing agent-containing plugins

**Concepts:**
- [Agent Workflows](../concepts/agent-workflows.md) - Multi-agent patterns and orchestration
- [Quality Gates](../concepts/quality-gates.md) - Agents in quality assurance

**Research:**
- [Papers](../research/papers.md) - Multi-agent system research
- [Benchmarks](../research/benchmarks.md) - Agent performance metrics
