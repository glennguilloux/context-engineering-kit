# /sdd:03-tasks - Task Generation

Generate an actionable, dependency-ordered task list organized by user stories with complexity analysis and parallel execution opportunities.

- Purpose - Break down feature into executable tasks with clear dependencies
- Output - `FEATURE_DIR/tasks.md` with phased task list

```bash
/sdd:03-tasks ["task creation guidance"]
```

## Arguments

Optional guidance for task creation. Examples: "Use TDD approach and prioritize MVP features" or "Focus on backend first, then frontend".

## How It Works

1. **Context Loading**: Reads from FEATURE_DIR:
   - **Required**: plan.md (tech stack, architecture), spec.md (user stories with priorities)
   - **Optional**: data-model.md, contracts.md, research.md

2. **Task Generation**: Launches `tech-lead` agent to create tasks following:

   **Implementation Strategy Selection**:
   - **Top-to-Bottom**: Workflow-first when process is clear
   - **Bottom-to-Top**: Building-blocks-first when algorithms are complex
   - **Mixed**: Combine approaches for different parts

   **Phase Structure**:
   - Phase 1: Setup (project initialization)
   - Phase 2: Foundational (blocking prerequisites)
   - Phase 3+: User Stories in priority order (P1, P2, P3...)
   - Final Phase: Polish & cross-cutting concerns

3. **Complexity Analysis**: Each task includes:
   - Clear goal and acceptance criteria
   - Technical approach and patterns to use
   - Dependencies and blocking relationships
   - **Complexity Rating**: Low/Medium/High
   - **Uncertainty Rating**: Low/Medium/High

4. **Risk Review**: After generation:
   - Lists all high-complexity or high-uncertainty tasks
   - Explains what makes each task risky
   - Asks if user wants further decomposition

## Usage Examples

```bash
# Generate tasks with TDD focus
/sdd:03-tasks Use TDD approach, write tests before implementation

# MVP prioritization
/sdd:03-tasks Focus on P1 user stories only for initial release

# Parallel-friendly breakdown
/sdd:03-tasks Maximize parallel execution opportunities

# Sequential approach
/sdd:03-tasks Prefer sequential tasks for easier debugging
```

## Best practices

- Review high-risk tasks - Consider decomposing complex tasks further
- Validate task dependencies - Ensure parallel tasks are truly independent
- Check user story coverage - Each story should have complete task set
- Estimate before starting - Use complexity ratings for planning
- Keep tasks small - 1-2 day tasks are ideal
