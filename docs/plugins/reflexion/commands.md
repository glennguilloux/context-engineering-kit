# Reflexion Commands Reference

Complete reference for all Reflexion plugin commands.

## Command Overview

| Command | Purpose | Time | Output Type |
|---------|---------|------|-------------|
| `/reflexion:reflect` | Self-refinement and improvement | 30-60s | Refined solution |
| `/reflexion:critique` | Multi-perspective review | 2-5min | Comprehensive report |
| `/reflexion:memorize` | Update project memory | 15-30s | CLAUDE.md update |

## /reflexion:reflect

Reflects on previous response and output using Self-refinement framework for iterative improvement with complexity triage and verification.

### Syntax

```bash
/reflexion:reflect [focus-area]
```

### Parameters

- `focus-area` (optional): Specific aspect to focus reflection on (e.g., "security", "performance", "architecture")

### How It Works

1. **Complexity Triage**: Automatically determines appropriate reflection depth
   - Quick Path (5s): Simple tasks get fast verification
   - Standard Path: Multi-file changes get full reflection
   - Deep Path: Critical systems get comprehensive analysis

2. **Self-Assessment**: Evaluates output against quality criteria
   - Completeness check
   - Quality assessment
   - Correctness verification
   - Fact-checking

3. **Refinement Planning**: If improvements needed, generates specific plan
   - Identifies issues
   - Proposes solutions
   - Prioritizes fixes

4. **Implementation**: Produces refined output addressing identified issues

### Usage Examples

```bash
# Basic reflection on previous response
> claude "implement user authentication"
> /reflexion:reflect

# Focused reflection on specific aspect
> /reflexion:reflect security

# After complex feature implementation
> claude "add payment processing with Stripe"
> /reflexion:reflect
```

### Output Structure

The command produces:

1. **Complexity Assessment**: Which path was taken and why
2. **Quality Analysis**: Checklist of evaluation criteria
3. **Issues Identified**: Specific problems found (if any)
4. **Refinement Plan**: How to improve (if needed)
5. **Refined Output**: Improved version or confirmation of quality

### When to Use

**Use `/reflexion:reflect` when:**
- You've just completed a feature or task
- You want to verify code quality
- You're unsure if your approach is optimal
- You need to identify potential improvements

**Skip `/reflexion:reflect` when:**
- Task is trivial (reading files, simple queries)
- You're exploring or brainstorming
- You need multi-perspective review (use `/reflexion:critique` instead)

### Confidence Thresholds

The command uses confidence levels to determine if further iteration is needed:

- **Quick Path**: No specific threshold (fast verification only)
- **Standard Path**: Requires >70% confidence
- **Deep Reflection**: Requires >90% confidence

If confidence threshold isn't met, the command will iterate automatically.

### Code-Specific Checks

For code-related outputs, additional checks are performed:

1. **Library Check**: Verifies existing solutions weren't overlooked
2. **Architecture Alignment**: Checks Clean Architecture/DDD principles
3. **Anti-Pattern Detection**: Identifies common code smells
4. **Quality Metrics**: Evaluates complexity, coupling, naming

### Fact-Checking

Performance claims, technical facts, security assertions, and best practices are automatically fact-checked with verification requirements.

## /reflexion:critique

Comprehensive multi-perspective review using specialized judges with debate and consensus building.

### Syntax

```bash
/reflexion:critique [scope] [--focus=aspect]
```

### Parameters

- `scope` (optional): What to review (file paths, commits, or defaults to recent work)
- `--focus` (optional): Specific aspect (e.g., "security", "performance")

### How It Works

1. **Context Gathering**: Identifies scope of work to review
2. **Parallel Review**: Spawns three specialized judge agents
   - **Requirements Validator**: Checks alignment with original requirements
   - **Solution Architect**: Evaluates technical approach and design
   - **Code Quality Reviewer**: Assesses implementation quality
3. **Cross-Review & Debate**: Judges review each other's findings and debate disagreements
4. **Consensus Report**: Generates comprehensive report with actionable recommendations

### Judge Scoring

Each judge provides a score out of 10:

- **9-10**: Exceptional quality, minimal improvements needed
- **7-8**: Good quality, minor improvements suggested
- **5-6**: Acceptable quality, several improvements recommended
- **3-4**: Below standards, significant rework needed
- **1-2**: Major issues, substantial rework required

### Usage Examples

```bash
# Review recent work from conversation
> /reflexion:critique

# Review specific files
> /reflexion:critique src/auth/*.ts

# Review with security focus
> /reflexion:critique --focus=security

# Review a git commit range
> /reflexion:critique HEAD~3..HEAD
```

### Output Structure

The command produces a comprehensive report:

1. **Executive Summary**: Overview and overall quality score
2. **Judge Scores**: Individual scores and key findings
3. **Strengths**: What was done well
4. **Issues & Gaps**: Problems by priority (Critical/High/Medium/Low)
5. **Requirements Alignment**: Coverage analysis
6. **Solution Architecture**: Approach assessment with alternatives
7. **Refactoring Recommendations**: Specific improvements with code examples
8. **Areas of Consensus**: Where all judges agreed
9. **Areas of Debate**: Disagreements and resolutions
10. **Action Items**: Prioritized next steps
11. **Learning Opportunities**: Lessons for future work
12. **Conclusion**: Final verdict

### Verdict Types

- ✅ **Ready to ship**: High quality, minor or no issues
- ⚠️ **Needs improvements before shipping**: Good foundation, specific issues to address
- ❌ **Requires significant rework**: Major issues requiring substantial changes

### When to Use

**Use `/reflexion:critique` when:**
- Making important architectural decisions
- Before major commits or releases
- Reviewing complex features
- Need multiple perspectives
- Preparing for code review

**Use `/reflexion:reflect` instead when:**
- You need faster feedback
- Working on smaller tasks
- Want quick quality check
- Don't need comprehensive analysis

### Time Considerations

Critique takes 2-5 minutes due to:
- Spawning multiple judge agents
- Parallel review process
- Debate and consensus building
- Report compilation

Plan accordingly and use for important work where comprehensive review justifies the time.

## /reflexion:memorize

Curates insights from reflections and critiques into CLAUDE.md using Agentic Context Engineering.

### Syntax

```bash
/reflexion:memorize [source] [options]
```

### Parameters

- `source` (optional): What to memorize from
  - `last`: Most recent output (default)
  - `selection`: User-selected text
  - `chat:<id>`: Specific chat message
- `--dry-run`: Preview changes without writing
- `--max=N`: Limit to N insights
- `--section="Name"`: Target specific section

### How It Works

1. **Context Harvesting**: Gathers insights from recent work
   - Reflection outputs
   - Critique findings
   - Problem-solving patterns
   - Failed approaches and lessons

2. **Curation Process**: Transforms raw insights into structured knowledge
   - Extracts key insights
   - Categorizes by impact
   - Applies curation rules (relevance, non-redundancy, actionability)
   - Prevents context collapse

3. **CLAUDE.md Updates**: Adds curated insights to appropriate sections
   - Project Context
   - Code Quality Standards
   - Architecture Decisions
   - Testing Strategies
   - Development Guidelines
   - Strategies and Hard Rules

4. **Memory Validation**: Ensures quality of updates
   - Coherence check
   - Actionability test
   - Consolidation review
   - Evidence verification

### Usage Examples

```bash
# Memorize from most recent work
> /reflexion:reflect
> /reflexion:memorize

# Preview without writing
> /reflexion:memorize --dry-run

# Limit insights
> /reflexion:memorize --max=3

# Target specific section
> /reflexion:memorize --section="Testing Strategies"

# Memorize from critique
> /reflexion:critique
> /reflexion:memorize
```

### CLAUDE.md Structure

The command organizes insights into these sections:

1. **Project Context**
   - Domain knowledge
   - Technical constraints
   - User behavior patterns

2. **Code Quality Standards**
   - Performance criteria
   - Security considerations
   - Maintainability patterns

3. **Architecture Decisions**
   - Effective patterns
   - Integration approaches
   - Scalability considerations

4. **Testing Strategies**
   - Test patterns
   - Edge cases
   - Quality gates

5. **Development Guidelines**
   - APIs and tools
   - Formulas and calculations
   - Task checklists
   - Review criteria
   - Documentation standards
   - Debugging techniques

6. **Strategies and Hard Rules**
   - Verification checklist
   - Patterns and playbooks
   - Anti-patterns and pitfalls

### Curation Rules

Insights are curated following these principles:

- **Relevance**: Helpful for recurring tasks
- **Non-redundancy**: No duplicates of existing knowledge
- **Atomicity**: One idea per bullet, concise
- **Verifiability**: Evidence-backed, not speculative
- **Safety**: No secrets or private information
- **Stability**: Valid over time

### Memory Quality Indicators

**Good Memory Patterns:**
- Specific thresholds: "Use pagination for lists >50 items"
- Contextual patterns: "When user mentions performance, measure first"
- Failure prevention: "Always validate input before database operations"
- Domain language: "In this system, 'customer' means active subscribers"

**Anti-Patterns to Avoid:**
- Vague guidelines: "Write good code"
- Personal preferences: "I like functional style"
- Outdated context: Technology-specific without version
- Over-generalization: "Always use microservices"

### Output

The command provides:

1. Summary of additions (counts by section)
2. Confirmation of CLAUDE.md update
3. Preview of changes (if --dry-run)

### When to Use

**Use `/reflexion:memorize` when:**
- After completing significant features
- Following reflection or critique sessions
- When you discover important patterns
- After solving complex problems
- When you learn domain-specific knowledge

**Don't memorize when:**
- Insight is trivial or obvious
- Information is project-specific and temporary
- Pattern is unproven or speculative
- Knowledge is already documented

### Best Practices

1. **Regular Memorization**: Don't wait too long between sessions
2. **Quality Over Quantity**: Few high-impact insights beat many weak ones
3. **Evidence-Based**: Only memorize proven patterns
4. **Review Periodically**: Keep CLAUDE.md current and relevant
5. **Consolidate**: Merge similar insights over time

## Scientific Foundation

All commands are based on peer-reviewed research:

### /reflexion:reflect
- Self-Refine (2023)
- Reflexion (2023)
- Chain-of-Verification (2023)
- Tree of Thoughts (2023)

### /reflexion:critique
- LLM-as-a-Judge (2023)
- Multi-Agent Debate (2023)
- Constitutional AI (2022)
- Critic-Generator Architecture (2023)

### /reflexion:memorize
- Agentic Context Engineering (2024)
- Generate-Verify-Refine (2023)
- Process Reward Models (2022)

## Integration Patterns

### Sequential Pattern
```bash
> claude "implement feature"
> /reflexion:reflect
> /reflexion:memorize
```

### Comprehensive Pattern
```bash
> claude "implement complex feature"
> /reflexion:critique
> claude "address critique findings"
> /reflexion:reflect
> /reflexion:memorize
```

### Iterative Pattern
```bash
> claude "design architecture"
> /reflexion:critique
> claude "refine based on feedback"
> /reflexion:critique  # Re-evaluate
> /reflexion:memorize
```

## Troubleshooting

### Reflection produces no issues
- Output may already be high quality
- Try `/reflexion:critique` for deeper analysis
- Specify focus area for targeted review

### Critique takes too long
- Normal for comprehensive review (2-5 minutes)
- Use `/reflexion:reflect` for faster feedback
- Reserve critique for important work

### CLAUDE.md grows too large
- Periodically review and consolidate
- Remove outdated information
- Split into focused documents if needed
- Use --max option to limit growth

### Memorization seems redundant
- Check existing CLAUDE.md content first
- Use --dry-run to preview before writing
- Command automatically deduplicates similar content

## Performance Tips

1. **Use appropriate command**: `/reflexion:reflect` for speed, `/reflexion:critique` for depth
2. **Be specific**: Provide focus areas when possible
3. **Batch memorization**: Accumulate insights before memorizing
4. **Review memory regularly**: Keep CLAUDE.md lean and relevant
