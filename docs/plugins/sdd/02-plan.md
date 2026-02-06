# /sdd:02-plan - Architecture Planning

Design the technical architecture with multiple approaches, research unknowns, and create a comprehensive implementation plan with data models and API contracts.

- Purpose - Create detailed architecture design with trade-off analysis
- Output - `FEATURE_DIR/plan.md`, `design.md`, `research.md`, `data-model.md`, `contracts.md`

```bash
/sdd:02-plan ["plan specifics or preferences"]
```

## Arguments

Optional architecture preferences or constraints. Examples: "Use libraries instead of direct integration" or "Prioritize simplicity over performance".

## How It Works

1. **Context Loading**: Reads feature specification and project constitution

2. **Research & Exploration** (Stage 2):
   - Launches `researcher` agent to investigate unknown technologies and dependencies
   - Launches 2-3 `code-explorer` agents in parallel to:
     - Find similar features in the codebase
     - Map architecture and abstractions
     - Identify UI patterns and testing approaches
   - Consolidates findings in `FEATURE_DIR/research.md`

3. **Clarifying Questions** (Stage 3):
   - Reviews codebase findings and original requirements
   - Identifies underspecified aspects: edge cases, error handling, integration points
   - Presents questions and waits for user answers

4. **Architecture Design** (Stage 4):
   - Launches 2-3 `software-architect` agents with different focuses:
     - **Minimal changes**: Smallest change, maximum reuse
     - **Clean architecture**: Maintainability, elegant abstractions
     - **Pragmatic balance**: Speed + quality trade-off
   - Each produces a design document with trade-offs

5. **Final Plan** (Stage 5):
   - User selects preferred approach
   - Launches `software-architect` agent to create final design
   - Generates:
     - `FEATURE_DIR/design.md` - Final architecture document
     - `FEATURE_DIR/plan.md` - Implementation plan
     - `FEATURE_DIR/data-model.md` - Entity definitions, relationships, validation rules
     - `FEATURE_DIR/contracts.md` - API endpoints in OpenAPI/GraphQL format

6. **Plan Review** (Stage 6):
   - Reviews implementation plan for unclear areas
   - Resolves high-confidence issues automatically
   - Presents remaining uncertainties to user for clarification

## Usage Examples

```bash
# Start architecture planning
/sdd:02-plan

# With technology preference
/sdd:02-plan Use Redis for caching, prefer PostgreSQL transactions

# With architectural constraint
/sdd:02-plan Must integrate with existing auth system, minimize changes

# Performance focus
/sdd:02-plan Optimize for high throughput, consider async processing
```

## Best practices

- Review research findings - Understand what exists before designing
- Answer architecture questions - Your input shapes the design direction
- Compare all approaches - Each has trade-offs worth considering
- Validate data models early - Entity definitions drive implementation
- Review API contracts - Contracts become the integration specification
