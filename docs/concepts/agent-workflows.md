# Agent Workflows

Agent workflows define how language models are orchestrated to accomplish complex tasks. Rather than relying on a single monolithic agent, effective workflows use specialized agents, multi-agent collaboration, and subagent delegation to achieve higher quality results.

## What is an Agent?

An **agent** is an LLM instance configured with:

- **Specific instructions** defining its role and capabilities
- **Focused context** containing only relevant information
- **Defined tools** it can use to accomplish tasks
- **Clear boundaries** around what it should and shouldn't do

Think of agents as specialized team members, each with expertise in a particular domain.

## Why Specialized Agents Matter

### The Generalist Problem

A single agent trying to handle everything faces challenges:

```
Generic "do everything" agent:
├─ Knows about: security, testing, architecture, documentation, debugging, etc.
├─ Context: 15,000+ tokens of mixed information
├─ Attention: diluted across all domains
└─ Results: mediocre quality across all tasks

Problems:
- Too much context reduces focus
- Jack-of-all-trades, master of none
- No clear success criteria
- Difficult to optimize
```

### The Specialist Advantage

Specialized agents excel in narrow domains:

```
Specialized bug-hunter agent:
├─ Knows about: bug patterns, edge cases, error-prone code
├─ Context: 1,200 tokens of focused bug-detection knowledge
├─ Attention: 100% focused on finding bugs
└─ Results: high-quality bug detection

Benefits:
- Minimal, focused context
- Expert-level performance in domain
- Clear success criteria
- Easy to measure and optimize
```

Research shows specialized agents outperform generalists by **15-30%** on focused tasks.

## Agent Workflow Patterns in CEK

### Pattern 1: Sequential Specialized Agents

Deploy focused agents in sequence, each handling one aspect:

```bash
/code-review:review-local-changes

Workflow:
1. bug-hunter agent
   └─ Examines: potential bugs, edge cases
   └─ Context: bug detection patterns only
   └─ Output: bug report

2. security-auditor agent
   └─ Examines: security vulnerabilities
   └─ Context: security patterns only
   └─ Output: security assessment

3. test-coverage-reviewer agent
   └─ Examines: test adequacy
   └─ Context: testing standards only
   └─ Output: coverage analysis

4. code-quality-reviewer agent
   └─ Examines: readability, maintainability
   └─ Context: quality patterns only
   └─ Output: quality recommendations

5. contracts-reviewer agent
   └─ Examines: interfaces, APIs
   └─ Context: contract patterns only
   └─ Output: contract review

6. historical-context-reviewer agent
   └─ Examines: consistency with codebase patterns
   └─ Context: project conventions
   └─ Output: consistency check

Final output: Comprehensive review from 6 perspectives
```

**Benefits**:
- Each agent focuses on one aspect (higher quality)
- Minimal context per agent (token efficient)
- Clear separation of concerns
- Easy to add/remove review dimensions

**Based on**: Multi-expert systems research

### Pattern 2: Multi-Agent Debate

Multiple agents propose solutions, critique each other, and build consensus:

```bash
/reflexion:critique

Workflow:
1. Initial response generation
   Agent: Create solution to problem

2. Multi-perspective critique
   Judge 1: Correctness perspective
   └─ "Solution handles edge case X incorrectly"

   Judge 2: Efficiency perspective
   └─ "Algorithm has O(n²) complexity, can be O(n)"

   Judge 3: Maintainability perspective
   └─ "Variable names unclear, logic hard to follow"

3. Debate and refinement
   └─ Judges discuss concerns
   └─ Identify most critical issues
   └─ Build consensus on improvements

4. Final synthesis
   └─ Original agent refines solution
   └─ Addresses consensus issues
   └─ Produces improved output
```

**Benefits**:
- Multiple perspectives catch more issues
- Debate surfaces non-obvious problems
- Consensus building prioritizes fixes
- Higher quality final output

**Based on**: [Multi-Agent Debate paper](https://arxiv.org/abs/2305.14325) showing accuracy improvements through debate

### Pattern 3: Generate-Verify-Refine (GVR)

Three-stage workflow with explicit verification:

```bash
/reflexion:reflect

Workflow:
1. Generate
   Agent: Produces initial solution
   Output: Implementation + reasoning

2. Verify
   Verifier: Checks solution against criteria
   - Does it solve the stated problem?
   - Are there edge cases unhandled?
   - Is the approach sound?
   Output: Verification report with issues

3. Refine
   Agent: Addresses verification issues
   - Fixes identified problems
   - Handles edge cases
   - Improves approach
   Output: Refined solution
```

**Benefits**:
- Explicit verification step catches issues
- Clear criteria for success
- Iterative improvement
- Quality gates before finalization

**Based on**: [Self-Refine](https://arxiv.org/abs/2305.12966) and [Chain-of-Verification](https://arxiv.org/abs/2305.13888) papers

### Pattern 4: Subagent Task Delegation

Main agent delegates subtasks to fresh subagents:

```bash
/sdd:04-implement (with subagent-driven-development skill)

Workflow:
Main agent breaks feature into tasks:
├─ Task 1: Implement authentication
├─ Task 2: Add authorization checks
├─ Task 3: Create user management API
└─ Task 4: Write integration tests

For each task:
1. Spawn fresh subagent
   └─ Load minimal context for this task only
   └─ No contamination from previous tasks

2. Subagent implements task
   └─ Write code with TDD approach
   └─ Run tests
   └─ Verify completion

3. Review checkpoint
   └─ Code review before proceeding
   └─ Verify quality gate passed (see [Quality Gates](./quality-gates.md) for details)
   └─ Extract learnings

4. Update memory
   └─ Store insights in CLAUDE.md
   └─ Future tasks benefit from learnings

Next task gets fresh subagent with updated memory
```

**Benefits**:
- Fresh context prevents error propagation
- Quality gates between tasks
- Accumulated learnings improve over time
- Fast iteration with high quality

**Based on**: [Agentic Context Engineering paper](https://arxiv.org/abs/2510.04618) showing 10.6% performance improvement

### Pattern 5: Hierarchical Agent Structure

Coordinator agent manages specialized worker agents:

```bash
Spec-Driven Development workflow:

Coordinator (main agent)
├─ Delegates to: specification-agent
│  └─ Context: specification templates, examples
│  └─ Task: Create feature spec
│  └─ Output: spec.md
│
├─ Delegates to: architecture-agent (code-architect)
│  └─ Context: architecture patterns, tech stack
│  └─ Task: Design solution
│  └─ Output: plan.md
│
├─ Delegates to: task-planning-agent
│  └─ Context: task breakdown patterns
│  └─ Task: Create implementation tasks
│  └─ Output: tasks.md
│
├─ Delegates to: implementation-agent
│  └─ Context: specs, plans, coding standards
│  └─ Task: Implement features
│  └─ Output: code
│
└─ Delegates to: documentation-agent
   └─ Context: documentation standards
   └─ Task: Document implementation
   └─ Output: documentation
```

**Benefits**:
- Clear division of responsibility
- Each agent has minimal, focused context
- Coordinator maintains overall coherence
- Easy to parallelize independent tasks

**Based on**: Hierarchical planning research

### Pattern 6: Critic-Generator Architecture

One agent generates, another critiques:

```bash
Constitutional AI pattern:

Generator Agent:
├─ Generates response to user query
└─ Output: initial solution

Critic Agent:
├─ Reviews against principles:
│  - Is it correct?
│  - Is it safe?
│  - Is it helpful?
│  - Is it well-reasoned?
├─ Identifies violations
└─ Output: critique with specific issues

Generator Agent (second pass):
├─ Receives critique
├─ Addresses identified issues
└─ Output: improved solution
```

**Benefits**:
- Separation of generation and evaluation
- Explicit quality criteria
- Iterative refinement
- Reduced harmful outputs

**Based on**: [Constitutional AI paper](https://arxiv.org/abs/2212.08073)

## Agent Workflow Design Principles

### 1. Single Responsibility

Each agent should have one clear purpose:

```
✅ Good: bug-hunter agent finds bugs
✅ Good: security-auditor agent checks security
❌ Bad: generic-reviewer agent does everything
```

### 2. Minimal Context

Load only what the agent needs for [token efficiency](./token-efficiency.md):

```
✅ Good: Security agent loads security patterns (1,500 tokens)
❌ Bad: Security agent loads all standards (8,000 tokens)
```

### 3. Clear Input/Output Contracts

Define what the agent receives and produces:

```
Agent: bug-hunter
Input:
  - changed_files: List[FilePath]
  - diff: GitDiff
Output:
  - bugs: List[Bug]
  - severity: Critical | High | Medium | Low
  - recommendations: List[Fix]
```

### 4. Quality Gates Between Agents

Don't let errors propagate through [quality gates](./quality-gates.md):

```
Agent 1 → Review → Agent 2 → Review → Agent 3
         ↓                  ↓
     Quality gate      Quality gate
```

### 5. Stateless Agents

Agents should not maintain hidden state:

```
✅ Good: Agent receives all needed context explicitly
❌ Bad: Agent relies on implicit conversation history
```

### 6. Composable Workflows

Design agents to work in multiple workflows:

```
code-architect agent used in:
- /sdd:02-plan (plan feature)
- /kaizen:analyze (analyze codebase)
- /docs:update-docs (architecture documentation)
```

## Implementing Agent Workflows

### Example 1: Code Review Workflow

```typescript
// Pseudo-code for code review workflow

async function reviewChanges(diff: GitDiff): Promise<Review> {
  // Sequential specialized agents
  const bugReport = await runAgent('bug-hunter', {
    context: loadBugPatterns(),
    input: diff
  });

  const securityReport = await runAgent('security-auditor', {
    context: loadSecurityPatterns(),
    input: diff
  });

  const testReport = await runAgent('test-coverage-reviewer', {
    context: loadTestingStandards(),
    input: diff
  });

  const qualityReport = await runAgent('code-quality-reviewer', {
    context: loadQualityPatterns(),
    input: diff
  });

  // Synthesize reports
  return synthesizeReview([
    bugReport,
    securityReport,
    testReport,
    qualityReport
  ]);
}
```

### Example 2: Multi-Agent Debate Workflow

```typescript
// Pseudo-code for multi-agent debate

async function critiqueWithDebate(solution: string): Promise<Critique> {
  // Generate initial solution (already done)

  // Multiple judges provide perspectives
  const judges = [
    { name: 'correctness', context: loadCorrectnessPatterns() },
    { name: 'efficiency', context: loadEfficiencyPatterns() },
    { name: 'maintainability', context: loadMaintainabilityPatterns() }
  ];

  const critiques = await Promise.all(
    judges.map(judge => runAgent(judge.name, {
      context: judge.context,
      input: solution,
      task: 'Critique this solution from your perspective'
    }))
  );

  // Debate phase
  const consensus = await runAgent('moderator', {
    context: critiques,
    task: 'Build consensus on most important issues'
  });

  return consensus;
}
```

### Example 3: Subagent Delegation Workflow

```typescript
// Pseudo-code for subagent task delegation

async function implementWithSubagents(tasks: Task[]): Promise<void> {
  for (const task of tasks) {
    // Spawn fresh subagent
    const subagent = createFreshAgent({
      context: loadMinimalContext(task),
      memory: loadAccumulatedLearnings()
    });

    // Execute task
    const result = await subagent.execute(task);

    // Quality gate
    const review = await reviewResult(result);
    if (!review.passed) {
      // Fix issues before proceeding
      await subagent.refine(review.issues);
    }

    // Extract learnings
    const insights = await extractInsights(result, review);
    await updateMemory(insights);

    // Dispose subagent (fresh start for next task)
    subagent.dispose();
  }
}
```

## Agent Workflow Patterns Comparison

| Pattern | Best For | Token Efficiency | Quality Gain | Complexity |
|---------|----------|------------------|--------------|------------|
| Sequential Specialized | Multi-aspect analysis | High | High | Low |
| Multi-Agent Debate | Complex decisions | Medium | Very High | Medium |
| Generate-Verify-Refine | Iterative improvement | High | High | Low |
| Subagent Delegation | Large multi-task projects | Very High | High | Medium |
| Hierarchical Structure | Complex workflows | High | Medium | High |
| Critic-Generator | Safety-critical outputs | Medium | High | Low |

## Workflow Selection Guide

**Use Sequential Specialized Agents when**:
- Need comprehensive analysis from multiple perspectives
- Each perspective is independent
- Want high quality with token efficiency

**Use Multi-Agent Debate when**:
- Decisions are complex and nuanced
- Want to explore multiple approaches
- Quality is paramount, tokens less critical

**Use Generate-Verify-Refine when**:
- Iterative improvement is needed
- Clear verification criteria exist
- Want explicit quality gates

**Use Subagent Delegation when**:
- Tasks can be cleanly separated
- Fresh context for each task is valuable
- Want to prevent error propagation

**Use Hierarchical Structure when**:
- Workflow has clear phases
- Coordination between phases is needed
- Different phases need different expertise

**Use Critic-Generator when**:
- Output safety is critical
- Evaluation criteria are well-defined
- Want to separate generation from evaluation

## Best Practices

### Do's

✅ **Define clear agent boundaries** - each agent has one purpose
✅ **Use minimal context** - load only what the agent needs
✅ **Implement quality gates** - review between agents
✅ **Make agents stateless** - all context explicit
✅ **Design for composition** - agents work in multiple workflows
✅ **Extract and persist learnings** - improve over time
✅ **Use specialized agents** - narrow focus beats generalization
✅ **Measure agent performance** - track quality and efficiency

### Don'ts

❌ **Don't create generic mega-agents** - specialization wins
❌ **Don't skip quality gates** - errors compound without review
❌ **Don't load unnecessary context** - wastes tokens
❌ **Don't rely on implicit state** - make context explicit
❌ **Don't ignore agent outputs** - propagate insights forward
❌ **Don't overcomplicate** - simplest effective workflow wins
❌ **Don't forget error handling** - agents can fail

## Research Validation

Agent workflow patterns are validated by research:

- **Multi-Agent Debate**: Accuracy improvements on reasoning tasks ([paper](https://arxiv.org/abs/2305.14325))
- **Self-Refinement**: 8-21% quality improvement ([paper](https://arxiv.org/abs/2305.12966))
- **Agentic Memory**: 10.6% performance gain with subagent workflows ([paper](https://arxiv.org/abs/2510.04618))
- **Constitutional AI**: Reduced harmful outputs while maintaining helpfulness ([paper](https://arxiv.org/abs/2212.08073))
- **Chain-of-Verification**: Improved factual accuracy through verification ([paper](https://arxiv.org/abs/2305.13888))

## Troubleshooting Agent Workflows

### Problem: Agents producing inconsistent results

**Solution**:
- Add explicit quality criteria to agent context
- Implement verification step
- Use consensus building across multiple agents

### Problem: Agent outputs not used by downstream agents

**Solution**:
- Define clear input/output contracts
- Explicitly pass agent outputs forward
- Structure outputs for easy consumption

### Problem: Errors propagating across agents

**Solution**:
- Add quality gates between agents
- Use fresh subagents for independent tasks
- Implement verification before proceeding

### Problem: Too much token consumption

**Solution**:
- Reduce agent context to minimum needed
- Use sequential vs parallel agents where appropriate
- Implement lazy loading of agent capabilities

## Key Takeaways

1. **Specialized agents** outperform generic ones
2. **Multiple agents** provide better coverage than one
3. **Quality gates** prevent error propagation
4. **Fresh context** prevents contamination
5. **Debate and consensus** improve decision quality
6. **Verification steps** catch issues early
7. **Clear boundaries** enable composition
8. **Minimal context** improves efficiency
9. **Research-backed** patterns deliver measurable gains
10. **Workflow choice** depends on task characteristics

## Related Documentation

**Concepts:**
- [Context Engineering](./context-engineering.md) - Foundation of CEK's approach
- [Quality Gates](./quality-gates.md) - Review loops and verification patterns
- [Granular Design](./granular-design.md) - Modular architecture principles
- [Token Efficiency](./token-efficiency.md) - Token optimization strategies

**Reference:**
- [Agent Index](../reference/agent-index.md) - Complete catalog of available agents
- [Command Index](../reference/command-index.md) - Commands that use agents

**Research:**
- [Papers](../research/papers.md) - Academic foundations for agent workflows
- [Benchmarks](../research/benchmarks.md) - Multi-agent system performance

---

**Further Reading**:

- [Multi-Agent Debate](https://arxiv.org/abs/2305.14325)
- [Self-Refine Paper](https://arxiv.org/abs/2305.12966)
- [Agentic Context Engineering](https://arxiv.org/abs/2510.04618)
- [Constitutional AI](https://arxiv.org/abs/2212.08073)
- [Chain-of-Verification](https://arxiv.org/abs/2305.13888)
