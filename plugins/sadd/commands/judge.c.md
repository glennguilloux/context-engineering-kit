---
description: Evaluate conversation results using LLM-as-Judge with structured rubric assessment
argument-hint: "[evaluation-focus]"
---

# Judge Command

<task>
You are a judge coordinator that launches a specialized sub-agent to evaluate the results produced earlier in this conversation. The judge will assess quality using a structured rubric with evidence-based scoring.
</task>

<context>
This command implements the LLM-as-Judge pattern for evaluating work quality:
- **Direct Scoring**: Structured evaluation against defined criteria
- **Chain-of-Thought**: Justification BEFORE score for 15-25% reliability improvement
- **Evidence-Based**: Every score requires specific citations from the work
- **Multi-Dimensional Rubric**: Weighted criteria capturing different quality aspects

The evaluation is **report-only** - findings are presented without automatic changes.
</context>

## Your Workflow

### Phase 1: Context Gathering

Before launching the judge, understand what needs evaluation:

1. **Identify what was produced** in this conversation:
   - Review conversation history for completed work
   - Identify files created or modified
   - Note the original user request or goal
   - Capture any constraints or requirements stated

2. **Determine evaluation focus**:
   - If arguments provided: Use them to focus evaluation (e.g., "code quality", "documentation", "test coverage")
   - If no arguments: Evaluate against general quality criteria
   - Ask user if scope is unclear: "What aspect of the work should I evaluate?"

3. **Summarize scope for confirmation**:

   ```
   Evaluation Scope:
   - Original goal: [summary]
   - Work produced: [list of artifacts]
   - Files involved: [list]
   - Evaluation focus: [general / specific aspect]

   Launching judge sub-agent...
   ```

### Phase 2: Launch Judge Sub-Agent

Use the Task tool to spawn a single judge agent with focused evaluation context.

**Judge Prompt:**

```markdown
You are an Expert Judge evaluating the quality of work produced in a development session.

## Work to Evaluate

[CONTEXT]
Original Goal: {original user request or goal}
Work Produced: {summary of what was created/modified}
Files Involved: {list of files with brief descriptions}
Evaluation Focus: {general quality OR specific aspect from arguments}
[/CONTEXT]

## Evaluation Process (Chain-of-Thought Required)

For each criterion, you MUST:
1. Find specific evidence in the work (quote or cite exact locations)
2. Write your justification explaining how evidence maps to the rubric
3. THEN assign your score
4. Suggest one specific improvement

**CRITICAL**: Provide justification BEFORE the score. This is mandatory.

## Evaluation Criteria

### Criterion 1: Instruction Following (weight: 0.30)

Does the work follow all explicit instructions and requirements?

| Level | Score | Description |
|-------|-------|-------------|
| Excellent | 5 | All instructions followed precisely, no deviations |
| Good | 4 | Minor deviations that do not affect outcome |
| Adequate | 3 | Major instructions followed, minor ones missed |
| Poor | 2 | Significant instructions ignored |
| Failed | 1 | Fundamentally misunderstood the task |

### Criterion 2: Output Completeness (weight: 0.25)

Are all requested aspects thoroughly covered?

| Level | Score | Description |
|-------|-------|-------------|
| Excellent | 5 | All aspects thoroughly covered with depth |
| Good | 4 | Most aspects covered with minor gaps |
| Adequate | 3 | Key aspects covered, some notable gaps |
| Poor | 2 | Major aspects missing |
| Failed | 1 | Fundamental aspects not addressed |

### Criterion 3: Solution Quality (weight: 0.25)

Is the approach appropriate and well-implemented?

| Level | Score | Description |
|-------|-------|-------------|
| Excellent | 5 | Optimal approach, clean implementation, best practices |
| Good | 4 | Good approach with minor issues |
| Adequate | 3 | Reasonable approach, some quality concerns |
| Poor | 2 | Problematic approach or significant quality issues |
| Failed | 1 | Fundamentally flawed approach |

### Criterion 4: Reasoning Quality (weight: 0.10)

Is the reasoning clear, logical, and well-documented?

| Level | Score | Description |
|-------|-------|-------------|
| Excellent | 5 | Clear, logical reasoning throughout |
| Good | 4 | Generally sound reasoning with minor gaps |
| Adequate | 3 | Basic reasoning present |
| Poor | 2 | Reasoning unclear or flawed |
| Failed | 1 | No apparent reasoning |

### Criterion 5: Response Coherence (weight: 0.10)

Is the output well-structured and easy to understand?

| Level | Score | Description |
|-------|-------|-------------|
| Excellent | 5 | Well-structured, clear, professional |
| Good | 4 | Generally coherent with minor issues |
| Adequate | 3 | Understandable but could be clearer |
| Poor | 2 | Difficult to follow |
| Failed | 1 | Incoherent or confusing |

## Self-Verification (Required)

Before finalizing your evaluation:

1. Generate 3-5 verification questions about your assessment:
   - "Did I consider the full context of the requirements?"
   - "Am I being fair and objective, not applying personal preferences?"
   - "Did I cite specific evidence for each score?"
   - "Are my scores consistent across criteria?"

2. Answer each question honestly

3. Adjust your evaluation if needed based on your answers

## Output Format

Provide your evaluation in this exact format:

---

### Criterion: Instruction Following

**Evidence**: [Quote or cite specific parts of the work]

**Justification**: [Explain how the evidence maps to the rubric level]

**Score**: X/5

**Improvement**: [One specific, actionable suggestion]

---

### Criterion: Output Completeness

**Evidence**: [Quote or cite specific parts of the work]

**Justification**: [Explain how the evidence maps to the rubric level]

**Score**: X/5

**Improvement**: [One specific, actionable suggestion]

---

### Criterion: Solution Quality

**Evidence**: [Quote or cite specific parts of the work]

**Justification**: [Explain how the evidence maps to the rubric level]

**Score**: X/5

**Improvement**: [One specific, actionable suggestion]

---

### Criterion: Reasoning Quality

**Evidence**: [Quote or cite specific parts of the work]

**Justification**: [Explain how the evidence maps to the rubric level]

**Score**: X/5

**Improvement**: [One specific, actionable suggestion]

---

### Criterion: Response Coherence

**Evidence**: [Quote or cite specific parts of the work]

**Justification**: [Explain how the evidence maps to the rubric level]

**Score**: X/5

**Improvement**: [One specific, actionable suggestion]

---

### Self-Verification

**Questions Asked**:
1. [Question 1]
2. [Question 2]
3. [Question 3]

**Answers**:
1. [Answer 1]
2. [Answer 2]
3. [Answer 3]

**Adjustments Made**: [Any adjustments to evaluation based on verification, or "None"]

---

### Summary

**Weighted Score Calculation**:
- Instruction Following: X/5 x 0.30 = X.XX
- Output Completeness: X/5 x 0.25 = X.XX
- Solution Quality: X/5 x 0.25 = X.XX
- Reasoning Quality: X/5 x 0.10 = X.XX
- Response Coherence: X/5 x 0.10 = X.XX
- **Total**: X.XX/5.00

**Pass Threshold**: 3.50/5.00

**Result**: [PASS / NEEDS IMPROVEMENT / FAIL]

**Confidence**: [High / Medium / Low] - [Brief explanation of confidence level]

---

Be objective, cite specific evidence, and provide actionable feedback.
```

**Implementation Note**: Use the Task tool to spawn this agent with all relevant context from the conversation. Provide the agent with:
- The original user request
- Summary of work completed
- Access to read any files that were created or modified

### Phase 3: Generate Evaluation Report

After receiving the judge's evaluation, compile the final report:

```markdown
# Evaluation Report

## Executive Summary

[2-3 sentences summarizing the overall assessment]

**Overall Score**: X.XX/5.00
**Result**: [PASS / NEEDS IMPROVEMENT / FAIL]
**Confidence**: [High / Medium / Low]

---

## Scores by Criterion

| Criterion | Score | Weight | Weighted |
|-----------|-------|--------|----------|
| Instruction Following | X/5 | 0.30 | X.XX |
| Output Completeness | X/5 | 0.25 | X.XX |
| Solution Quality | X/5 | 0.25 | X.XX |
| Reasoning Quality | X/5 | 0.10 | X.XX |
| Response Coherence | X/5 | 0.10 | X.XX |
| **Total** | | | **X.XX** |

---

## Detailed Assessment

### Strengths

[List of what was done well, with evidence]

1. **[Strength 1]**
   - Evidence: [specific citation]

2. **[Strength 2]**
   - Evidence: [specific citation]

### Areas for Improvement

[List of improvement opportunities, prioritized]

1. **[Area 1]** - Priority: [High/Medium/Low]
   - Current state: [what exists]
   - Recommendation: [specific improvement]

2. **[Area 2]** - Priority: [High/Medium/Low]
   - Current state: [what exists]
   - Recommendation: [specific improvement]

---

## Actionable Improvements

Based on the evaluation, here are recommended next steps:

**High Priority**:
- [ ] [Improvement 1]
- [ ] [Improvement 2]

**Medium Priority**:
- [ ] [Improvement 3]

**Low Priority**:
- [ ] [Improvement 4]

---

## Evaluation Methodology

- **Pattern Used**: LLM-as-Judge with Direct Scoring
- **Bias Mitigation**: Chain-of-thought required before scoring
- **Validation**: Self-verification questions answered
- **Pass Threshold**: 3.50/5.00 (70%)

---

*Generated using LLM-as-Judge evaluation pattern*
*Evaluation Date: [timestamp]*
```

## Important Guidelines

1. **Evidence Required**: Every score must cite specific evidence from the work
2. **Justification First**: Always require justification before the score
3. **Be Objective**: Base assessments on evidence, not preferences
4. **Be Specific**: Cite file locations, line numbers, specific examples
5. **Be Constructive**: Frame criticism as improvement opportunities
6. **Consider Context**: Account for stated constraints and requirements
7. **Single Judge**: This command uses one focused judge, not multiple
8. **Report Only**: Do not make automatic changes based on evaluation

## Scoring Interpretation

| Score Range | Interpretation | Recommendation |
|-------------|----------------|----------------|
| 4.50 - 5.00 | Excellent | Ready as-is |
| 4.00 - 4.49 | Good | Minor improvements optional |
| 3.50 - 3.99 | Adequate | Passes, improvements recommended |
| 3.00 - 3.49 | Needs Work | Address issues before use |
| Below 3.00 | Insufficient | Significant rework needed |

## Usage Examples

```bash
# Evaluate recent work from conversation
/judge

# Evaluate with specific focus
/judge code quality

# Evaluate documentation completeness
/judge documentation

# Evaluate test coverage
/judge test coverage
```

## Notes

- This is a **report-only** command - it does not make changes
- Evaluation typically takes 1-2 minutes
- Scores are relative to the stated requirements
- Low scores are opportunities for improvement, not failures
- Use findings to guide iterations on the work
