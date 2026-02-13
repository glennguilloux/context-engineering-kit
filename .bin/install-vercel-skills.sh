#!/usr/bin/env bash
# Context Engineering Kit - Vercel Skills Installer
#
# Install skills using Vercel's skills CLI:
#   npx skills add NeoLabHQ/context-engineering-kit
#
# Or install individual skills:
#   npx skills add NeoLabHQ/context-engineering-kit --skill sdd

set -euo pipefail

# Configuration
REPO_OWNER="NeoLabHQ"
REPO_NAME="context-engineering-kit"
BRANCH="master"
BASE_URL="https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/refs/heads/${BRANCH}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info() { echo -e "${BLUE}[INFO]${NC} $*"; }
success() { echo -e "${GREEN}[OK]${NC} $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }

# Available skills
SKILLS=(
    "sdd:Software Design & Development - Complete SDLC workflow with agents"
    "sadd:Subagent-Driven Development - Parallel task execution"
    "tdd:Test-Driven Development - Write tests first"
    "code-review:Code Review - Review local changes and PRs"
    "git:Git Workflow - Commit, PR, issue analysis"
    "kaizen:Kaizen - Problem analysis and continuous improvement"
    "reflexion:Reflexion - Critique, memorize, reflect"
    "mcp:MCP Tools - Build and setup MCP servers"
    "docs:Documentation - Update and manage docs"
    "ddd:Domain-Driven Design - Code formatting setup"
    "fpf:First Principles First - Hypothesis management"
    "tech-stack:Tech Stack - TypeScript best practices"
    "customaize-agent:Agent Customization - Create agents, commands, skills"
)

show_help() {
    echo ""
    echo "Context Engineering Kit - Vercel Skills Installer"
    echo ""
    echo "Usage:"
    echo "  npx skills add ${REPO_OWNER}/${REPO_NAME}              # Install all skills"
    echo "  npx skills add ${REPO_OWNER}/${REPO_NAME} --skill sdd  # Install specific skill"
    echo ""
    echo "Available skills:"
    for skill_entry in "${SKILLS[@]}"; do
        local name="${skill_entry%%:*}"
        local desc="${skill_entry#*:}"
        printf "  %-20s %s\n" "$name" "$desc"
    done
    echo ""
}

# Check if npx is available
check_npx() {
    if ! command -v npx &> /dev/null; then
        error "npx is not installed. Please install Node.js first."
        exit 1
    fi
}

# Install using Vercel skills CLI
install_skills() {
    check_npx
    
    local skill_name="${1:-}"
    
    echo ""
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║     Context Engineering Kit - Vercel Skills Installer      ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo ""
    
    if [[ -n "$skill_name" ]]; then
        info "Installing skill: $skill_name"
        npx skills add "${REPO_OWNER}/${REPO_NAME}" --skill "$skill_name"
    else
        info "Installing all skills from ${REPO_OWNER}/${REPO_NAME}"
        npx skills add "${REPO_OWNER}/${REPO_NAME}"
    fi
    
    success "Installation complete!"
    echo ""
    info "Skills are now available in your agent."
    echo ""
}

# Main
if [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    show_help
    exit 0
fi

install_skills "${1:-}"
