---
stepsCompleted: [1, 2, 3]
inputDocuments: [
  "/a0/usr/projects/flowmanner_com/.a0proj/_bmad-output/planning-artifacts/product-brief-flowmanner_com-2026-04-25.md",
  "/a0/usr/projects/flowmanner_com/.a0proj/_bmad-output/planning-artifacts/prd.md",
  "/a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-tech-writer/documentation-standards.md",
  "/a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-storyteller/stories-told.md",
  "/a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-storyteller/story-preferences.md",
  "/a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-master/orchestration-notes.md",
  "/a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-dev/code-standards.md",
  "/a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-architect/architecture-decisions.md",
  "/a0/usr/projects/flowmanner_com/rules.promptinclude.md",
  "https://rhasspy-hermes-app.readthedocs.io/en/latest/",
  "https://github.com/rhasspy/rhasspy-hermes-app/blob/master/docs/usage.rst"
]
workflowType: 'architecture'
project_name: 'flowmanner_com'
user_name: 'User'
date: '2026-04-27'
---

# Architecture Decision Document


## Project Context Analysis

### Requirements Overview

**Functional Requirements:**
The system must deliver a browser-based Hermes-like AI orchestration workspace with zero VPS setup for end users. Core functional requirements derived from user journeys include:
1. **Hermes Workspace (Browser-Based):** Zero VPS setup, instant access, skill integration UI
2. **Recovery API:** `/recover` endpoint with <500ms latency, structured JSON responses for automated agents (Rook)
3. **Proxy Chain Resilience:** Active health checks (every 30s), degraded mode during outages, exponential backoff retry logic
4. **Mission Cards:** Real-time progress updates, ETA display, proactive customer notifications
5. **Dashboard & Analytics:** Recovery rates, SLA monitoring, edge case inspection for operations teams
6. **API-First Integration:** OpenAPI 3.0+ compliance, BYOK support for DeepSeek-V4 Flash, sandbox testing for partners
7. **Multi-System Context Reconstruction:** Zendesk, Jira, Slack integration, cross-system state tracking

MVP scope adds 3 integrated Hermes skills (workflow recovery, mission execution, context reconstruction), customer escalation recovery as the narrow entry point, basic usage dashboard, and BYOK support.

**Non-Functional Requirements:**
- **Performance:** 99.9% VPS uptime, <500ms latency for core actions (workflow start, recovery trigger), <1s latency for Home Lab proxy chain, 99.5% success rate for cross-system handoffs
- **Reliability:** 100% critical workflow test coverage (per code-standards.md), 80%+ stalled workflows recovered within 5 minutes, zero data loss incidents
- **Resource Constraints:** 16GB VPS RAM limit, adaptive resource guard to prevent OOM crashes, auto-failover to Home Lab for complex missions
- **Compliance:** GDPR/CCPA for EU/CA user data, SOC2 Type II post-MVP, reproducible AI workflow outputs with validation hooks for bias/accuracy
- **Security:** Encrypt PII at rest, minimize PII logging, regular security audits, production secret validation (no placeholder secrets in production)

**Scale & Complexity:**
- Primary domain: full-stack (Next.js 16 frontend, FastAPI backend, Traefik proxy layer, hybrid VPS+Home Lab infrastructure)
- Complexity level: medium (per PRD domain-complexity CSV for scientific/AI domains)
- Estimated architectural components: 9 core components (Frontend, VPS Traefik, VPS Backend Proxy, Home Lab Traefik, Home Lab Backend, Postgres, Redis, Qdrant, Hermes Skills Runtime)

### Technical Constraints & Dependencies

- **Infrastructure Constraints:**
  - VPS (74.208.115.142): 16GB RAM, hosts Traefik, Next.js 16 Frontend (port 3000), VPS Backend Proxy (port 8000)
  - Home Lab (172.16.1.1): Hosts Workflow Backend (FastAPI, `/api/` prefix, port 8000), Postgres, Redis, Qdrant; backend must use `workflows-web` Docker network
  - Proxy Chain: Client → VPS Traefik (pass-through, no URL rewriting) → VPS Backend Proxy → Home Lab Traefik → Backend; all `/api/*` routes pass through without rewriting
  - Backend Rules: `redirect_slashes=False` (no trailing slash routes), health check at `/health` (not `/api/health`), all frontend API calls must use trailing slashes
- **Dependency Constraints:**
  - Integrations: Zendesk, Jira, Slack for context reconstruction
  - AI Model: DeepSeek-V4 Flash for BYOK support
  - Deployment: Backend changes require `docker compose build` (source baked into image), VPS deploy script requires post-deploy `docker start flowmanner-backend`
  - Rhasspy Hermes App (Python 3.7+) for potential voice skill integrations
- **Legacy Constraints:** No VPS self-hosting for end users, existing Home Lab backend with 85+ `/api/` routes

### Cross-Cutting Concerns Identified

1. **Security:** PII handling across Zendesk/Jira/Slack integrations, production secret management (JWT_SECRET_KEY, SECRET_KEY, AES_ENCRYPTION_KEY), SOC2 compliance post-MVP
2. **Latency:** End-to-end recovery latency (<500ms VPS, <1s proxy chain), real-time mission card updates, SSE streaming for chat/workflow progress
3. **Resilience:** Proxy chain health checks (30s interval), degraded mode during Home Lab outages, exponential backoff retry for failed recoveries, Redis state snapshots every 30s for workflow replay
4. **State Management:** Workflow state as living objects with visibility, cross-system context persistence, session state for Hermes skills
5. **API Compliance:** OpenAPI 3.0+ for all endpoints, trailing slash enforcement (frontend and backend), consistent JSON response schemas for Rook (automated agent) integration
6. **Resource Management:** 16GB VPS RAM limit, adaptive resource guard to auto-freeze low-priority missions, load shedding for complex workloads

## Starter Template Evaluation

### Primary Technology Domain

Full-stack web application with hybrid infrastructure (VPS frontend + Home Lab backend), identified from project requirements analysis. The platform delivers a browser-based Hermes-like AI orchestration workspace with zero VPS setup for end users.

### Starter Options Considered

Since this is a brownfield project evolving the existing Flowmanner platform, we evaluated our current technology stack as the "starter foundation":

1. **Current Frontend Stack (Next.js 16 App Router)** — Already in production at `flowmanner-frontend/`. Provides SSR, API routes, and App Router for the Hermes workspace UI. No VPS setup required for end users.
2. **Current Backend Stack (FastAPI + Python 3.11+)** — Home Lab backend with 85+ `/api/` routes. Already handles complex workflow logic, integrations (Zendesk, Jira, Slack), and state management.
3. **Rhasspy Hermes App Pattern (Reference Architecture)** — Not a direct dependency, but heavily informs our Hermes-like skill architecture, intent handling, and session management patterns.

### Selected Starter: Flowmanner Existing Stack + Rhasspy-Inspired Patterns

**Rationale for Selection:**
- **Brownfield efficiency**: Leveraging existing Next.js 16 + FastAPI stack avoids migration risk and accelerates MVP delivery
- **Hermes-like alignment**: Rhasspy's Hermes protocol patterns (intent handling, skill registration, session continuity) provide proven design patterns for our AI orchestration workspace
- **Hybrid infrastructure**: VPS (16GB RAM) + Home Lab backend already operational with Traefik proxy chain — no re-architecture needed
- **Team familiarity**: Existing codebase, deployment scripts, and infrastructure-as-code already in place

**Initialization Note:**
No `create-starter` CLI command needed — we're building on existing codebase at:
- Frontend: `/a0/usr/workdir/flowmanner-frontend/` (Next.js 16)
- Backend: `/mnt/workflows/workflows/apps/backend/` (FastAPI, accessible via SSH to `glenn@172.16.1.1`)

**Architectural Decisions Provided by Current Stack:**

**Language & Runtime:**
- Frontend: TypeScript (Next.js 16, React 18+)
- Backend: Python 3.11+ (FastAPI, Uvicorn workers)
- Rhasspy Reference: Python 3.7+ for Hermes App skill development

**Styling Solution:**
- Tailwind CSS (per existing frontend patterns)
- Component library: TBD during UI design phase (Hermes workspace components)

**Build Tooling:**
- Frontend: Next.js built-in build (Vercel-optimized, but self-hosted on VPS via `npm run build`)
- Backend: Docker Compose build (source baked into image, requires `docker compose build` for changes)
- Deploy script: `/a0/usr/workdir/flowmanner-frontend/scripts/deploy.sh`

**Testing Framework:**
- Backend: `pytest` (per code-standards.md: 100% critical workflow test coverage required)
- Frontend: Jest + React Testing Library (TBD for Hermes workspace components)

**Code Organization:**
- Frontend: Next.js App Router (`app/`, `components/`, `lib/`)
- Backend: FastAPI routers by domain (`app/routers/`, `app/models/`, `app/services/`)
- Hermes Skills: New domain under `app/skills/` or `components/skills/` following Rhasspy's modular skill pattern

**Development Experience:**
- Hot reloading: Next.js dev server (frontend), Uvicorn `--reload` (backend)
- API Documentation: FastAPI auto-generates OpenAPI 3.0+ schemas (Swagger UI at `/docs`)
- State visualization: Redis state snapshots every 30s for workflow replay (similar to Rhasspy's session state)

**Hermes Skill Architecture Pattern (from Rhasspy):**
- Skills register via decorator/configuration (like Rhasspy's `@on_intent("RecoverWorkflow")`)
- Each skill handles a specific intent (workflow recovery, mission execution, context reconstruction)
- Session state passed between skills via shared context (Redis) — similar to Rhasspy's `custom_data`
- Proactive notifications via SSE/WebSocket (similar to Rhasspy's `app.notify()` for user updates)

## Architectural Decisions

### Category 1: Data Architecture

#### Decision 1: Primary Database Selection
- **Category**: Data Architecture
- **Decision**: Postgres 16 (relational, existing), Redis 7.2 (in-memory, existing), Qdrant 1.7 (vector, existing)
- **Version**: Postgres 16 (latest stable), Redis 7.2 (LTS), Qdrant 1.7 (latest stable) — verified via web search.
- **Rationale**: 
  - Postgres: ACID-compliant relational database for structured data (users, workflows, missions), already operational in Home Lab backend. Aligns with FastAPI's SQLAlchemy integration.
  - Redis: Low-latency in-memory store for workflow state snapshots (every 30s for replay), session management, and caching. Maps directly to Rhasspy's `custom_data` session state persistence — Redis replaces MQTT for cross-system state storage in our hybrid architecture.
  - Qdrant: Vector database for knowledge graph and semantic search, already integrated with Home Lab backend for LLM context retrieval.
- **Affects**: All backend services (FastAPI routers, workflow/mission/chat services), Hermes skills (state persistence, context retrieval)
- **Provided by Starter**: Partial (existing stack, versions verified via web search)

#### Decision 2: Data Modeling Approach
- **Category**: Data Architecture
- **Decision**: Layered design: Pydantic v2 for input validation (boundary layer), Rhasspy-style intent grammar for command parsing, Domain-Driven Design (DDD) for core domain models where business invariants exist.
- **Version**: Pydantic 2.9 (latest stable, verified via web search)
- **Rationale**: 
  - **Pydantic v2**: Handles input shape validation, normalization, and API boundary contracts. Key tools: `Annotated` validators, `@field_validator` (field-local checks), `@model_validator` (cross-field rules), validation context (request-specific rules). Aligns with FastAPI's automatic OpenAPI 3.0+ schema generation.
  - **Rhasspy-style intent patterns**: Borrow command grammar concepts (intents, slots, normalization) for parsing Hermes skill inputs (e.g., "recover workflow 123" → validated intent with slots). Clear separation between raw input and normalized output, similar to Rhasspy's intent-slot extraction.
  - **DDD**: Applies only to domains with rich business rules (e.g., workflow state machines, mission entitlements). Uses ubiquitous language shared with domain experts, bounded contexts for modularity. Avoids anemic models for complex business logic.
  - **Layered Workflow**: 
    1. Raw input (text/API request) → 2. Pydantic validation + Rhasspy-style normalization → 3. Map to DDD domain objects (e.g., `WorkflowRecovery` aggregate) for business rule enforcement.
  - **Practical Choice Guide**:
    | Approach | Best for | Weak spot |
    |----------|----------|----------|
    | DDD | Rich business rules, evolving terminology, multiple subdomains | Can be heavy for simple systems |
    | Pydantic v2 | Input validation, normalization, API boundaries | Not a domain modeling strategy by itself |
    | Rhasspy-style intents | Constrained command parsing, slot extraction, voice/text commands | Less suitable for open-ended language |
  - **Recommendation**: Start with Pydantic models for all API/skill input contracts, add Rhasspy-like grammar rules for Hermes skill command parsing, and introduce DDD aggregates/value objects only where real business invariants (e.g., workflow state transitions, mission entitlement checks) exist. Simpler system first, room for deeper modeling as complexity grows.
- **Affects**: Backend `app/models/` (DDD entities/aggregates), `app/schemas/` (Pydantic models), Hermes skill input parsers, API request/response contracts.
- **Provided by Starter**: Partial (Pydantic already in use, layered design and DDD formalization new)
- **Rhasspy Pattern Connection**: Mirrors Rhasspy's `@on_intent` typed handlers with validated `custom_data` — our Hermes skills use Pydantic-validated input models, with Rhasspy-style grammar for command normalization before domain mapping.

#### Decision 3: Data Migration Strategy
- **Category**: Data Architecture
- **Decision**: Alembic 1.13 for Postgres migrations, versioned data models with backward compatibility for Redis/Qdrant
- **Version**: Alembic 1.13 (latest stable)
- **Rationale**: 
  - Alembic is the standard migration tool for SQLAlchemy (used by FastAPI + Postgres), already operational in Home Lab backend.
  - Redis/Qdrant avoid complex migration scripts by using versioned data models with backward compatibility, reducing maintenance overhead.
- **Affects**: Backend `alembic/` directory, `app/models/` changes, Redis/Qdrant data model updates
- **Provided by Starter**: Yes (Alembic already in use)

#### Decision 4: Caching Strategy
- **Category**: Data Architecture
- **Decision**: Redis multi-level caching: (1) API response caching (1-minute TTL for non-real-time endpoints), (2) Workflow state caching (30s TTL matching snapshot interval), (3) Session caching (24h TTL for JWT refresh tokens)
- **Version**: Redis 7.2
- **Rationale**: 
  - Aligns with Rhasspy's session state caching via `custom_data` — Redis provides persistent, low-latency state storage for workflow recovery and cross-system context reconstruction.
  - Reduces Postgres load for frequent read operations (e.g., workflow status checks), meeting <500ms recovery API latency requirement.
  - Supports adaptive resource guard on 16GB VPS by caching low-priority mission data.
- **Affects**: Backend `app/services/cache.py`, API routers, session management, Hermes skill state persistence
- **Provided by Starter**: Partial (Redis already in use, caching strategy new)

## ADR 3.1: Authentication Method
- **Status**: Draft
- **Category**: 3 - Authentication & Security
- **Context**: Need unified authentication for user sessions, Hermes skill service accounts, and BYOK (DeepSeek-V4 Flash) access. Existing backend uses JWT but lacks service account auth.
- **Decision**: Adopt three auth methods:
  1. JWT access + refresh token pairs for user-facing web/mobile routes
  2. Scoped API keys for Hermes skill service accounts
  3. User-provided BYOK tokens for DeepSeek-V4 Flash access
  No new session-based authentication endpoints.
- **Consequences**:
  - ✅ Unified auth for all client types
  - ✅ JWT refresh tokens enable long-lived sessions without re-login
  - ❌ Additional key management overhead for API keys
- **Rhasspy Hermes Pattern Reference**: Maps to Hermes session auth via `custom_data`, where JWT `jti` claim is stored in Hermes session `custom_data` for cross-system context.
- **Infrastructure Alignment**: JWT signing/verification on 16GB VPS; refresh token sessions in VPS Redis (key: `session:{jwt_jti}`, 24h TTL per existing convention); API keys validated via Home Lab Postgres.

## ADR 3.2: Authorization Model
- **Status**: Draft
- **Category**: 3 - Authentication & Security
- **Context**: Need access control for user tiers (Free/Pro/Enterprise) and service accounts. Existing system lacks RBAC.
- **Decision**: Implement RBAC with three roles:
  1. **User**: Tiered permissions (Free: limited API calls, no BYOK; Pro: BYOK, 10x rate limits; Enterprise: dedicated VPS, SLA)
  2. **Service Account**: For Hermes skills, scoped to specific API endpoints
  3. **Admin**: Full system access
- **Consequences**:
  - ✅ Clear permission boundaries
  - ✅ Scalable for enterprise tiers
  - ❌ Requires Postgres schema updates for roles/tiers
- **Rhasspy Hermes Pattern Reference**: Aligns with Hermes skill-level permissions, where API key scopes restrict skill access to authorized endpoints only.
- **Infrastructure Alignment**: Roles stored in Home Lab Postgres; cached in Redis for low-latency checks; VPS proxy enforces tier-based rate limits via Redis sliding window.

## ADR 3.3: API Key Management
- **Status**: Draft
- **Category**: 3 - Authentication & Security
- **Context**: Need to manage Hermes skill API keys, BYOK for DeepSeek-V4 Flash, and tier-based rate limits. Existing rate limiting uses Redis sliding window.
- **Decision**:
  1. Hermes skill API keys: Scoped to specific endpoints, rotated every 90 days
  2. BYOK (DeepSeek-V4 Flash): User-provided keys encrypted with AES-256 (using `AES_ENCRYPTION_KEY`) at rest in Postgres, validated before each request
  3. Rate limits per tier: Free (100 req/min), Pro (1000 req/min), Enterprise (10000 req/min) via existing Redis sliding window
- **Consequences**:
  - ✅ Secure key storage
  - ✅ Compliance with tier quotas
  - ❌ `AES_ENCRYPTION_KEY` must be set to real value before production (currently placeholder)
- **Rhasspy Hermes Pattern Reference**: Maps to Hermes skill API keys stored in `custom_data`, with scopes limiting skill access to authorized workflows.
- **Infrastructure Alignment**: API keys stored in Home Lab Postgres; rate limiting enforced on VPS via Redis; BYOK validation handled by Home Lab backend.

## ADR 3.4: Secrets Management
- **Status**: Draft
- **Category**: 3 - Authentication & Security
- **Context**: Need to manage JWT_SECRET_KEY, SECRET_KEY, AES_ENCRYPTION_KEY, and third-party integration secrets. Existing system has placeholder secrets, production validation blocks startup if placeholders are present.
- **Decision**:
  1. JWT_SECRET_KEY, SECRET_KEY: Stored in VPS `~/flowmanner-app/.env` (not baked into Docker image, not committed to repo); rotated every 24 hours
  2. AES_ENCRYPTION_KEY: Stored in same `.env`, set to real 32-byte value before `APP_ENV=production`
  3. Third-party integration secrets (Zendesk, Jira, Slack): Encrypted in Home Lab Postgres, never logged
  4. Rotation: JWT rotated via deployment script, API keys rotated every 90 days
- **Consequences**:
  - ✅ No secrets in code/image
  - ✅ Production validation prevents insecure startups
  - ❌ Manual JWT rotation step (automate post-MVP)
- **Rhasspy Hermes Pattern Reference**: Aligns with minimal secret exposure in Hermes skill configurations.
- **Infrastructure Alignment**: Secrets stored on VPS (edge) and Home Lab (core) per sensitivity; VPS proxy never receives plaintext integration secrets.

## ADR 3.5: PII/Security Compliance
- **Status**: Draft
- **Category**: 3 - Authentication & Security
- **Context**: Need GDPR/CCPA compliance for EU/CA users, SOC2 Type II post-MVP, and minimal PII exposure. Existing fixes: auth logs only email, no raw password logging.
- **Decision**:
  1. GDPR/CCPA: Encrypt all PII (emails, integration tokens) at rest with AES-256 in Postgres; minimize PII logging (only non-PII metadata)
  2. SOC2 Type II: Implement audit logs for all auth events, access reviews post-MVP
  3. Production safeguards: Enforce production secret validation (already deployed), zero PII stored in Redis (only session IDs, workflow states)
- **Consequences**:
  - ✅ Regulatory compliance
  - ✅ Reduced PII exposure risk
  - ❌ Post-MVP audit overhead for SOC2
- **Rhasspy Hermes Pattern Reference**: Aligns with Hermes minimal data logging for session/context data.
- **Infrastructure Alignment**: PII encrypted on Home Lab Postgres (encrypted volumes); VPS logs only non-PII metadata; Redis stores no PII.

## ADR 3.6: Cross-System Auth
- **Status**: Draft
- **Category**: 3 - Authentication & Security
- **Context**: Need to authenticate with Zendesk, Jira, Slack for context reconstruction. Existing integrations lack secure credential management.
- **Decision**:
  1. User-provided OAuth tokens for Zendesk/Jira/Slack stored encrypted in Postgres
  2. Tokens scoped to read-only access for context reconstruction
  3. No long-lived tokens: refresh tokens rotated every 30 days
  4. All cross-system requests logged for audit
- **Consequences**:
  - ✅ Secure cross-system access
  - ✅ Audit trail for external data access
  - ❌ Token rotation overhead for users
- **Rhasspy Hermes Pattern Reference**: Maps to Hermes cross-system context via `custom_data`, where external system tokens are referenced (not stored) in Hermes session data.
- **Infrastructure Alignment**: Tokens stored on Home Lab Postgres; VPS proxy forwards context reconstruction requests to Home Lab backend; no external tokens on VPS.

---

