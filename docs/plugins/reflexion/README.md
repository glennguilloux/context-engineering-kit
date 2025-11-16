# Reflexion Plugin

Self-refinement framework that introduces feedback and refinement loops to improve output quality through iterative improvement, complexity triage, and verification.

## Overview

The Reflexion plugin implements multiple scientifically-proven techniques for improving LLM outputs through self-reflection, critique, and memory updates. It enables Claude to evaluate its own work, identify weaknesses, and generate improved versions.

## Quick Start

```bash
# Install the plugin
/plugin install reflexion@NeoLabHQ/context-engineering-kit

# Use it after completing any task
> claude "implement user authentication"
> /reflexion:reflect

# Get comprehensive multi-perspective review
> /reflexion:critique

# Save insights to project memory
> /reflexion:memorize
```

## Key Features

### Self-Refinement
- Reflects on previous responses and outputs
- Identifies areas for improvement
- Generates refined versions
- Complexity triage for appropriate level of review

### Multi-Perspective Critique
- Multiple specialized judges evaluate the work
- Debate and consensus building
- Comprehensive quality assessment
- Structured feedback format

### Memory Updates
- Curates insights from reflections
- Updates CLAUDE.md with learnings
- Agentic Context Engineering for persistent improvements
- Builds project-specific knowledge base

## When to Use

**Use Reflexion when:**
- You want to verify and improve the quality of Claude's output
- You need multiple perspectives on code or design decisions
- You want to capture learnings for future reference
- You're working on complex problems requiring careful review

**Typical scenarios:**
- After implementing a feature
- Before committing major changes
- When debugging complex issues
- After architectural decisions
- When documenting important patterns

## Scientific Foundation

The Reflexion plugin is based on peer-reviewed research demonstrating **8-21% improvement in output quality** across diverse tasks:

### Core Papers

- **[Self-Refine](https://arxiv.org/abs/2305.12966)** - Iterative refinement where the model reviews and improves its own output
- **[Reflexion](https://arxiv.org/abs/2303.11366)** - Self-reflection for autonomous agents with memory
- **[Constitutional AI (CAI)](https://arxiv.org/abs/2212.08073)** - Critique based on principles and guidelines
- **[LLM-as-a-Judge](https://arxiv.org/abs/2306.05685)** - Using LLMs to evaluate other LLM outputs
- **[Multi-Agent Debate](https://arxiv.org/abs/2305.14325)** - Multiple models proposing and critiquing solutions
- **[Agentic Context Engineering](https://arxiv.org/abs/2510.04618)** - Memory updates after reflection (**10.6% improvement**)

### Additional Techniques

- **[Chain-of-Verification (CoVe)](https://arxiv.org/abs/2305.13888)** - Generate, verify, revise cycle
- **[Tree of Thoughts (ToT)](https://arxiv.org/abs/2305.10601)** - Multiple reasoning path exploration
- **[Process Reward Models](https://arxiv.org/abs/2211.07633)** - Step-by-step evaluation

## Commands Overview

| Command | Purpose | Output |
|---------|---------|--------|
| `/reflexion:reflect` | Review and improve previous response | Refined output with improvements |
| `/reflexion:critique` | Multi-perspective comprehensive review | Structured feedback from multiple judges |
| `/reflexion:memorize` | Save insights to project memory | Updated CLAUDE.md with learnings |

## Best Practices

### Effective Reflection

1. **Reflect after significant work** - Don't reflect on trivial tasks
2. **Be specific** - Provide context about what to focus on
3. **Iterate when needed** - Sometimes multiple reflection cycles are valuable
4. **Capture learnings** - Use `/reflexion:memorize` to preserve insights

### Using Critique

1. **For important decisions** - Use critique for architectural or design choices
2. **Before major commits** - Get multi-perspective review before committing
3. **Learn from debates** - Pay attention to different perspectives in the critique
4. **Address all concerns** - Don't cherry-pick feedback

### Memory Management

1. **Regular memorization** - Periodically save insights to CLAUDE.md
2. **Review memory** - Occasionally review CLAUDE.md to ensure it stays relevant
3. **Curate carefully** - Only memorize significant, reusable insights
4. **Organize by topic** - Keep CLAUDE.md well-structured

## Common Patterns

### Pattern: Implement → Reflect → Memorize

```bash
# Implement feature
> claude "add OAuth authentication"

# Reflect on implementation
> /reflexion:reflect

# Save learnings
> /reflexion:memorize "OAuth patterns and security considerations"
```

### Pattern: Design → Critique → Refine

```bash
# Design architecture
> claude "design microservices architecture for e-commerce"

# Get multi-perspective review
> /reflexion:critique

# Refine based on feedback
> claude "update architecture based on critique feedback"
```

### Pattern: Continuous Improvement Cycle

```bash
# Initial implementation
> claude "implement caching layer"

# First reflection
> /reflexion:reflect

# Address issues and reflect again
> claude "fix the issues identified"
> /reflexion:reflect

# Capture final insights
> /reflexion:memorize
```

## Troubleshooting

### Reflection produces minimal feedback

**Issue:** `/reflexion:reflect` doesn't identify significant improvements.

**Solutions:**
- The output may already be high quality
- Try `/reflexion:critique` for deeper analysis
- Provide more specific context about concerns

### Critique takes too long

**Issue:** `/reflexion:critique` with multiple judges is slow.

**Solutions:**
- Use `/reflexion:reflect` for faster feedback
- Reserve critique for important decisions
- Focus on specific aspects rather than comprehensive review

### CLAUDE.md becomes too large

**Issue:** Memory file grows unwieldy after many memorizations.

**Solutions:**
- Periodically review and consolidate insights
- Remove outdated or redundant information
- Organize into clear sections with good headings
- Consider splitting into multiple focused documents

## Integration with Other Plugins

### With Code Review
```bash
> /code-review:review-local-changes
> /reflexion:memorize "Code review findings"
```

### With SDD
```bash
> /sdd:04-implement
> /reflexion:reflect
> /sdd:05-document
```

### With Kaizen
```bash
> /kaizen:why "Why did the bug occur?"
> /reflexion:memorize "Root cause patterns"
```

## Performance Metrics

Based on research papers:

- **8-21% quality improvement** across diverse tasks (dialogue, coding, math)
- **10.6% improvement** with memory updates (Agentic Context Engineering)
- **Higher human preference scores** compared to single-pass outputs
- **Reduced hallucinations** through verification cycles

## Further Reading

- [Commands Reference](./commands.md) - Detailed command documentation
- [Installation Guide](./installation.md) - Setup and verification
- [Usage Examples](./usage-examples.md) - Real-world scenarios
- [Research Papers](../../research/reflexion-papers.md) - Full paper citations and summaries
