# Code Review Agents Reference

Detailed documentation for all six specialized code review agents.

## Overview

The Code Review plugin uses six specialized agents, each focused on a specific aspect of code quality. All agents run in parallel for efficient, comprehensive analysis.

## Agent Architecture

```
Code Review Command
        │
        ├──> Bug Hunter (parallel)
        ├──> Security Auditor (parallel)
        ├──> Test Coverage Reviewer (parallel)
        ├──> Code Quality Reviewer (parallel)
        ├──> Contracts Reviewer (parallel)
        └──> Historical Context Reviewer (parallel)
                │
                ▼
        Aggregated Report
```

## Bug Hunter

### Purpose
Identifies potential bugs, edge cases, and error-prone patterns before they reach production.

### Focus Areas

**Logic Errors**:
- Off-by-one errors
- Boolean logic mistakes
- Incorrect conditionals
- Loop boundary issues

**Null/Undefined Handling**:
- Null pointer dereferences
- Undefined variable access
- Missing null checks
- Optional chaining omissions

**Resource Management**:
- Memory leaks
- File handle leaks
- Database connection leaks
- Unclosed resources

**Error Handling**:
- Unhandled exceptions
- Missing error cases
- Silent failures
- Improper error propagation

**Race Conditions**:
- Concurrent access issues
- Timing-dependent bugs
- Synchronization problems
- Async/await misuse

### Example Findings

```javascript
// Bug: Null pointer risk
function getUserName(user) {
  return user.profile.name; // What if user.profile is null?
}

// Fix suggested:
function getUserName(user) {
  return user?.profile?.name ?? 'Unknown';
}
```

```javascript
// Bug: Off-by-one error
for (let i = 0; i <= array.length; i++) {
  processItem(array[i]); // Will access array[array.length]
}

// Fix suggested:
for (let i = 0; i < array.length; i++) {
  processItem(array[i]);
}
```

### Output Format

```markdown
### Bug Hunter Findings

**Critical Bugs** (2 found):
1. Null pointer risk in UserService.ts:45
   - Line: `return user.profile.name;`
   - Risk: Null dereference if profile is undefined
   - Suggestion: Use optional chaining `user?.profile?.name`

**Potential Issues** (3 found):
2. Resource leak in DatabaseConnection.ts:78
   - Connection not closed in error path
   - Suggestion: Use try-finally or connection.close()
```

## Security Auditor

### Purpose
Identifies security vulnerabilities, attack vectors, and insecure patterns following OWASP guidelines.

### Focus Areas

**Injection Attacks**:
- SQL injection
- NoSQL injection
- Command injection
- LDAP injection

**Cross-Site Scripting (XSS)**:
- Reflected XSS
- Stored XSS
- DOM-based XSS
- Content injection

**Authentication & Authorization**:
- Weak authentication
- Missing authorization checks
- Session management issues
- Token handling problems

**Data Exposure**:
- Sensitive data in logs
- API keys in code
- Credentials exposure
- PII handling issues

**Cryptography**:
- Weak algorithms
- Hardcoded secrets
- Insecure random generation
- Certificate validation

**CSRF & SSRF**:
- Missing CSRF tokens
- SSRF vulnerabilities
- Origin validation

### Example Findings

```javascript
// Security Risk: SQL Injection
const query = `SELECT * FROM users WHERE id = ${userId}`;
db.query(query);

// Fix suggested: Use parameterized queries
const query = 'SELECT * FROM users WHERE id = ?';
db.query(query, [userId]);
```

```javascript
// Security Risk: XSS vulnerability
element.innerHTML = userInput;

// Fix suggested: Use textContent or sanitization
element.textContent = userInput;
// or
element.innerHTML = DOMPurify.sanitize(userInput);
```

### Output Format

```markdown
### Security Audit

**Critical Vulnerabilities** (1 found):
1. SQL Injection risk in UserRepository.ts:67
   - Severity: Critical
   - OWASP: A03:2021 - Injection
   - Code: `db.query(\`SELECT * FROM users WHERE id = ${id}\`)`
   - Exploit: Attacker can inject SQL commands
   - Fix: Use parameterized queries or ORM

**High Risk** (2 found):
2. XSS vulnerability in CommentDisplay.tsx:34
   - Severity: High
   - OWASP: A03:2021 - Injection
   - Code: `<div dangerouslySetInnerHTML={{__html: comment}}>`
   - Fix: Sanitize with DOMPurify or use textContent
```

## Test Coverage Reviewer

### Purpose
Evaluates test coverage and suggests missing test cases for robust quality assurance.

### Focus Areas

**Coverage Metrics**:
- Line coverage
- Branch coverage
- Function coverage
- Statement coverage

**Test Types**:
- Unit tests
- Integration tests
- E2E tests
- Performance tests

**Test Quality**:
- Meaningful assertions
- Test independence
- Clear test names
- AAA pattern compliance

**Missing Tests**:
- Edge cases
- Error paths
- Boundary conditions
- Happy path vs. sad path

### Example Findings

```typescript
// Code under test
function divide(a: number, b: number): number {
  return a / b;
}

// Existing test
test('divides two numbers', () => {
  expect(divide(10, 2)).toBe(5);
});

// Missing tests identified:
// - Division by zero
// - Negative numbers
// - Decimal results
// - Very large numbers
```

### Output Format

```markdown
### Test Coverage Analysis

**Coverage Summary**:
- Overall: 45%
- Target: 80%
- Gap: 35%

**Missing Test Cases**:

1. UserAuthService.login() - No error case tests
   - Missing: Invalid credentials test
   - Missing: Account locked test
   - Missing: Rate limiting test

2. OrderProcessor.process() - No edge case tests
   - Missing: Empty order test
   - Missing: Concurrent order test
   - Missing: Payment failure test

**Test Quality Issues**:
- Tests in UserService.test.ts not isolated (shared state)
- Magic numbers in assertions (use constants)
- Test names unclear (use descriptive names)
```

## Code Quality Reviewer

### Purpose
Assesses code structure, readability, maintainability, and adherence to best practices.

### Focus Areas

**Complexity**:
- Cyclomatic complexity
- Cognitive complexity
- Nesting depth
- Function length

**Design Principles**:
- SOLID principles
- DRY (Don't Repeat Yourself)
- YAGNI (You Aren't Gonna Need It)
- Separation of concerns

**Code Smells**:
- Long methods
- Large classes
- Duplicate code
- Magic numbers
- God objects

**Naming & Style**:
- Meaningful names
- Consistent conventions
- Clear intent
- Self-documenting code

**Documentation**:
- Complex logic comments
- API documentation
- README updates
- Inline explanations

### Example Findings

```javascript
// Code smell: Long function with high complexity
function processOrder(order) {
  if (order.type === 'express') {
    if (order.amount > 100) {
      if (order.user.isPremium) {
        // 50 more lines...
      }
    }
  }
  // Cyclomatic complexity: 18
}

// Suggested refactoring:
function processOrder(order) {
  const processor = OrderProcessorFactory.create(order);
  return processor.process();
}
```

### Output Format

```markdown
### Code Quality Assessment

**Quality Score**: 6/10

**Complexity Issues** (High Priority):
1. OrderProcessor.process() - Complexity: 18 (max: 10)
   - Location: src/order/OrderProcessor.ts:45-130
   - Lines: 85
   - Nesting depth: 5
   - Suggestion: Extract methods, use early returns

**Code Smells** (Medium Priority):
2. Duplicate code in UserService and AdminService
   - Lines: UserService.ts:34-56, AdminService.ts:78-100
   - Suggestion: Extract to shared AuthHelper

3. Magic numbers in PaymentProcessor
   - Multiple hardcoded values (100, 0.15, 30)
   - Suggestion: Extract to constants

**Design Issues**:
4. API logic in Controller (SRP violation)
   - Move business logic to Service layer
   - Controller should only handle HTTP concerns
```

## Contracts Reviewer

### Purpose
Reviews API contracts, interfaces, type definitions, and data models for consistency and correctness.

### Focus Areas

**API Contracts**:
- Endpoint definitions
- Request/response schemas
- HTTP status codes
- Error responses

**Type Safety**:
- TypeScript types
- Interface definitions
- Generic constraints
- Type guards

**Breaking Changes**:
- API compatibility
- Schema changes
- Deprecated fields
- Version management

**Consistency**:
- Naming conventions
- Response formats
- Error structures
- Documentation

### Example Findings

```typescript
// Contract Issue: Inconsistent response format
// Endpoint 1
{ data: user, status: 'success' }

// Endpoint 2
{ result: user, error: null }

// Suggested: Standardize
interface ApiResponse<T> {
  data: T;
  error: string | null;
  status: number;
}
```

### Output Format

```markdown
### Contract Review

**Breaking Changes** (Critical):
1. User API response format changed
   - Old: `{ id, name, email }`
   - New: `{ userId, fullName, emailAddress }`
   - Impact: All clients must update
   - Recommendation: Version API or provide backward compatibility

**Type Safety Issues**:
2. Missing type definition for Payment interface
   - File: types/payment.ts
   - Using `any` instead of specific types
   - Suggestion: Define proper interface

**Inconsistencies**:
3. Error response format varies across endpoints
   - /users returns: `{ error: "message" }`
   - /orders returns: `{ message: "error", code: 400 }`
   - Suggestion: Standardize error format
```

## Historical Context Reviewer

### Purpose
Analyzes changes relative to codebase history, patterns, and evolution to ensure consistency.

### Focus Areas

**Pattern Consistency**:
- Existing code patterns
- Architectural style
- Naming conventions
- Project structure

**Historical Analysis**:
- Similar past changes
- Previous bug patterns
- Refactoring history
- Code evolution

**Technical Debt**:
- Deviation from standards
- Architectural drift
- Pattern violations
- Accumulating complexity

**Best Practices**:
- Project conventions
- Team decisions
- Documented standards
- Learned lessons

### Example Findings

```typescript
// Historical Context: Different pattern than existing
// New code uses different pattern:
class UserService {
  constructor(private db: Database) {}
}

// Existing pattern in codebase:
class OrderService {
  private db: Database;
  static create(db: Database) {
    return new OrderService(db);
  }
}

// Suggestion: Follow existing factory pattern for consistency
```

### Output Format

```markdown
### Historical Context Analysis

**Pattern Deviations**:
1. Authentication implementation differs from existing pattern
   - Existing: Session-based auth with cookies
   - New code: JWT tokens with localStorage
   - Inconsistency risk: Mixed authentication strategies
   - Recommendation: Align with existing session-based approach or migrate all

**Similar Past Issues**:
2. Similar bug fixed in commit abc123 (3 months ago)
   - Pattern: Race condition in cache invalidation
   - Previous fix: Added distributed lock
   - Current code: Same pattern reappearing
   - Suggestion: Apply same locking pattern

**Technical Debt**:
3. Adding to generic utils/ folder
   - Project moved away from utils/ pattern (see ADR-003)
   - Current structure: Domain-driven folders
   - Suggestion: Place in appropriate domain folder
```

## Agent Coordination

### Parallel Execution

All agents run simultaneously for efficiency:

```
Time: 0s ──────────────────────────> 120s

Bug Hunter:           ████████████████░░░░
Security Auditor:     ██████████████████░░
Test Coverage:        ████████████████░░░░
Code Quality:         ████████████████░░░░
Contracts:            ██████████████░░░░░░
Historical Context:   ████████████████░░░░
                                    └─ Aggregation
```

### Report Aggregation

After all agents complete:

1. **Collect Findings**: Gather all agent reports
2. **Deduplicate**: Remove overlapping findings
3. **Prioritize**: Sort by severity (Critical → Low)
4. **Cross-Reference**: Link related findings
5. **Format**: Generate unified report

### Consensus Building

When agents have overlapping concerns:

```
Bug Hunter: "Potential race condition in cache"
Security: "Race condition enables cache poisoning attack"
Historical: "Similar issue fixed in commit abc123"

→ Combined Finding:
  Severity: Critical (elevated from Bug Hunter's "High")
  Context: Security implications + historical precedent
  Solution: Apply pattern from previous fix
```

## Customizing Agent Behavior

### Via CLAUDE.md

Configure agent focus in project memory:

```markdown
## Code Review Configuration

### Bug Hunter
- Focus on async/await patterns (known project issue area)
- Strict null checking (TypeScript strict mode)
- Flag all `any` types

### Security Auditor
- Paranoid mode for payment processing code
- Flag all external API calls for review
- Require security tests for auth changes

### Test Coverage
- Minimum 80% coverage required
- Integration tests for all API endpoints
- Performance tests for queries

### Code Quality
- Max cyclomatic complexity: 10
- Max function length: 50 lines
- Max file length: 300 lines
- Enforce domain-driven structure

### Contracts
- OpenAPI spec must be updated
- Breaking changes require version bump
- All public APIs need documentation

### Historical Context
- Follow patterns in existing auth/ folder
- Maintain consistency with ADR decisions
- Flag deviations from team conventions
```

## Agent Limitations

### What Agents Can't Do

- **Runtime Analysis**: Can't execute code
- **Load Testing**: Can't measure performance under load
- **Integration Testing**: Can't test system integration
- **Business Logic**: Can't validate business rules
- **UX Review**: Can't evaluate user experience

### Complementary Tools

Use other tools for:
- **Performance**: Profilers, benchmarks
- **Integration**: Integration test suites
- **Security**: Penetration testing
- **Load**: Load testing tools
- **Business**: Domain expert review

## Further Reading

- [Commands Reference](./commands.md) - How to use review commands
- [Usage Examples](./usage-examples.md) - Real-world scenarios
- [Installation Guide](./installation.md) - Setup instructions
- [Main Documentation](./README.md) - Overview and best practices
