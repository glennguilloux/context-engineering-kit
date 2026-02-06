# /sdd:05-document - Feature Documentation

Document the completed feature implementation with API guides, architecture updates, usage examples, and lessons learned.

- Purpose - Create comprehensive documentation for implemented feature
- Output - Updated documentation in `docs/` folder

```bash
/sdd:05-document ["documentation focus areas"]
```

## Arguments

Optional focus areas for documentation. Examples: "Include API examples and integration guide" or "Focus on troubleshooting common issues".

## How It Works

1. **Context Loading**: Reads from FEATURE_DIR:
   - **Required**: tasks.md (verify completion)
   - **Optional**: plan.md, spec.md, contracts.md, data-model.md

2. **Implementation Verification** (Stage 10):
   - Reviews tasks.md to confirm all tasks marked [X]
   - Identifies incomplete or partially implemented tasks
   - Reviews codebase for missing functionality
   - **Presents issues to user**: Fix now or later?

3. **Documentation Update**: Launches `tech-writer` agent following workflow:
   - Reads all FEATURE_DIR artifacts
   - Reviews files modified during implementation
   - Identifies documentation gaps in `docs/`

4. **Documentation Generation**:
   - API guides and usage examples
   - Architecture updates reflecting implementation
   - README.md updates in affected folders
   - Development specifics for LLM navigation
   - Troubleshooting guidance for common issues

5. **Output Summary**:
   - Files updated
   - Major documentation changes
   - New best practices documented
   - Project status after this phase

## Usage Examples

```bash
# Generate documentation
/sdd:05-document

# API-focused documentation
/sdd:05-document Focus on API documentation with curl examples

# Integration guide
/sdd:05-document Include step-by-step integration guide

# Troubleshooting emphasis
/sdd:05-document Document common errors and solutions
```

## Best practices

- Complete implementation first - Document working code, not plans
- Include working examples - Test all code samples
- Update architecture docs - Reflect actual implementation
- Document gotchas - Share lessons learned during implementation
- Cross-reference specs - Link to original requirements
