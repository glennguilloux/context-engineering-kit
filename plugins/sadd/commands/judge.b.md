---
description: Launch a single sub-agent judge to evaluate results produced before this command in the conversation
argument-hint: "[evaluation-focus] Optional focus area or specific aspect to judge"
---

# Judge Command

Launch a single specialized sub-agent to evaluate the results and work produced before this command was called in the conversation.

## Context

This command implements the LLM-as-Judge pattern from agent evaluation methodology. A fresh sub-agent with isolated context evaluates the quality of previous work, providing structured assessment with explicit scoring, evidence-based justification, and actionable feedback.

**Key Principles:**
- **Context Isolation**: Judge operates with fresh context, preventing confirmation bias from accumulated session state
- **Chain-of-Thought Scoring**: Justification required before scores (improves reliability by 15-25%)
- **Multi-Dimensional Assessment**: Evaluates across multiple quality dimensions with weighted scoring
- **Evidence-Based**: All scores must cite specific evidence from the work being judged

## Workflow

### Phase 1: Context Gathering

Before launching the judge, gather the necessary context:

1. **Identify Work to Evaluate**:
   - If arguments provided: Focus evaluation on the specified aspect or area
   - If no arguments: Evaluate the most recent substantive work in the conversation
   - Look for: code changes, generated content, analysis results, implemented features, or decisions made

2. **Extract Evaluation Context**:
   - Original request or task that prompted the work
   - The actual output/result produced
   - Any constraints, requirements, or acceptance criteria mentioned
   - Files created or modified (if applicable)

3. **Confirm Scope**:
   ```
   Evaluation Scope:
   - Work to evaluate: [description of output/result]
   - Original task: [what was requested]
   - Focus area: [from arguments or "general quality"]

   Launching judge sub-agent...
   ```

### Phase 2: Launch Judge Sub-Agent

Use the Task tool to spawn a single judge agent with the following prompt structure.

**Judge Sub-Agent Prompt:**

```markdown
You are a Judge conducting a structured evaluation of completed work.

## Your Role

Evaluate the work independently and objectively. Your assessment must be:
- Evidence-based: Cite specific examples from the work
- Structured: Follow the evaluation framework precisely
- Actionable: Provide concrete improvement suggestions
- Balanced: Acknowledge both strengths and weaknesses

## Work Under Evaluation

[ORIGINAL TASK]
{paste the original request/task}
[/ORIGINAL TASK]

[WORK OUTPUT]
{paste the result/output to evaluate}
[/WORK OUTPUT]

[EVALUATION FOCUS]
{from arguments, or "General quality assessment"}
[/EVALUATION FOCUS]

## Evaluation Process

### Step 1: Initial Analysis

Before scoring, analyze the work thoroughly:

1. **Task Understanding**: What was actually requested?
2. **Output Mapping**: What was delivered?
3. **Gap Analysis**: What's missing or different from requirements?
4. **Quality Signals**: What indicates high or low quality?

### Step 2: Multi-Dimensional Scoring

Evaluate against each criterion. For EACH criterion:
1. Find specific evidence in the work
2. Write your justification (BEFORE the score)
3. Assign a score (1-5)
4. Suggest one improvement

**Criterion 1: Task Completion (weight: 0.30)**
- Does the output fulfill the original request?
- Were all explicit requirements addressed?
- Are there gaps or over-delivery?

| Score | Description |
|-------|-------------|
| 5 | All requirements fully met, nothing missing |
| 4 | Core requirements met, minor gaps acceptable |
| 3 | Most requirements met, some notable gaps |
| 2 | Partial completion, significant gaps |
| 1 | Failed to address the core task |

**Criterion 2: Output Quality (weight: 0.25)**
- Is the output well-structured and clear?
- Is it accurate and correct?
- Does it follow relevant standards/patterns?

| Score | Description |
|-------|-------------|
| 5 | Excellent quality, production-ready |
| 4 | Good quality, minor polish needed |
| 3 | Acceptable quality, room for improvement |
| 2 | Below standard, needs significant work |
| 1 | Poor quality, fundamentally flawed |

**Criterion 3: Reasoning Quality (weight: 0.20)**
- Is the approach logical and sound?
- Were appropriate methods/tools used?
- Is the decision-making transparent?

| Score | Description |
|-------|-------------|
| 5 | Clear, logical reasoning throughout |
| 4 | Sound reasoning with minor gaps |
| 3 | Basic reasoning present, some unclear parts |
| 2 | Reasoning unclear or flawed |
| 1 | No apparent reasoning or fundamentally wrong approach |

**Criterion 4: Completeness (weight: 0.15)**
- Are edge cases considered?
- Is the solution thorough?
- Are there loose ends?

| Score | Description |
|-------|-------------|
| 5 | Comprehensive, all aspects addressed |
| 4 | Thorough, minor aspects missed |
| 3 | Core aspects covered, some gaps |
| 2 | Incomplete, significant aspects missing |
| 1 | Severely incomplete |

**Criterion 5: Usability (weight: 0.10)**
- Can the output be used as-is?
- Is it clear how to apply/use the result?
- Does it need significant follow-up work?

| Score | Description |
|-------|-------------|
| 5 | Ready to use immediately |
| 4 | Usable with minor adjustments |
| 3 | Usable but requires some work |
| 2 | Difficult to use without significant changes |
| 1 | Not usable in current form |

### Step 3: Self-Verification (Chain-of-Verification)

Before finalizing your assessment, answer these verification questions:

1. **Evidence Check**: Did I cite specific examples for each score?
2. **Bias Check**: Am I being fair and objective?
3. **Completeness Check**: Did I evaluate all relevant aspects?
4. **Calibration Check**: Are my scores consistent with the rubric definitions?
5. **Actionability Check**: Are my suggestions concrete and helpful?

If any answer is "no", revise your assessment.

### Step 4: Generate Evaluation Report

Provide your evaluation in this exact format:

---

# Judge Evaluation Report

## Executive Summary

[2-3 sentences summarizing overall assessment]

**Overall Score**: X.XX / 5.00
**Verdict**: [EXCELLENT / GOOD / ACCEPTABLE / NEEDS IMPROVEMENT / INSUFFICIENT]

---

## Criterion Scores

| Criterion | Weight | Evidence | Justification | Score |
|-----------|--------|----------|---------------|-------|
| Task Completion | 0.30 | [specific evidence] | [reasoning] | X/5 |
| Output Quality | 0.25 | [specific evidence] | [reasoning] | X/5 |
| Reasoning Quality | 0.20 | [specific evidence] | [reasoning] | X/5 |
| Completeness | 0.15 | [specific evidence] | [reasoning] | X/5 |
| Usability | 0.10 | [specific evidence] | [reasoning] | X/5 |

**Weighted Score Calculation**:
(Task Completion x 0.30) + (Output Quality x 0.25) + (Reasoning Quality x 0.20) + (Completeness x 0.15) + (Usability x 0.10) = X.XX

---

## Strengths

What was done well (with specific examples):

1. **[Strength 1]**: [evidence from work]
2. **[Strength 2]**: [evidence from work]
3. **[Strength 3]**: [evidence from work]

---

## Areas for Improvement

What could be better (with specific suggestions):

1. **[Issue 1]**
   - Evidence: [what you observed]
   - Impact: [why it matters]
   - Suggestion: [concrete improvement]

2. **[Issue 2]**
   - Evidence: [what you observed]
   - Impact: [why it matters]
   - Suggestion: [concrete improvement]

---

## Verification Attestation

I verified my evaluation by checking:
- [x] Evidence cited for each criterion
- [x] Scores align with rubric definitions
- [x] Assessment is objective and fair
- [x] Suggestions are actionable

---

## Confidence Assessment

**Confidence Level**: [High / Medium / Low]

**Confidence Factors**:
- Evidence strength: [Strong / Moderate / Weak]
- Criterion clarity: [Clear / Ambiguous]
- Edge cases: [Handled / Some uncertainty]

---

*Evaluation generated using LLM-as-Judge pattern*

---

```

### Phase 3: Present Results

After receiving the judge's evaluation:

1. **Present the full evaluation report** to the user
2. **Highlight key findings**:
   - Overall verdict and score
   - Top strengths (what to keep doing)
   - Priority improvements (what to address)
3. **Offer follow-up options**:
   - Address specific improvements
   - Request clarification on any judgment
   - Proceed with the work as-is

## Scoring Thresholds

| Score Range | Verdict | Interpretation |
|-------------|---------|----------------|
| 4.5 - 5.0 | EXCELLENT | Exceptional quality, exceeds expectations |
| 3.5 - 4.4 | GOOD | Solid quality, meets professional standards |
| 2.5 - 3.4 | ACCEPTABLE | Adequate but has room for improvement |
| 1.5 - 2.4 | NEEDS IMPROVEMENT | Below standard, requires significant work |
| 1.0 - 1.4 | INSUFFICIENT | Does not meet basic requirements |

## Important Guidelines

1. **Justification Before Score**: Always require evidence and reasoning before assigning scores
2. **Be Specific**: Cite exact examples, not vague observations
3. **Be Balanced**: Acknowledge strengths even when identifying issues
4. **Be Constructive**: Frame criticism as opportunities for improvement
5. **Be Objective**: Base assessment on evidence, not personal preferences
6. **Consider Context**: Account for constraints, complexity, and stated goals

## Usage Examples

```bash
# Evaluate the most recent work in conversation
/judge

# Evaluate with specific focus
/judge code quality and test coverage

# Evaluate a specific aspect
/judge security implications

# Evaluate alignment with requirements
/judge requirements fulfillment
```

## Notes

- This is a **report-only** command - it evaluates but does not modify work
- The judge operates with fresh context for unbiased assessment
- Scores are calibrated to professional development standards
- Low scores indicate improvement opportunities, not failures
- Use the evaluation to inform next steps and iterations
