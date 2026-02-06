# /sdd:00-setup - Project Constitution Setup

Create or update the project constitution that establishes development principles, coding standards, and governance rules for all subsequent development.

- Purpose - Establish project-wide development standards and principles
- Output - `specs/constitution.md` and template files for specs, plans, and tasks

```bash
/sdd:00-setup ["principle inputs or constitution parameters"]
```

## Arguments

Optional principle inputs such as technology stack, architectural patterns, or development guidelines. Examples: "Use NestJS, follow SOLID and Clean Architecture" or "Python with FastAPI, prioritize type safety".

## How It Works

1. **Template Initialization**: Downloads and creates the constitution template at `specs/constitution.md` along with spec, plan, and tasks templates in `specs/templates/`

2. **Value Collection**: Gathers concrete values for template placeholders from:
   - User input (conversation)
   - Existing repo context (README, docs, CLAUDE.md)
   - Prior constitution versions if present

3. **Constitution Drafting**: Fills the template with:
   - Project name and description
   - Development principles (each with name, rules, and rationale)
   - Governance section with amendment procedures and versioning policy
   - Compliance review expectations

4. **Consistency Propagation**: Ensures all dependent templates align with updated principles:
   - `specs/templates/plan-template.md` - Architecture planning template
   - `specs/templates/spec-template.md` - Feature specification template
   - `specs/templates/tasks-template.md` - Task breakdown template
   - `specs/templates/spec-checklist.md` - Specification quality checklist

5. **Sync Impact Report**: Documents version changes, modified principles, and any follow-up TODOs

## Usage Examples

```bash
# Initialize with core principles
/sdd:00-setup Use React with TypeScript, follow atomic design patterns

# Set up for backend project
/sdd:00-setup NestJS, PostgreSQL, follow hexagonal architecture

# Minimal setup (will prompt for details)
/sdd:00-setup

# Update existing constitution with new principle
/sdd:00-setup Add principle: All APIs must be versioned
```

## Best practices

- Be specific about tech stack - Clear technology choices improve downstream decisions
- Include architectural patterns - Patterns like Clean Architecture guide agent decisions
- Review generated templates - Ensure templates align with your team's workflow
- Version your constitution - Use semantic versioning for governance changes
