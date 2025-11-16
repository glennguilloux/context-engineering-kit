# Token Efficiency

Token efficiency is the practice of maximizing output quality while minimizing token consumption. Every token loaded into context has a cost in dollars, latency, and attention - making efficiency critical for production LLM applications.

## Why Token Efficiency Matters

### 1. Cost Impact

LLM pricing is token-based:

```
Claude Sonnet 3.5 pricing (example):
- Input: $3 per million tokens
- Output: $15 per million tokens

Scenario: Daily development with 50 requests
- Inefficient context: 20K tokens/request = 1M tokens/day = $3/day = $90/month
- Efficient context: 5K tokens/request = 250K tokens/day = $0.75/day = $22.50/month

Annual savings: $810 per developer
```

Multiply by team size and the numbers become significant.

### 2. Latency Impact

More tokens = slower responses:

```
Approximate processing times:
- 5K tokens: 2-3 seconds
- 20K tokens: 8-12 seconds
- 100K tokens: 40+ seconds
```

Developer productivity suffers when every request takes 10+ seconds.

### 3. Attention Impact

Models perform better with focused context:

- **Relevant information density** - Signal-to-noise ratio matters
- **Attention dilution** - Important details get lost in large contexts
- **Retrieval accuracy** - Models struggle to locate specific information in massive contexts

Research shows that model performance can degrade with unnecessarily large contexts, even when all information is technically relevant.

### 4. Context Window Competition

Even with 200K token windows, context space is competitive:

```
Available: 200,000 tokens

Consumed by:
- System instructions: 2,000 tokens
- Installed skills: 5,000 tokens
- Conversation history: 20,000 tokens
- Loaded files: 30,000 tokens
- Tool outputs: 10,000 tokens
────────────────────────────────
Remaining: 133,000 tokens

But each additional file/skill/command reduces working space.
```

## The CEK Token Efficiency Strategy

Context Engineering Kit applies several strategies to minimize token consumption:

### 1. Commands Over Skills

**Skills** load into every request automatically.
**Commands** load only when invoked.

```bash
# Skill-based approach (high baseline cost):
# Every request includes:
# - Test-driven development guidelines (1,500 tokens)
# - Domain-driven design patterns (2,000 tokens)
# - Code review standards (1,800 tokens)
# = 5,300 tokens baseline before any work starts

# Command-based approach (low baseline cost):
# Base context: minimal
# /tdd:implement       - Loads TDD context only when needed
# /ddd:setup-formatting - Loads DDD context only when needed
# /code-review:review   - Loads review context only when needed
# = ~500 tokens baseline, grows only as capabilities are used
```

**CEK prefers commands** for capabilities that aren't needed in every request.

### 2. Progressive Context Loading

Load information just-in-time:

```
Bad (eager loading):
├─ Load all project documentation
├─ Load all code files
├─ Load all design patterns
└─ Execute task (using 5% of loaded context)

Good (lazy loading):
├─ Execute task
├─ Load specific files as needed
├─ Load relevant patterns when applicable
└─ Context contains only what's used
```

Example from SDD workflow:

```bash
/sdd:01-specify   # Loads: specification templates + examples
                  # Unloads after completion

/sdd:02-plan      # Loads: architecture patterns + planning frameworks
                  # Doesn't carry specification templates forward

/sdd:03-tasks     # Loads: task breakdown patterns + complexity analysis
                  # Doesn't carry architecture patterns forward
```

Each stage gets fresh, minimal context.

### 3. Specialized Agents

Generic agents require broad knowledge. Specialized [agents](./agent-workflows.md) need minimal, focused context:

```
Generic agent context:
├─ All coding standards (3,000 tokens)
├─ All security patterns (2,500 tokens)
├─ All testing strategies (2,000 tokens)
├─ All architecture principles (2,500 tokens)
└─ All documentation standards (1,500 tokens)
Total: 11,500 tokens per agent

Specialized agent context:
bug-hunter agent:
└─ Bug detection patterns (1,200 tokens)

security-auditor agent:
└─ Security vulnerability patterns (1,500 tokens)

test-coverage-reviewer agent:
└─ Test adequacy criteria (1,000 tokens)

Total across 6 agents: 7,800 tokens
Savings: 32% fewer tokens, higher quality per agent
```

### 4. Eliminating Redundancy

CEK plugins have **zero overlap** through [granular design](./granular-design.md):

```
❌ Bad marketplace design:
plugin-A: includes generic code review
plugin-B: includes generic code review (duplicate!)
plugin-C: includes generic code review (duplicate!)
→ Install all three = 3x redundant content

✅ CEK design:
code-review plugin: comprehensive code review
reflexion plugin: self-refinement loops (no review overlap)
tdd plugin: testing methodology (no review overlap)
→ Install all three = zero redundancy
```

### 5. Compressed Prompts

Every word counts. CEK prompts are ruthlessly edited:

```
❌ Verbose (127 tokens):
"When you are writing code, you should always make sure to follow
best practices. This includes writing clean code that is easy to
read and understand. You should use meaningful variable names that
clearly indicate what the variable is used for. Comments should be
added where necessary to explain complex logic. Make sure your code
is well-structured and follows established patterns."

✅ Compressed (31 tokens):
"Follow best practices: clean, readable code with meaningful names.
Comment complex logic. Use established patterns."

Same meaning, 76% fewer tokens.
```

### 6. Structured Information

Structure reduces redundancy:

```
❌ Prose format (high redundancy):
"The bug-hunter agent looks for bugs. It identifies potential bugs
in the code. It searches for edge cases that might cause bugs. It
looks for error-prone patterns that commonly lead to bugs."
(38 tokens with redundant "bug" mentions)

✅ Structured format (low redundancy):
"bug-hunter agent:
- Identifies potential bugs
- Searches for edge cases
- Detects error-prone patterns"
(17 tokens, same information)
```

### 7. Examples Over Explanations

Show, don't tell (when possible):

```
❌ Abstract explanation (high token cost):
"Functions should be named using camelCase convention where the
first word is lowercase and subsequent words are capitalized.
The name should be a verb that describes the action the function
performs. It should be descriptive but not excessively long."
(43 tokens)

✅ Concrete examples (low token cost):
"Function naming:
✓ calculateTotal(), fetchUserData(), validateInput()
✗ Calculate_Total(), FETCHUSERDATA(), do_thing()"
(20 tokens, clearer guidance)
```

## Token Efficiency Patterns

### Pattern 1: Lazy Documentation Loading

Don't load files until needed:

```bash
# Inefficient:
agent starts → load all docs → process task

# Efficient:
agent starts → process task → load specific docs if needed
```

Example: Code review agent doesn't load entire codebase. It:
1. Examines changed files
2. Loads related files only if needed for context
3. Uses grep/search to find specific patterns without loading

### Pattern 2: Context Windowing

Keep recent context, summarize or drop old context:

```
[Recent turns: full detail]
[Medium-age turns: summarized]
[Old turns: dropped]

Instead of:
[All turns: full detail] ← wasteful
```

### Pattern 3: Selective Skill Loading

Only install skills you use frequently:

```bash
# Daily coding work:
/plugin install tdd@NeoLabHQ/context-engineering-kit
/plugin install code-review@NeoLabHQ/context-engineering-kit

# Occasional tasks (use commands on-demand):
/reflexion:reflect (use when needed, don't install skill)
/kaizen:analyze (use when needed, don't install skill)
```

### Pattern 4: Agent Result Compression

Agents should return compressed summaries, not full outputs:

```
❌ Agent returns full analysis:
"I examined the authentication module. The authentication logic is
implemented in auth.ts. I found that there are several functions...
[2000 tokens of detailed explanation]"

✅ Agent returns structured summary:
"Authentication Review:
Issues: 2 critical, 3 minor
Files: auth.ts (main), utils.ts (helpers)
Recommendation: Fix session validation (line 45)"
[200 tokens, actionable]
```

### Pattern 5: Incremental Loading

Add context incrementally as complexity grows:

```bash
# Simple task:
Basic context only (500 tokens)

# Task gets complex:
+ Load relevant design patterns (800 tokens)

# Complexity increases further:
+ Load architectural examples (1,200 tokens)

# Starts simple, grows only as needed
```

### Pattern 6: Command Chaining vs Monolithic Commands

Break large workflows into chainable commands:

```bash
# Inefficient monolithic command (loads everything):
/do-everything (10,000 tokens of context)

# Efficient command chain (loads progressively):
/step-1 (2,000 tokens) →
/step-2 (2,500 tokens) →
/step-3 (1,800 tokens)
# Can stop early if needed, pays only for what's used
```

## Measuring Token Efficiency

### Metrics to Track

1. **Baseline Context Size**
   - Tokens loaded before any work starts
   - Target: < 2,000 tokens for typical setup

2. **Average Tokens per Request**
   - Total input tokens / number of requests
   - Target: < 8,000 tokens for typical coding tasks

3. **Context Growth Rate**
   - How quickly context expands as conversation continues
   - Target: Linear or sublinear growth

4. **Reuse Ratio**
   - Percentage of context tokens that inform the actual response
   - Target: > 60% utilization

5. **Cost per Task**
   - Dollar cost for typical task completion
   - Track trends over time

### Tools for Measurement

Monitor token usage:

```bash
# Claude Code shows token counts in responses
# Track these over time:

Example response metadata:
Input tokens: 8,450
Output tokens: 1,230
Cost: $0.043
```

Build dashboards tracking:
- Token usage by plugin
- Token usage by command
- Average tokens per task type
- Cost trends over time

## Token Efficiency Best Practices

### Do's

✅ **Prefer commands over skills** for infrequently-used capabilities
✅ **Load files lazily** - only when needed for the task
✅ **Use structured formats** - lists, tables over prose
✅ **Compress prompts ruthlessly** - every word must earn its place
✅ **Employ specialized agents** - narrow focus needs less context
✅ **Chain commands** - pay only for stages you use
✅ **Return summaries** - compress agent outputs
✅ **Eliminate redundancy** - one source of truth per concept
✅ **Use examples** - show don't tell when possible
✅ **Monitor usage** - track token consumption patterns

### Don'ts

❌ **Don't load eagerly** - "just in case" loading wastes tokens
❌ **Don't duplicate information** - cross-reference instead
❌ **Don't use verbose prose** - concise is better
❌ **Don't create overlapping plugins** - eliminate redundancy
❌ **Don't keep stale context** - drop or summarize old information
❌ **Don't use generic agents** - specialization reduces context needs
❌ **Don't return verbose outputs** - compress agent results
❌ **Don't install unused skills** - they load on every request
❌ **Don't ignore token counts** - measure to improve

## Efficiency vs Quality Tradeoffs

Token efficiency shouldn't compromise quality. The goal is **optimal efficiency at target quality level**.

### When to Add Tokens

Invest tokens when they meaningfully improve outcomes:

✅ **Clear examples** that prevent misunderstanding
✅ **Critical constraints** that must not be violated
✅ **Domain-specific patterns** that guide correct implementation
✅ **Quality criteria** that define success
✅ **Error patterns** to avoid common mistakes

### When to Cut Tokens

Remove tokens that don't pull their weight:

✅ **Redundant explanations** of the same concept
✅ **Obvious statements** that don't add information
✅ **Verbose descriptions** that could be shown with examples
✅ **Unused capabilities** loaded "just in case"
✅ **Historical context** that's no longer relevant

## Real-World Examples

### Example 1: Code Review Optimization

**Before** (inefficient):
```
Total context: 15,000 tokens

Includes:
- All code quality rules (3,000 tokens)
- All security patterns (2,800 tokens)
- All testing standards (2,500 tokens)
- All architecture principles (3,200 tokens)
- All documentation standards (2,000 tokens)
- Conversation history (1,500 tokens)

Review single file → uses ~20% of loaded context
```

**After** (efficient with CEK):
```
Total context: 6,200 tokens

/code-review:review-local-changes spawns:
- bug-hunter: 1,000 tokens (bugs only)
- security-auditor: 1,200 tokens (security only)
- test-reviewer: 900 tokens (testing only)

Each agent loads minimal, focused context
Review quality improves, tokens reduced by 59%
```

### Example 2: Feature Development Optimization

**Before** (inefficient):
```
Load entire codebase documentation: 20,000 tokens
Load all design patterns: 5,000 tokens
Load all testing strategies: 3,000 tokens
Load all API docs: 4,000 tokens
Total baseline: 32,000 tokens

Implement feature → iterate → refine
Average: 50,000 tokens per feature
```

**After** (efficient with CEK):
```
/sdd:01-specify (3,000 tokens) - spec only
/sdd:02-plan (4,000 tokens) - architecture only
/sdd:03-tasks (2,500 tokens) - task breakdown only
/sdd:04-implement (12,000 tokens) - implementation + focused docs
/sdd:05-document (3,500 tokens) - documentation only

Total: 25,000 tokens per feature
Savings: 50% reduction, higher quality with quality gates
```

### Example 3: Reflexion Workflow Optimization

**Before** (eager loading):
```
Load self-refinement patterns: 2,000 tokens
Load verification frameworks: 1,800 tokens
Load debate protocols: 1,500 tokens
Load memory management: 1,200 tokens
Total: 6,500 tokens per session
```

**After** (command-based):
```
/reflexion:reflect (2,200 tokens) - only when reflecting
/reflexion:critique (2,800 tokens) - only when critiquing
/reflexion:memorize (1,500 tokens) - only when persisting

Use only what you need, when you need it
Average usage: 2,200 tokens (66% reduction)
```

## Token Efficiency Checklist

Before releasing a prompt or plugin:

- [ ] Every sentence provides unique value
- [ ] Examples used instead of lengthy explanations where possible
- [ ] Structured format (lists, tables) instead of prose where appropriate
- [ ] No redundant information across prompts
- [ ] Capabilities loaded on-demand via commands when appropriate
- [ ] Specialized agents instead of generic ones where applicable
- [ ] Clear, compressed language without verbosity
- [ ] Measured token consumption and verified efficiency
- [ ] Quality maintained or improved despite reduced tokens

## Key Takeaways

1. **Tokens have real costs** - dollars, latency, and attention
2. **Commands > Skills** - load capabilities on-demand
3. **Specialized > Generic** - narrow focus needs less context
4. **Lazy > Eager** - load information when needed
5. **Structured > Prose** - format reduces redundancy
6. **Examples > Explanations** - show don't tell (often)
7. **Quality maintained** - efficiency shouldn't compromise outcomes
8. **Measure everything** - track token usage patterns
9. **Eliminate redundancy** - one source of truth per concept
10. **Optimize ruthlessly** - every token must earn its place

## Related Documentation

**Concepts:**
- [Context Engineering](./context-engineering.md) - Foundation of CEK's approach
- [Agent Workflows](./agent-workflows.md) - Using specialized agents efficiently
- [Quality Gates](./quality-gates.md) - Quality assurance patterns
- [Granular Design](./granular-design.md) - Modular architecture for token efficiency

**Guides:**
- [Optimization Guide](../guides/optimization.md) - Practical token optimization strategies
- [Choosing Plugins](../guides/choosing-plugins.md) - Selecting token-efficient plugins
- [Combining Plugins](../guides/combining-plugins.md) - Managing token costs in combinations

---

**Further Reading**:

- [Claude API Pricing](https://www.anthropic.com/pricing)
- [Prompt Engineering Guide](https://docs.anthropic.com/claude/docs/prompt-engineering)
- [Context Window Best Practices](https://docs.anthropic.com/claude/docs/long-context-tips)
