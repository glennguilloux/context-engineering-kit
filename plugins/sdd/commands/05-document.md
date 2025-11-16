---
description: Document completed feature implementation with API guides, architecture updates, and lessons learned
argument-hint: Optional documentation focus areas or specific sections to update
---

# Documentation Update Command: Update Implementation Documentation

Based on current git branch if it written in format `specs/<number-padded-to-3-digits>-<kebab-case-title>`, read feature specification from `specs/<number-padded-to-3-digits>-<kebab-case-title>/**.md` files. It was written during previus phases of SDD workflow (Discovery, Research, Planining, etc.).

## Phase 10: Document Feature Complition

**Goal**: Document feature complition based on tasks list written in `specs/<number-padded-to-3-digits>-<kebab-case-title>/tasks.md` file and implementation results.

**High level actions**:

1. Verify all tasks are completed based on `specs/<number-padded-to-3-digits>-<kebab-case-title>/tasks.md` file.
2. Review codebase for any missing or incomplete functionality.
3. Present to user all missing or incomplete functionality and ask if they want to fix it now or later.
4. If there no missing or incomplete functionality or user accepts the results as is, proceed to the next phase.
5. Read existing documentation in `docs/` to identify missing areas.
6. Document feature in `docs/` folder. Include API, usage guide, and architecture updates.
7. Add or update README.md files to folder that was affected by implementation, if it need. Include there development specific and overral module summary to be used by LLMs during codebase undesrstanding and navigation.
8. Present summary of written documentation to the user.

### Documentation Analysis

1. Review current documentation status:
   - Check `specs/implementation_status.md` for overall project status
   - Review implemented phase document (`specs/phase{N}_implementation_plan.md`)
   - Review `specs/flutter_structurizr_implementation_spec.md` and `specs/flutter_structurizr_implementation_spec_updated.md`
   - Review `specs/testing_plan.md` to ensure it is current given recent test passes, failures, and changes
   - Examine `CLAUDE.md` and `README.md` for project-wide documentation
   - Check for and document any new lessons learned or best practices in CLAUDE.md

2. Analyze implementation and testing results:
   - Review what was implemented in the last phase
   - Review testing results and coverage
   - Identify new best practices discovered during implementation
   - Note any implementation challenges and solutions
   - Cross-reference updated documentation with recent implementation and test results to ensure accuracy

### Documentation Updates

1. Update phase implementation document:
   - Mark completed tasks with ✅ status
   - Update implementation percentages
   - Add detailed notes on implementation approach
   - Document any deviations from original plan with justification
   - Add new sections if needed (lessons learned, best practices)
   - Document specific implementation details for complex components
   - Include a summary of any new troubleshooting tips or workflow improvements discovered during the phase

2. Update implementation status document:
   - Update phase completion percentages
   - Add or update implementation status for components
   - Add notes on implementation approach and decisions
   - Document best practices discovered during implementation
   - Note any challenges overcome and solutions implemented

3. Update implementation specification documents:
   - Mark completed items with ✅ or strikethrough but preserve original requirements
   - Add notes on implementation details where appropriate
   - Add references to implemented files and classes
   - Update any implementation guidance based on experience

4. Update CLAUDE.md and README.md if necessary:
   - Add new best practices
   - Update project status
   - Add new implementation guidance
   - Document known issues or limitations
   - Update usage examples to include new functionality

5. Document new testing procedures:
   - Add details on test files created
   - Include test running instructions
   - Document test coverage
   - Explain testing approach for complex components

### Documentation Formatting and Structure

1. Maintain consistent documentation style:
   - Use clear headings and sections
   - Include code examples where helpful
   - Use status indicators (✅, ⚠️, ❌) consistently
   - Maintain proper Markdown formatting

2. Ensure documentation completeness:
   - Cover all implemented features
   - Include usage examples
   - Document API changes or additions
   - Include troubleshooting guidance for common issues

### Guidelines

- DO NOT CREATE new specification files
- UPDATE existing files in the `specs/` directory
- Maintain consistent documentation style
- Include practical examples where appropriate
- Cross-reference related documentation sections
- Document best practices and lessons learned
- Provide clear status updates on project progress
- Update numerical completion percentages
- Ensure documentation reflects actual implementation

Provide a summary of documentation updates after completion, including:

1. Files updated
2. Major changes to documentation
3. Updated completion percentages
4. New best practices documented
5. Status of the overall project after this phase
