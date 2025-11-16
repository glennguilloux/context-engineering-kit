# Reflexion Plugin - Usage Examples

Real-world scenarios demonstrating effective use of the Reflexion plugin.

## Table of Contents

- [Basic Workflows](#basic-workflows)
- [Feature Development](#feature-development)
- [Bug Investigation](#bug-investigation)
- [Architecture Design](#architecture-design)
- [Code Quality](#code-quality)
- [Integration with Other Plugins](#integration-with-other-plugins)
- [Advanced Patterns](#advanced-patterns)

## Basic Workflows

### Example 1: Quick Quality Check

**Scenario**: You've implemented a simple utility function and want to verify it's correct.

```bash
# Implement the function
> claude "create a function to format phone numbers to (XXX) XXX-XXXX format"

# Quick reflection
> /reflexion:reflect
```

**Expected Flow**:
1. Reflexion triages as "Quick Path" (simple task)
2. Performs 5-second verification
3. Either confirms quality or suggests specific improvements
4. No memorization needed for trivial utility

**When Reflection Finds Issues**:
```
Reflection Output:
- ✅ Function works for standard US numbers
- ⚠️ No validation for input format
- ⚠️ Doesn't handle international numbers
- Refined version includes input validation and clear error messages
```

### Example 2: Comprehensive Feature Review

**Scenario**: Complex authentication feature needs thorough review.

```bash
# Implement authentication
> claude "implement OAuth2 authentication with Google and GitHub providers"

# Comprehensive multi-perspective review
> /reflexion:critique

# Address findings
> claude "implement the Critical and High priority items from the critique"

# Quick check
> /reflexion:reflect

# Save learnings
> /reflexion:memorize
```

**Expected Critique Output**:
```
Executive Summary:
Overall Quality Score: 7.3/10 - Good implementation with security improvements needed

Judge Scores:
- Requirements Validator: 8/10 - All requirements met, one edge case missing
- Solution Architect: 7/10 - Good architecture, session management could improve
- Code Quality Reviewer: 7/10 - Clean code, needs error handling improvements

Critical Issues:
- OAuth tokens stored in localStorage (security risk)
  → Use httpOnly cookies for token storage

High Priority:
- Missing CSRF protection
- No token refresh mechanism
```

## Feature Development

### Example 3: Implement → Reflect → Memorize Pattern

**Scenario**: Building a new payment integration.

```bash
# Specify the feature
> claude "implement Stripe payment processing with subscription support"

# Implementation happens...

# Reflect on implementation
> /reflexion:reflect performance
```

**Reflection finds optimization opportunity**:
```
Issue Identified: Stripe API called synchronously in request handler
Solution: Move to background job queue for better response time
Performance Analysis:
- Current: 2-3s response time
- Improved: <200ms with async processing
```

```bash
# Apply improvement
> claude "refactor payment processing to use background jobs"

# Confirm improvement
> /reflexion:reflect

# Save pattern
> /reflexion:memorize
```

**Memorized Knowledge** (added to CLAUDE.md):
```markdown
## Development Guidelines

### API Integration Patterns

- For third-party API calls (Stripe, SendGrid, etc.) that take >500ms:
  - Move to background job queue (Bull/BullMQ)
  - Return immediate response with job ID
  - Use webhooks for status updates
  - Improves API response time from ~2s to <200ms
  - Example: Stripe payment processing, email sending
```

### Example 4: Iterative Design Refinement

**Scenario**: Designing a caching strategy.

```bash
# Initial design
> claude "design a caching strategy for our product catalog API"

# Get multi-perspective review
> /reflexion:critique

# Debate reveals issues
> claude "update caching design based on critique"

# Re-evaluate
> /reflexion:critique

# Finalize
> /reflexion:memorize --section="Architecture Decisions"
```

**First Critique**:
```
Requirements Validator: Meets performance requirements but unclear invalidation strategy
Solution Architect: Redis good choice, but missing cache warming strategy
Code Quality: Need monitoring and fallback mechanisms
```

**Second Critique** (after refinement):
```
Requirements Validator: 9/10 - All concerns addressed
Solution Architect: 8/10 - Comprehensive solution with good trade-offs
Code Quality: 9/10 - Includes monitoring, fallback, and cache warming

Verdict: ✅ Ready to ship
```

## Bug Investigation

### Example 5: Reflect on Bug Fix

**Scenario**: Fixed a complex race condition bug.

```bash
# Fix the bug
> claude "fix the race condition in order processing when multiple requests arrive simultaneously"

# Reflect on the fix
> /reflexion:reflect security
```

**Reflection Output**:
```
✅ Race condition properly handled with distributed lock
✅ Idempotency key prevents duplicate processing
⚠️ Lock timeout might be too short (5s) for large orders
⚠️ No monitoring for lock timeouts

Refined suggestions:
- Increase timeout to 30s
- Add monitoring for lock contention
- Include retry mechanism with exponential backoff
```

```bash
# Apply improvements
> claude "implement the suggested improvements"

# Save the pattern
> /reflexion:memorize
```

**Memorized Anti-Pattern** (added to CLAUDE.md):
```markdown
## Strategies and Hard Rules

### Anti-patterns and Pitfalls

#### Distributed Lock Patterns

**Problem**: Race conditions in order processing
**Solution**: Use distributed lock (Redis/Redlock) with proper timeout

**Anti-pattern**: Short lock timeout (5s) insufficient for complex operations
**Correct approach**:
- Set timeout based on 99th percentile operation time
- Add monitoring for lock contention
- Implement retry with exponential backoff
- Use idempotency keys as additional safety

**Evidence**: Prevented duplicate order processing in production (2025-01-15)
```

## Architecture Design

### Example 6: Evaluate Architecture Decisions

**Scenario**: Choosing between monolith and microservices.

```bash
# Propose architecture
> claude "design the architecture for our e-commerce platform with 3 developers, expecting 10K users in first year"

# Get architecture review
> /reflexion:critique --focus=architecture
```

**Critique Highlights**:
```
Solution Architect: 6/10

Chosen Approach: Microservices with 5 separate services

**Issues**:
- Over-engineered for team size (3 developers)
- Premature optimization for scale (10K users achievable with monolith)
- Operational complexity (Docker, K8s, service mesh) disproportionate to benefits

Alternative Approach Recommended: Modular Monolith
- Pros: Simpler deployment, easier debugging, faster development
- Cons: Requires more discipline for modularity
- Recommendation: Better fit for team size and scale

**Suggested Path**:
1. Start with modular monolith
2. Clear module boundaries (like microservices)
3. Extract services later if needed (after validating scale requirements)
```

```bash
# Refine based on feedback
> claude "redesign as modular monolith with clear service boundaries"

# Confirm design
> /reflexion:critique --focus=architecture

# Save decision rationale
> /reflexion:memorize --section="Architecture Decisions"
```

## Code Quality

### Example 7: Refactoring Complex Code

**Scenario**: Legacy code needs refactoring.

```bash
# Review the code
> claude "review and refactor src/order-processor.ts - it's become hard to maintain"

# Get quality assessment
> /reflexion:critique
```

**Code Quality Reviewer Output**:
```
Code Quality Score: 4/10

Issues Found:
1. Function complexity - 85 lines, cyclomatic complexity 15
   - Location: processOrder() at src/order-processor.ts:45
   - Severity: High

2. Mixed concerns - business logic + database + email in one function
   - Violates Single Responsibility Principle
   - Severity: High

3. No error handling for external services (payment, email)
   - Severity: Critical

Refactoring Recommendations:

1. Extract Methods (Priority: High)
   Current code: [85-line function]
   Suggested refactoring:
   - validateOrder()
   - processPayment()
   - updateInventory()
   - sendConfirmation()
   Benefits: Testability, readability, reusability
   Effort: Medium

2. Introduce Service Layer (Priority: High)
   - OrderService (business logic)
   - PaymentService (payment processing)
   - NotificationService (email/SMS)
   Benefits: Separation of concerns, testability
   Effort: Large
```

```bash
# Apply refactorings incrementally
> claude "apply refactoring #1 - extract methods"
> /reflexion:reflect

> claude "apply refactoring #2 - introduce service layer"
> /reflexion:reflect

# Final quality check
> /reflexion:critique

# Save patterns
> /reflexion:memorize
```

### Example 8: Preventing Code Smells

**Scenario**: Writing new feature with quality focus.

```bash
# Implement feature
> claude "add user profile customization with avatar, bio, preferences"

# Proactive quality check
> /reflexion:reflect
```

**Reflection Catches Issues Early**:
```
Code Smells Detected:
- Creating generic utils/helpers.js with mixed functionality
- Magic strings for preference keys

Suggested Improvements:
✅ Use domain-specific naming:
   - UserProfileService instead of profileUtils.js
   - UserPreferences domain object with typed keys

✅ Extract preference keys to enum/constants:
   - PREFERENCE_KEYS = { THEME: 'theme', LANGUAGE: 'language' }

✅ Follow existing architecture pattern:
   - /user/domain/UserProfile.ts
   - /user/application/UserProfileService.ts
```

```bash
# Apply before committing
> claude "implement the suggested improvements"

# Confirm quality
> /reflexion:reflect

# Save as checklist
> /reflexion:memorize --section="Code Quality Standards"
```

## Integration with Other Plugins

### Example 9: Reflexion + SDD Workflow

**Scenario**: Complete feature development with specifications.

```bash
# Specify feature
> /sdd:01-specify "Add real-time notifications"

# Plan implementation
> /sdd:02-plan

# Implement
> /sdd:04-implement

# Reflect on implementation
> /reflexion:critique

# Address issues found
> claude "address the high priority items from critique"

# Verify fixes
> /reflexion:reflect

# Document with learnings
> /reflexion:memorize

> /sdd:05-document
```

### Example 10: Reflexion + Code Review Plugin

**Scenario**: Pre-commit quality assurance.

```bash
# Review local changes
> /code-review:review-local-changes

# Get additional perspective
> /reflexion:critique

# Apply both sets of feedback
> claude "address findings from code review and critique"

# Final verification
> /reflexion:reflect

# Save patterns for future
> /reflexion:memorize

# Commit
> /git:commit
```

### Example 11: Reflexion + Kaizen for Problem Solving

**Scenario**: Complex bug requires root cause analysis.

```bash
# Analyze root cause
> /kaizen:why "Why are users experiencing timeout errors?"

# Implement fix
> claude "implement the solution based on root cause analysis"

# Verify fix quality
> /reflexion:reflect security

# Get comprehensive review
> /reflexion:critique

# Save the pattern
> /reflexion:memorize --section="Strategies and Hard Rules"
```

## Advanced Patterns

### Example 12: Fact-Checking Performance Claims

**Scenario**: Performance optimization with verification.

```bash
# Optimize code
> claude "optimize the product search query performance"

# Reflection fact-checks claims
> /reflexion:reflect performance
```

**Reflection Fact-Checking**:
```
Claim Made: "Using Map is 50% faster than Object for this use case"

❌ Fact-Check Failed:
- No benchmark provided
- Dataset size matters (Map better for 10K+ items, Object better for <100)
- No evidence this dataset exceeds threshold

Verification Required:
1. Measure actual dataset size in production
2. Run benchmark comparing both approaches
3. Profile memory usage

Refined Statement:
"For datasets >10K items, Map performs better than Object. Current product catalog has ~500 items, so Object is more appropriate."
```

```bash
# Run benchmarks
> claude "create benchmarks comparing Map vs Object for our dataset size"

# Re-reflect with evidence
> /reflexion:reflect performance

# Memorize verified finding
> /reflexion:memorize
```

### Example 13: Preventing NIH Syndrome

**Scenario**: Building custom solution when library exists.

```bash
# Initial implementation
> claude "create date formatting utilities for our application"

# Reflection catches NIH syndrome
> /reflexion:reflect
```

**Library Check Triggered**:
```
⚠️ STOP: Library Check

You're implementing: Date/time formatting utilities

Existing Solutions:
- date-fns (lightweight, tree-shakeable)
- dayjs (moment.js alternative)
- luxon (modern, timezone-aware)

Decision Framework:
❌ Custom implementation not justified
- Common utility function
- Well-solved problem
- Maintenance burden
- Testing overhead

✅ Recommended: Use date-fns
- Matches requirements
- Well-tested
- Active maintenance
- Smaller bundle size

Custom Code IS Justified When:
- Business-specific date display rules
- Unique formatting requirements
- Integration with proprietary calendar system
```

```bash
# Use library instead
> claude "use date-fns for date formatting instead of custom implementation"

# Save pattern
> /reflexion:memorize
```

### Example 14: Clean Architecture Enforcement

**Scenario**: Maintaining architectural boundaries.

```bash
# Implement feature
> claude "add order export to CSV feature"

# Architecture check
> /reflexion:reflect
```

**Architecture Violations Detected**:
```
⚠️ Architecture Violations:

1. Business logic in controller:
   - OrderController directly formatting CSV
   - Should be in domain/application layer

2. Generic naming:
   - utils/exportHelper.js
   - Should be: order/application/OrderExportService.ts

3. Infrastructure dependency in domain:
   - Order entity importing file system utilities
   - Domain should be infrastructure-agnostic

Correct Architecture:
/order/
  domain/
    Order.ts (entity)
    OrderExportFormat.ts (value object)
  application/
    OrderExportService.ts (use case)
    CsvFormatter.ts (implementation)
  infrastructure/
    OrderCsvExporter.ts (file system integration)
  interfaces/
    OrderController.ts (HTTP handler)
```

```bash
# Refactor to follow Clean Architecture
> claude "refactor following the suggested architecture"

# Verify compliance
> /reflexion:reflect

# Document architecture pattern
> /reflexion:memorize --section="Architecture Decisions"
```

### Example 15: Continuous Learning Loop

**Scenario**: Building expertise over time.

**Week 1**:
```bash
> claude "implement user authentication"
> /reflexion:critique
> /reflexion:memorize
```

**CLAUDE.md gains**:
```markdown
## Security Considerations
- Always use bcrypt for password hashing (min cost factor: 12)
- Store tokens in httpOnly cookies, not localStorage
- Implement CSRF protection for cookie-based auth
```

**Week 2**:
```bash
> claude "add OAuth2 authentication"
> /reflexion:critique  # Uses Week 1 learnings
> /reflexion:memorize
```

**CLAUDE.md accumulates**:
```markdown
## Security Considerations
- [existing auth items]
- OAuth state parameter prevents CSRF
- Validate redirect URIs against whitelist
- Short-lived access tokens (15min) + refresh tokens
```

**Week 3**:
```bash
> claude "implement API key authentication for third-party integrations"
> /reflexion:critique  # Uses Week 1 & 2 learnings
> /reflexion:memorize
```

**CLAUDE.md evolves**:
```markdown
## Security Considerations
- [existing auth items]
- API keys: Hash before storage (like passwords)
- Rate limiting per API key (100 req/min)
- Key rotation mechanism (notify before expiry)
- Audit log for all API key usage
```

**Result**: Each project builds on previous learnings, creating compounding improvements.

## Tips for Effective Usage

### When to Use Each Command

**Use `/reflexion:reflect` for:**
- Quick quality checks (30-60 seconds)
- Single-aspect focus (security, performance)
- After each sub-task in complex features
- Before committing code

**Use `/reflexion:critique` for:**
- Comprehensive review (2-5 minutes)
- Important architectural decisions
- Before pull requests
- Complex features requiring multiple perspectives

**Use `/reflexion:memorize` for:**
- After solving complex problems
- When discovering reusable patterns
- Following critique sessions
- Accumulating domain knowledge

### Quality Workflow Examples

**Quick Iteration**:
```bash
implement → reflect → fix → commit
```

**Standard Feature**:
```bash
implement → reflect → memorize → commit → PR
```

**Complex Feature**:
```bash
design → critique → refine → implement → reflect → critique → memorize → document → PR
```

**Critical Feature**:
```bash
design → critique → refine → critique again → implement with TDD → reflect → code review → critique → memorize → document → PR
```

### Common Mistakes to Avoid

1. **Over-reflection**: Don't reflect on trivial tasks
2. **Under-memorization**: Save valuable patterns for future use
3. **Ignoring critique**: Act on findings or document why you disagree
4. **Premature optimization**: Measure first (as reflection will remind you)
5. **Generic memorization**: Keep insights specific and actionable

## Measuring Improvement

Track the effectiveness of Reflexion usage:

### Metrics to Monitor

- **Bug Reduction**: Fewer bugs caught in review/production
- **Code Quality**: Improved scores from code review plugin
- **Velocity**: Faster implementation after building up CLAUDE.md
- **Consistency**: More uniform code patterns across features
- **Learning Rate**: Time to proficiency on new technologies

### Success Indicators

**Good Reflexion Practice**:
- CLAUDE.md grows steadily with actionable insights
- Critique verdicts improve over time (more "Ready to ship")
- Less iteration needed (high confidence on first reflection)
- Patterns from memory are actually reused

**Needs Adjustment**:
- CLAUDE.md becomes vague or bloated
- Critique always finds same issues (not learning)
- Reflection becomes mechanical checklist
- Memorized patterns are never referenced

## Next Steps

- Review [Commands Reference](./commands.md) for detailed command documentation
- Read [Installation Guide](./installation.md) for setup instructions
- Explore [Plugin README](./README.md) for overview and best practices
- Check [Scientific Foundation](./README.md#scientific-foundation) for research papers
