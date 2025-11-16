# Plugin Documentation Index

Quick reference index for all plugin documentation in the Context Engineering Kit.

## How to Use This Index

- ✅ = Documentation complete
- 🚧 = Documentation in progress
- ⭐ = Recommended starting point
- 📚 = Complex plugin with extensive documentation

## Main Documentation

- ⭐ **[Plugin Overview](./README.md)** - Start here for overview of all 12 plugins

## Complete Plugin Documentation

### Reflexion Plugin ✅ 📚
**Path**: `/docs/plugins/reflexion/`

Self-refinement framework for iterative improvement with 8-21% quality gains.

- ⭐ [Overview](./reflexion/README.md) - Plugin introduction and quick start
- [Installation](./reflexion/installation.md) - Setup guide with verification
- [Commands Reference](./reflexion/commands.md) - Complete command documentation (reflect, critique, memorize)
- [Usage Examples](./reflexion/usage-examples.md) - 15 real-world scenarios

**Key Features**: Self-refinement, multi-agent critique, memory updates
**Use When**: Improving output quality, verifying solutions, capturing learnings

### Code Review Plugin ✅ 📚
**Path**: `/docs/plugins/code-review/`

Multi-agent code review with 6 specialized reviewers.

- ⭐ [Overview](./code-review/README.md) - Plugin introduction and agents
- [Installation](./code-review/installation.md) - Setup with GitHub CLI
- [Commands Reference](./code-review/commands.md) - review-local-changes, review-pr
- [Agents Reference](./code-review/agents.md) - Detailed agent descriptions (Bug Hunter, Security Auditor, etc.)
- [Usage Examples](./code-review/usage-examples.md) - 12 comprehensive scenarios

**Key Features**: 6 specialized agents, parallel review, comprehensive reports
**Use When**: Before commits, before PRs, code quality checks

### Git Plugin 🚧
**Path**: `/docs/plugins/git/`

Streamlined Git operations with conventional commits.

- ⭐ [Overview](./git/README.md) - Plugin introduction and commit format
- [Installation](./git/installation.md) - Setup with GitHub CLI
- ⚠️ **Missing**: commands.md - Command reference
- ⚠️ **Missing**: usage-examples.md - Real-world examples

**Key Features**: Conventional commits with emoji, PR management, issue analysis
**Use When**: Committing code, creating PRs, analyzing issues

## Plugin Documentation To Create

### High Priority

#### Spec-Driven Development (SDD) 📚
**Path**: `/docs/plugins/sdd/`

Comprehensive Spec-Driven workflow with specialized agents.

**Needs**: 7 files
- ⚠️ README.md - Overview and workflow introduction
- ⚠️ installation.md - Setup guide
- ⚠️ commands.md - 7 commands reference (setup, specify, plan, tasks, implement, document, brainstorm)
- ⚠️ agents.md - 7 specialized agents (architect, explorer, reviewer, etc.)
- ⚠️ workflow.md - Complete workflow documentation
- ⚠️ best-practices.md - In-depth best practices
- ⚠️ usage-examples.md - Real-world scenarios

**Why High Priority**: Most complex plugin, highest value for structured development

### Medium Priority

#### Test-Driven Development (TDD)
**Path**: `/docs/plugins/tdd/`

**Needs**: 4 files (README.md, installation.md, skills.md, usage-examples.md)

#### Subagent-Driven Development (SADD)
**Path**: `/docs/plugins/sadd/`

**Needs**: 4 files (README.md, installation.md, skills.md, usage-examples.md)

#### Domain-Driven Development (DDD)
**Path**: `/docs/plugins/ddd/`

**Needs**: 5 files (README.md, installation.md, commands.md, skills.md, usage-examples.md)

#### Kaizen
**Path**: `/docs/plugins/kaizen/`

**Needs**: 5 files (README.md, installation.md, commands.md, skills.md, usage-examples.md)

#### Customaize Agent
**Path**: `/docs/plugins/customaize-agent/`

**Needs**: 5 files (README.md, installation.md, commands.md, skills.md, usage-examples.md)

### Lower Priority

#### Docs
**Path**: `/docs/plugins/docs/`

**Needs**: 4 files (README.md, installation.md, commands.md, usage-examples.md)

#### Tech Stack
**Path**: `/docs/plugins/tech-stack/`

**Needs**: 4 files (README.md, installation.md, commands.md, usage-examples.md)

#### MCP
**Path**: `/docs/plugins/mcp/`

**Needs**: 4 files (README.md, installation.md, commands.md, usage-examples.md)

## Documentation by Category

### Quality & Refinement
- ✅ [Reflexion](./reflexion/README.md) - Self-refinement and critique
- ✅ [Code Review](./code-review/README.md) - Multi-agent review

### Development Workflows
- ⚠️ SDD - Spec-Driven (to create)
- ⚠️ TDD - Test-Driven (to create)
- ⚠️ SADD - Subagent-Driven (to create)

### Code Quality & Architecture
- ⚠️ DDD - Domain-driven (to create)
- 🚧 [Git](./git/README.md) - Commit and PR management

### Process & Analysis
- ⚠️ Kaizen - Continuous improvement (to create)

### Customization & Setup
- ⚠️ Customaize Agent - Plugin development (to create)
- ⚠️ Docs - Documentation (to create)
- ⚠️ Tech Stack - Language best practices (to create)
- ⚠️ MCP - Protocol integration (to create)

## Quick Links by Task

### I want to improve code quality
1. ✅ [Reflexion](./reflexion/README.md) - Reflect and improve
2. ✅ [Code Review](./code-review/README.md) - Automated review
3. ⚠️ DDD - Architecture patterns

### I want to develop features
1. ⚠️ SDD - Spec-Driven workflow
2. ⚠️ TDD - Test-Driven approach
3. ⚠️ SADD - Subagent-Driven delegation

### I want to commit code properly
1. 🚧 [Git](./git/README.md) - Conventional commits
2. ✅ [Code Review](./code-review/README.md) - Pre-commit review

### I want to solve problems
1. ⚠️ Kaizen - Root cause analysis
2. ✅ [Reflexion](./reflexion/README.md) - Reflection on issues

### I want to customize Claude Code
1. ⚠️ Customaize Agent - Build plugins
2. ⚠️ MCP - Integrate services

## Documentation Standards

Each complete plugin includes:

### Essential Files
1. **README.md** - Overview, quick start, when to use
2. **installation.md** - Prerequisites, setup, verification
3. **commands.md** or **skills.md** - Detailed reference
4. **usage-examples.md** - Real-world scenarios

### Optional Files (Complex Plugins)
5. **agents.md** - Specialized agent descriptions
6. **workflow.md** - Complete workflow guide
7. **best-practices.md** - In-depth guidance

## Contributing to Documentation

### Using Templates

Complete plugins serve as templates:

**Simple Plugin** (like Git):
- Use Git plugin structure
- ~1,800 word README
- ~1,200 word installation guide
- ~3,000 word commands reference
- ~5,000 word usage examples

**Complex Plugin** (like Code Review, SDD):
- Use Code Review plugin structure
- Add agents.md or workflow.md
- Add best-practices.md
- Expand usage examples to 10+

### Quality Checklist

- [ ] README has clear quick start
- [ ] Installation steps verified
- [ ] All commands documented with examples
- [ ] Real-world usage examples (5+ scenarios)
- [ ] Troubleshooting section included
- [ ] Integration patterns shown
- [ ] Internal links work
- [ ] Code examples tested

## Statistics

### Created
- **Complete Plugins**: 2 (Reflexion, Code Review)
- **Partial Plugins**: 1 (Git)
- **Total Files**: 11
- **Total Words**: ~45,000+
- **Examples**: 40+

### Remaining
- **Plugins to Document**: 9
- **Files to Create**: ~43
- **Estimated Time**: 12-15 hours
- **Priority 1**: SDD, Git completion (9 files)
- **Priority 2**: TDD, SADD, DDD (13 files)
- **Priority 3**: Kaizen, Customaize Agent, Docs, Tech Stack, MCP (21 files)

## File Locations

All documentation is located under:
```
/home/leovs09/work/neolab/context-engineering-kit/docs/plugins/
```

### Directory Structure
```
docs/plugins/
├── README.md (main overview)
├── INDEX.md (this file)
├── CREATED_FILES_SUMMARY.md (detailed summary)
├── reflexion/ (✅ complete)
│   ├── README.md
│   ├── installation.md
│   ├── commands.md
│   └── usage-examples.md
├── code-review/ (✅ complete)
│   ├── README.md
│   ├── installation.md
│   ├── commands.md
│   ├── agents.md
│   └── usage-examples.md
├── git/ (🚧 partial)
│   ├── README.md
│   ├── installation.md
│   ├── commands.md (missing)
│   └── usage-examples.md (missing)
└── [other plugins]/ (⚠️ to create)
```

## Getting Help

### Finding Documentation
1. Start with this INDEX.md
2. Navigate to plugin folder
3. Read README.md first
4. Follow installation.md
5. Reference commands.md
6. Learn from usage-examples.md

### Common Questions

**Q: Which plugin should I use first?**
A: Start with ✅ [Reflexion](./reflexion/README.md) for quality improvement basics

**Q: How do I review code before committing?**
A: Use ✅ [Code Review](./code-review/README.md) → review-local-changes

**Q: How do I create proper Git commits?**
A: Use 🚧 [Git](./git/README.md) → commit command

**Q: Where is SDD documentation?**
A: ⚠️ To be created (high priority)

### Support
- Check plugin-specific troubleshooting sections
- Review [Main Documentation](./README.md)
- See [Documentation Summary](./CREATED_FILES_SUMMARY.md)
- Open GitHub issues for questions

## Next Steps

### For Users
1. ⭐ Read [Plugin Overview](./README.md)
2. Choose a plugin based on your needs
3. Follow installation guide
4. Try usage examples
5. Integrate into your workflow

### For Contributors
1. Review [Created Files Summary](./CREATED_FILES_SUMMARY.md)
2. Use complete plugins as templates
3. Follow documentation standards
4. Create missing plugin docs
5. Submit PRs with documentation

---

**Last Updated**: 2025-01-16
**Documentation Status**: Foundation complete (20%), expansion in progress
**Next Priority**: Complete SDD plugin documentation
