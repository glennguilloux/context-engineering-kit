# software-architecture - Quality-Focused Development Guidance

The software-architecture skill provides comprehensive guidance for writing high-quality, maintainable code. It activates automatically when users engage in code writing, architecture design, or code analysis tasks.

## What It Provides

**General Principles**

- **Early Return Pattern**: Prefer early returns over nested conditions for improved readability
- **DRY (Don't Repeat Yourself)**: Create reusable functions and modules to avoid duplication
- **Function Decomposition**: Break down long functions (>80 lines) into smaller, focused units
- **File Size Limits**: Keep files under 200 lines; split when necessary
- **Arrow Functions**: Prefer arrow functions over function declarations

**Library-First Approach**

The skill emphasizes leveraging existing solutions before writing custom code:

```
ALWAYS search for existing solutions before writing custom code:
1. Check npm/package registries for existing libraries
2. Evaluate SaaS solutions and third-party APIs
3. Consider whether custom code is truly justified
```

Custom code is justified only when:
- Implementing specific business logic unique to the domain
- Performance-critical paths require special optimization
- External dependencies would be overkill for the use case
- Security-sensitive code requires full control
- Existing solutions don't meet requirements after thorough evaluation

**Clean Architecture and DDD Principles**

The skill enforces architectural boundaries:

- **Domain Layer**: Business entities independent of frameworks
- **Use Case Layer**: Application-specific business rules
- **Interface Layer**: Controllers, presenters, gateways
- **Infrastructure Layer**: Frameworks, databases, external services

**Naming Conventions**

| Avoid | Prefer | Reason |
|-------|--------|--------|
| `utils.js` | `OrderCalculator.js` | Domain-specific purpose |
| `helpers/misc.js` | `UserAuthenticator.js` | Clear responsibility |
| `common/shared.js` | `InvoiceGenerator.js` | Single bounded context |

**Anti-Patterns to Avoid**

The skill warns against common architectural mistakes:

- **NIH (Not Invented Here) Syndrome**: Don't build custom auth when Auth0/Supabase exists; don't write custom state management instead of Redux/Zustand
- **Mixing Concerns**: Business logic in UI components, database queries in controllers
- **Generic Naming**: `utils.js` with 50 unrelated functions, `helpers/misc.js` as a dumping ground

**Code Quality Standards**

- Proper error handling with typed catch blocks
- Maximum 3 levels of nesting
- Functions under 50 lines when possible
- Files under 200 lines when possible

## When It Activates

The skill automatically applies when:
- Writing new code or features
- Designing system architecture
- Analyzing existing code
- Reviewing code for quality issues
- Refactoring legacy code
