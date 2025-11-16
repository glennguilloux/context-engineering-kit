# Recommended MCP Servers

Model Context Protocol (MCP) servers extend Claude Code's capabilities by providing access to external tools, data sources, and specialized functionality. This page documents MCP servers that complement Context Engineering Kit plugins and enhance your development workflow.

## What is MCP?

Model Context Protocol is a standard for connecting LLMs to external data sources and tools. MCP servers expose:

- **Resources** - External data that Claude can read (files, documentation, APIs)
- **Tools** - Actions Claude can execute (search, transform, create)
- **Prompts** - Reusable prompt templates with dynamic inputs

For complete MCP documentation, see [modelcontextprotocol.io](https://modelcontextprotocol.io/).

## Why Use MCP with CEK?

Context Engineering Kit focuses on improving Claude's reasoning and workflow patterns. MCP servers complement this by:

- **Extending knowledge** - Access to external documentation and data
- **Providing tools** - Specialized operations beyond Claude's native capabilities
- **Reducing context pollution** - Fetch only needed information on demand
- **Enabling specialization** - Domain-specific tools and knowledge

## Recommended Servers

### Context7

**Repository**: [upstash/context7](https://github.com/upstash/context7)

**Maintained By**: Upstash

**Purpose**: Load documentation for specific technologies, frameworks, and libraries directly into Claude's context.

#### What It Does

Context7 provides instant access to up-to-date documentation for thousands of technologies:

- **Framework docs** - React, Vue, Angular, Next.js, etc.
- **Language references** - Python, TypeScript, Rust, Go, etc.
- **Library documentation** - Popular packages and tools
- **API references** - Cloud platforms and services

#### Integration with CEK

Context7 complements these CEK plugins:

- **Tech Stack** - Load framework docs when setting up best practices
- **Spec-Driven Development** - Reference APIs during planning and implementation
- **Docs Plugin** - Access similar projects' documentation for inspiration
- **Code Review** - Verify code follows documented best practices

#### Setup

Install Context7 MCP server:

```bash
npm install -g @upstash/context7-mcp
```

Configure in your MCP settings (`~/.config/claude/mcp.json`):

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"]
    }
  }
}
```

#### Usage Examples

**Load framework documentation:**

```bash
# Use MCP to load Next.js documentation
# Then use CEK plugins for best practices
/tech-stack:add-typescript-best-practices
```

**Reference during specification:**

```bash
# Access API docs while specifying features
/sdd:01-specify "Add authentication using Auth0"
# Context7 provides Auth0 API reference
```

**Verify during code review:**

```bash
# Review code against documented patterns
/code-review:review-local-changes
# Context7 ensures adherence to official guidelines
```

#### Best Practices

- **Load docs before setup** - Get framework documentation before configuring best practices
- **Reference during planning** - Access API docs while writing specifications
- **Verify during review** - Check code against official documentation
- **Update regularly** - Context7 provides latest documentation versions

#### CEK Integration Command

Use the MCP plugin to set up Context7:

```bash
/mcp:setup-context7-mcp
```

This command guides you through:
1. Context7 installation
2. MCP configuration
3. Testing documentation access
4. Updating CLAUDE.md with usage guidelines

---

### Serena

**Repository**: [oraios/serena](https://github.com/oraios/serena)

**Maintained By**: Oraios

**Purpose**: Semantic code retrieval and intelligent editing capabilities using vector embeddings.

#### What It Does

Serena provides advanced code understanding and manipulation:

- **Semantic search** - Find code by meaning, not just keywords
- **Intelligent retrieval** - Locate relevant code across large codebases
- **Context-aware editing** - Make changes that respect code relationships
- **Pattern detection** - Identify similar code structures and patterns

#### Integration with CEK

Serena enhances these CEK workflows:

- **Code Review** - Find similar patterns for consistency checking
- **Spec-Driven Development** - Locate existing implementations for reference
- **Subagent-Driven Development** - Quickly find relevant code for task context
- **Kaizen** - Trace issues through semantic code relationships

#### Setup

Install Serena MCP server using uvx:

```bash
# Run directly with uvx (recommended)
uvx --from git+https://github.com/oraios/serena serena start-mcp-server
```

For persistent installation, see the [Serena documentation](https://oraios.github.io/serena/).

Configure in MCP settings:

```json
{
  "mcpServers": {
    "serena": {
      "command": "uvx",
      "args": [
        "--from",
        "git+https://github.com/oraios/serena",
        "serena",
        "start-mcp-server",
        "--workspace",
        "/path/to/your/project"
      ]
    }
  }
}
```

**Note**: Serena requires `uvx` (from uv package manager). Install uv if needed:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

#### Usage Examples

**Semantic code review:**

```bash
# Find similar implementations before review
# Serena locates patterns across codebase
/code-review:review-local-changes
```

**Context-aware implementation:**

```bash
# Use Serena to find related code
# Then implement with full context
/sdd:04-implement
```

**Root cause analysis:**

```bash
# Trace issues through code relationships
/kaizen:root-cause-tracing
# Serena provides semantic connections
```

#### Best Practices

- **Index before development** - Let Serena build embeddings of your codebase
- **Use for large codebases** - Most valuable when searching thousands of files
- **Combine with code-explorer** - Serena + SDD code-explorer agent = powerful discovery
- **Update embeddings regularly** - Re-index after significant changes

#### CEK Integration Command

Use the MCP plugin to set up Serena:

```bash
/mcp:setup-serena-mcp
```

This command configures:
1. Serena installation
2. Workspace indexing
3. MCP server setup
4. CLAUDE.md integration guidelines

---

### Perplexity Model Context Protocol

**Repository**: [perplexityai/modelcontextprotocol](https://github.com/perplexityai/modelcontextprotocol)

**Maintained By**: Perplexity AI

**Purpose**: Enhanced search and research capabilities with access to real-time information and web resources.

#### What It Does

Perplexity MCP provides advanced research tools:

- **Real-time search** - Access current information from the web
- **Source verification** - Get cited, validated information
- **Research synthesis** - Aggregate information from multiple sources
- **Fact-checking** - Verify claims and technical details

#### Integration with CEK

Perplexity enhances research-intensive workflows:

- **Spec-Driven Development** - Research technologies during specification
- **Tech Stack** - Find latest best practices and patterns
- **Kaizen** - Research solutions to identified problems
- **Docs Plugin** - Verify information when writing documentation

#### Setup

Install Perplexity MCP server:

```bash
# Clone and setup from the official repository
git clone https://github.com/perplexityai/modelcontextprotocol.git
cd modelcontextprotocol/perplexity-ask
npm install
npm run build
```

Configure with API key in `~/.config/claude/mcp.json`:

```json
{
  "mcpServers": {
    "perplexity": {
      "command": "node",
      "args": ["/path/to/modelcontextprotocol/perplexity-ask/build/index.js"],
      "env": {
        "PERPLEXITY_API_KEY": "your-api-key-here"
      }
    }
  }
}
```

Get API key from [Perplexity AI](https://www.perplexity.ai/api).

**Note**: Check the [official repository](https://github.com/perplexityai/modelcontextprotocol) for the latest installation instructions, as the setup may vary.

#### Usage Examples

**Research during specification:**

```bash
# Research latest authentication approaches
/sdd:01-specify "Implement modern authentication"
# Perplexity provides current best practices
```

**Verify during documentation:**

```bash
# Fact-check technical claims
/docs:update-docs
# Perplexity validates information accuracy
```

**Problem analysis:**

```bash
# Research known issues and solutions
/kaizen:analyse "Database query performance"
# Perplexity finds relevant solutions
```

#### Best Practices

- **Use for current information** - Best for fast-changing technologies
- **Verify sources** - Check citations Perplexity provides
- **Combine with Context7** - Official docs + web research = comprehensive understanding
- **Rate limit awareness** - Monitor API usage with free tier

#### CEK Integration

While CEK doesn't have a dedicated setup command for Perplexity, you can use:

```bash
/mcp:build-mcp
```

This provides guidance for integrating any MCP server, including configuration best practices.

---

## MCP Server Comparison

| Server | Primary Use | Best For | CEK Integration |
|--------|------------|----------|-----------------|
| Context7 | Documentation access | Framework/library docs | Tech Stack, SDD |
| Serena | Semantic code search | Large codebase navigation | Code Review, SDD |
| Perplexity | Real-time research | Current best practices | Kaizen, Docs |

## Choosing the Right MCP Server

### For New Projects

Start with **Context7**:
- Load framework documentation
- Set up best practices with accurate references
- Verify patterns against official docs

### For Large Codebases

Add **Serena**:
- Navigate complex codebases semantically
- Find patterns and similar implementations
- Context-aware code modifications

### For Research-Intensive Work

Include **Perplexity**:
- Research emerging technologies
- Verify current best practices
- Find solutions to novel problems

### For Comprehensive Coverage

Use all three together:
- **Context7** - Official documentation
- **Serena** - Codebase understanding
- **Perplexity** - Current research

## Installation Workflow

### Quick Setup (All Servers)

```bash
# Install Context7
npm install -g @upstash/context7-mcp

# Install uv (for Serena)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Setup Perplexity (follow official docs)
git clone https://github.com/perplexityai/modelcontextprotocol.git

# Configure using CEK commands
/mcp:setup-context7-mcp
/mcp:setup-serena-mcp
```

### Verification

Test each server after installation:

**Context7:**
```bash
# Ask Claude to load documentation for a framework
"Load the Next.js documentation using Context7"
```

**Serena:**
```bash
# Ask Claude to search for code semantically
"Find authentication implementations using Serena"
```

**Perplexity:**
```bash
# Ask Claude to research current practices
"Research latest React state management approaches"
```

## Performance Considerations

### Token Efficiency

MCP servers can affect token usage:

- **Context7** - Loads full documentation sections (moderate tokens)
- **Serena** - Returns code snippets and contexts (variable tokens)
- **Perplexity** - Synthesizes research results (moderate tokens)

**Best Practice**: Request specific information rather than broad queries to minimize token usage.

### Response Time

- **Context7** - Fast (local or cached documentation)
- **Serena** - Fast for indexed codebases, slower for first index
- **Perplexity** - Moderate (depends on web search complexity)

### Costs

- **Context7** - Free (open source)
- **Serena** - Free (open source, local computation)
- **Perplexity** - Free tier available, paid plans for high volume

## Troubleshooting

### MCP Server Not Responding

1. **Check installation**: Verify server is installed correctly
2. **Review configuration**: Ensure MCP settings file is valid JSON
3. **Restart Claude Code**: Reload MCP server connections
4. **Check logs**: Look for error messages in Claude Code output

### Documentation Not Loading (Context7)

1. **Verify internet connection**: Context7 fetches docs from web
2. **Check technology name**: Ensure correct spelling/naming
3. **Update Context7**: Run `npm update -g @upstash/context7-mcp`

### Semantic Search Not Working (Serena)

1. **Verify indexing**: Ensure workspace has been indexed
2. **Check workspace path**: Confirm correct project directory
3. **Re-index if needed**: Delete index and rebuild for fresh start
4. **Check uv installation**: Verify uv is properly installed

### Research Queries Failing (Perplexity)

1. **Verify API key**: Check environment variable is set correctly
2. **Check rate limits**: Monitor API usage on free tier
3. **Test API access**: Try direct API call to verify connectivity

## Advanced Usage

### Combining MCP with CEK Workflows

#### Spec-Driven Development with MCP

```bash
# Stage 0: Setup with research
/sdd:00-setup "Use latest Next.js patterns"
# Perplexity researches current approaches
# Context7 loads Next.js documentation

# Stage 1: Specify with context
/sdd:01-specify "Add authentication"
# Context7 provides Auth0 API docs
# Serena finds existing auth patterns

# Stage 4: Implement with reference
/sdd:04-implement
# All MCP servers provide contextual information
```

#### Code Review with Semantic Search

```bash
# Use Serena to find similar patterns
# Then review for consistency
/code-review:review-local-changes
# Serena identifies related code
# Context7 verifies against best practices
```

#### Kaizen Analysis with Research

```bash
# Research-backed problem analysis
/kaizen:analyse "High memory usage"
# Perplexity finds known issues and solutions
# Serena locates relevant code sections
# Context7 provides framework documentation
```

## Building Custom MCP Servers

Want to create your own MCP server? Use the CEK command:

```bash
/mcp:build-mcp
```

This guide covers:
- MCP server architecture
- Resource and tool implementation
- Integration with Claude Code
- Testing and debugging
- Publishing and distribution

## Additional MCP Resources

### Official Resources

- [MCP Specification](https://modelcontextprotocol.io/) - Protocol documentation
- [MCP GitHub](https://github.com/modelcontextprotocol) - Reference implementations
- [Anthropic MCP Guide](https://docs.anthropic.com/en/docs/build-with-claude/mcp) - Integration guide

### Community Servers

Explore more MCP servers:
- [MCP Server Registry](https://github.com/modelcontextprotocol/servers) - Community servers
- [Awesome MCP](https://github.com/modelcontextprotocol/awesome-mcp) - Curated list

## Contributing

### Recommend a Server

Found an MCP server that works well with CEK? Share it:

1. Test integration with CEK workflows
2. Document usage patterns
3. Submit via [GitHub Issues](https://github.com/NeoLabHQ/context-engineering-kit/issues)
4. Include example workflows

### Improve Documentation

Help others set up MCP servers:
- Share configuration examples
- Document troubleshooting steps
- Provide workflow integrations
- Create tutorial content

## Summary

MCP servers significantly enhance CEK capabilities:

- **Context7** provides comprehensive documentation access
- **Serena** enables semantic code understanding
- **Perplexity** offers real-time research capabilities

Together with CEK plugins, these servers create a powerful development environment that combines structured workflows, quality gates, and extensive knowledge access.

---

**Ready to extend your capabilities?** Start with [Context7](https://github.com/upstash/context7) for immediate documentation access, or use the `/mcp:setup-context7-mcp` command for guided setup.
