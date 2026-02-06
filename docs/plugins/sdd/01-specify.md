# /sdd:01-specify - Feature Specification

Transform a natural language feature description into a detailed, validated specification with business requirements, user scenarios, and success criteria.

- Purpose - Create comprehensive feature specification from business requirements
- Output - `specs/<feature-name>/spec.md` with validated requirements

```bash
/sdd:01-specify ["feature description"]
```

## Arguments

Natural language description of the feature to build. Examples: "Add OAuth authentication with Google and GitHub providers" or "Create a dashboard for analytics with real-time data".

## How It Works

1. **Feature Naming**: Generates a concise short name (2-4 words) for the feature branch and spec directory

2. **Branch/Directory Management**:
   - Checks for existing branches to determine the next available feature number
   - Creates `specs/<number>-<short-name>/` directory (FEATURE_DIR)
   - Copies spec template to `FEATURE_DIR/spec.md`

3. **Business Analysis**: Launches `business-analyst` agent to:
   - Perform requirements discovery and stakeholder analysis
   - Extract key concepts: actors, actions, data, constraints
   - Write specification following the template structure
   - Mark unclear aspects with [NEEDS CLARIFICATION] (max 3)

4. **Specification Validation**: Launches second `business-analyst` agent to:
   - Fill in `spec-checklist.md` with quality criteria
   - Review spec against each checklist item
   - Document specific issues with quoted spec sections
   - Iterate until all items pass (max 3 iterations)

5. **Clarification Resolution**: If [NEEDS CLARIFICATION] markers remain:
   - Presents max 3 questions with suggested answers in table format
   - Options include A, B, C choices plus Custom input
   - Updates spec with user's chosen answers
   - Re-validates after clarifications

## Usage Examples

```bash
# Define a new feature
/sdd:01-specify Add user authentication with social login support

# Feature with specific scope
/sdd:01-specify Create invoice generation with PDF export and email delivery

# Complex feature
/sdd:01-specify Build real-time collaborative document editing with conflict resolution

# Bug fix specification
/sdd:01-specify Fix payment timeout issues when processing large transactions
```

## Best practices

- Focus on WHAT and WHY - Describe the problem and user needs, not implementation
- Be specific about scope - Clear boundaries prevent scope creep
- Include success criteria - Measurable outcomes help validation
- Answer clarification questions - User input improves spec quality
- Review generated spec - Verify it captures your intent before proceeding
