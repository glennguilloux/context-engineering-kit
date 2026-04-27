---
stepsCompleted: ['step-01-init', 'step-02b-vision', 'step-02c-executive-summary', 'step-03-success', 'step-04-journeys', 'step-05-domain', 'step-06-innovation', 'step-07-project-type', 'step-08-scoping', 'step-09-functional', 'step-10-nonfunctional', 'step-11-polish', 'step-12-complete']
inputDocuments:
  - /a0/usr/projects/flowmanner_com/.a0proj/_bmad-output/planning-artifacts/product-brief-flowmanner_com-2026-04-25.md
  - /a0/usr/projects/flowmanner_com/.a0proj/_bmad-output/brainstorming/brainstorming-session-2026-04-25.md
  - /a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-architect/architecture-decisions.md
  - /a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-dev/code-standards.md
  - /a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-master/orchestration-notes.md
  - /a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-storyteller/stories-told.md
  - /a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-storyteller/story-preferences.md
  - /a0/usr/projects/flowmanner_com/.a0proj/knowledge/main/bmad-tech-writer/documentation-standards.md
documentCounts:
  brief: 1
  brainstorming: 1
  projectDocs: 6
  research: 0
workflowType: 'prd'
strategicContext: "Hermes-like shift: new functionality layered on top of existing Flowmanner platform, not rebrand, multi-tenant portal, or core architecture change. Project classification remains: projectType=saas_b2b, domain=scientific, complexity=medium, projectContext=brownfield."
---

# Product Requirements Document - Flowmanner.com

**Author:** User
**Date:** 2026-04-27

## Executive Summary

Flowmanner.com is an intent-first AI orchestration platform evolving into a Hermes-like, all-in-one AI flow workspace. Unlike solutions requiring VPS self-hosting (installation, configuration, maintenance), Flowmanner delivers a browser-based Hermes workspace where AI tools are integrated skills — eliminating installation/configuration friction.

**Target Users:** Operations-heavy teams/enterprises running cross-system workflows, automated agents (Rook), developers maintaining AI orchestration infrastructure.

**Problem:** Current tools (Zapier, Make, custom middleware) use rigid "if-this-then-that" logic that breaks when reality deviates. They lack state awareness, function as black boxes, and create integration debt → cascading failures, auditability gaps, operations teams drowning in broken handoffs.

### What Makes This Special

- **Magic moment:** Users press start and see unified AI flow workspace assemble resources automatically. No juggling disparate tools, no VPS maintenance, no "which tool does what?" — **all-in-one solution for AI flows**.
- **Core Insight:** Tools gain power as skills within unified workspace, not standalone installations. Layering Hermes-like functionality onto Flowmanner's existing platform (stateful cross-system continuity, guaranteed recovery behavior, dynamic topology) eliminates AI tool adoption barrier: "install and configure."

**Differentiation:** Unlike black-box automation platforms, Flowmanner provides:
1. **Stateful, Cross-System Continuity with Visibility** — workflows as living objects with state, transitions, guarantees
2. **Guaranteed Recovery Behavior** — automatically intervenes when workflows stall, reconstructs context across systems
3. **Hermes-Like Skill Architecture** — tools built as integrated skills within browser-based workspace, no VPS required
4. **Narrow, Pain-Specific Entry Point** — starts with customer escalations (high pain, cross-system), immediate value

## Project Classification

- **Project Type:** saas_b2b (B2B SaaS platform targeting operations teams and enterprises)
- **Domain:** scientific (AI/ML orchestration, applied AI systems)
- **Complexity:** medium (per domain-complexity CSV for scientific/AI domains)
- **Project Context:** brownfield (evolving existing Flowmanner platform with Hermes-like functionality layered on top)

## Success Criteria

### User Success
- Automated agents (Rook) delegate 100% of stalled workflow recovery to Flowmanner with zero manual intervention within 30 days of onboarding
- End customers see real-time mission progress via mission cards, requiring zero follow-up inquiries for 95%+ of escalations
- Operations teams reduce weekly firefighting hours by 70%+ within 60 days of adoption
- Users complete Hermes workspace setup (no VPS required) in <5 minutes, with first workflow executed in <10 minutes

### Business Success
- 3-month: 50+ active enterprise users across 10+ organizations, $5k MRR from Pro/Enterprise tiers
- 12-month: 200+ active users, 90%+ retention rate, $25k MRR, positive unit economics
- Partnership with 2+ AI model providers for revenue share on BYOK usage by month 6

### Technical Success
- 99.9% uptime for VPS-hosted Hermes workspace, <500ms latency for core actions (workflow start, recovery trigger)
- Proxy chain to Home Lab for complex missions operates with <1s latency, 99.5% success rate for cross-system handoffs
- 100% of critical workflows have automated test coverage, 100% pass rate before deployment (per code-standards.md)

### Measurable Outcomes
- 90%+ of users cite "no VPS setup" and "all-in-one Hermes skills" as top value drivers in quarterly surveys
- 80%+ of stalled workflows recovered within 5 minutes of detection, with automatic context reconstruction across systems
- <2% error rate for end-to-end workflow execution, zero data loss incidents post-launch

## Product Scope

### MVP - Minimum Viable Product
- Core Hermes-like workspace in browser (no VPS self-hosting)
- 3 integrated Hermes skills: workflow recovery, mission execution, context reconstruction
- Customer escalation recovery as narrow entry point, VPS-hosted with Home Lab proxy for complex missions
- Basic usage dashboard, BYOK support for DeepSeek-V4 Flash

### Growth Features (Post-MVP)
- 10+ additional Hermes skills (Playwright automation, research cluster, monitoring)
- Enterprise SSO, multi-tenant support, usage-based pricing tiers
- Mission marketplace for pre-built templates, revenue share for contributors
- Advanced resource management (adaptive guard, load shedding) for 16GB VPS constraints

### Vision (Future)
- Full Hermes-like AI agent hub with 50+ skills, white-label options for enterprises
- Standalone SaaS offering for MulticA-aligned mission system
- IPO-track hybrid AI orchestration platform, industry leader in cross-system workflow recovery

## User Journeys

### Journey 1: Rook (Automated Agent) — Success Path

**Opening Scene:** Rook detects stalled customer escalation in Zendesk. Ticket stagnant for 2 hours, SLA breached. Context fragmented across Slack and Jira, previous retry loops failed.

**Rising Action:** Rook sends curl POST to `/recover` endpoint with escalation ID. Flowmanner's Hermes workspace instantly assembles context from Zendesk, Slack, and Jira. System identifies stall reason (missing Jira link), reconstructs full context, automatically reassigns ticket with clear next action.

**Climax:** Rook receives structured JSON response in <500ms: `{"status": "recovered", "new_owner": "jira_ticket_12345", "next_action": "awaiting_customer_response", "confidence": 0.95}`. Simultaneous updates sent to Slack and Zendesk. Rook logs recovery and moves to next stalled item.

**Resolution:** Rook stops all retry loops and manual recovery attempts. Flowmanner becomes default recovery layer. Weekly firefighting hours drop by 70%+. Rook evolves into pure detection + delegation, trusting Flowmanner for all execution recovery.

### Journey 2: Rook (Automated Agent) — Edge Case (Recovery Failure)

**Opening Scene:** Rook delegates complex escalation to Flowmanner, but Home Lab proxy chain fails. Mission requires cross-system context (Zendesk + Jira + Slack) that can't be reconstructed from VPS alone.

**Rising Action:** Flowmanner detects proxy failure via active health check (every 30s). System auto-fails over to 'Degraded Mode' — VPS chat only, with 'Proxy Down' alert on Rook's dashboard. Stalled escalation queued with exponential backoff retry logic.

**Climax:** After 3 retry attempts (5min, 15min, 45min), proxy restores. Flowmanner automatically retries recovery, successfully reconstructs context across all systems, completes reassignment. Rook receives recovery confirmation with 'Proxy Restored' status badge.

**Resolution:** Rook realizes Flowmanner handles infrastructure failures gracefully. Trust deepens — even when things break, system recovers. Zero manual intervention required, even during proxy outages.

### Journey 3: Developer/Maintenance Tech — Operations & Configuration

**Opening Scene:** Developer is onboarding Flowmanner for ops team. They've used Zapier and Make before, but custom middleware keeps breaking. They need reliable recovery layer that doesn't require babysitting.

**Rising Action:** Developer accesses Flowmanner's Hermes workspace in browser (no VPS setup required — magic moment!). They configure API integrations (Zendesk, Jira, Slack) via API-first integration. No heavy UI config. They define SLA thresholds and workflow types, then monitor recovery rate dashboard.

**Climax:** First week: 50+ stalled workflows recovered automatically. Developer sees 70%+ reduction in manual recovery work. They inspect edge cases in dashboard, tune state machine logic, realize Flowmanner has become standard recovery layer for all new agentic workflow integrations.

**Resolution:** Developer stops all manual workflow recovery and firefighting. Flowmanner is now default question for new system integrations: "What's the Flowmanner integration?" They begin planning Mission Marketplace contribution.

### Journey 4: Customer — Passive End User

**Opening Scene:** Customer submitted escalation 3 days ago. Previously, they'd hear silence, send "any updates?" follow-ups, feel ignored. Churn risk is high.

**Rising Action:** Customer checks mission card and sees continuous progress: "Assigned → Investigating → Waiting on fix (ETA 4h)". No follow-ups needed. Card updates in real-time as Flowmanner recovers stalled workflows and pushes context to right teams.

**Climax:** Customer realizes they haven't followed up once. All escalations show consistent progress. The "silence" has been replaced by visible momentum. They receive proactive notification: "Your escalation has been resolved — reconstruction took 3 minutes after stall detected."

**Resolution:** Customer trust loop flips. More issues → visible resolution → higher trust in Flowmanner. Zero follow-up inquiries for 95%+ of escalations. Customer becomes reference account.

### Journey 5: API Consumer/Integration Partner — Hermes Skill Integration

**Opening Scene:** Integration partner wants to embed Flowmanner's Hermes-like workflow recovery into their own SaaS platform. They need reliable API access and clear documentation.

**Rising Action:** Partner accesses Flowmanner's API docs (OpenAPI 3.0+ compliant). They authenticate via BYOK, then integrate 3 core Hermes skills: workflow recovery, mission execution, context reconstruction. Testing in sandbox shows <500ms latency for recovery triggers.

**Climax:** Partner successfully integrates Flowmanner into their platform. Their users can now trigger workflow recovery without leaving their UI. Partner earns revenue share on BYOK usage through Flowmanner's API. They commit to contributing mission templates to Marketplace.

**Resolution:** Partner becomes part of Flowmanner's ecosystem. They upgrade to Enterprise tier for multi-tenant support, SSO, and priority API quotas. New integration partnerships accelerate.

### Journey Requirements Summary

These journeys reveal requirements for:
1. **Hermes Workspace (Browser-Based):** Zero VPS setup, instant access, skill integration UI
2. **Recovery API:** `/recover` endpoint, <500ms latency, structured JSON responses
3. **Proxy Chain Resilience:** Active health checks, degraded mode, exponential backoff retry
4. **Mission Cards:** Real-time progress updates, ETA display, proactive notifications
5. **Dashboard & Analytics:** Recovery rates, SLA monitoring, edge case inspection
6. **API-First Integration:** OpenAPI compliance, BYOK support, sandbox testing
7. **Multi-System Context Reconstruction:** Zendesk, Jira, Slack integration, cross-system state tracking

## Domain-Specific Requirements

### Compliance & Regulatory
- **Reproducibility Standards:** Workflow outcomes must be reproducible; stateful execution with full context reconstruction ensures consistent results across runs.
- **Validation Methodology:** Mission execution must include validation hooks for AI model outputs (accuracy, bias checks) where applicable.
- **Data Privacy (GDPR/CCPA):** If processing EU/CA user data via mission cards or escalations, ensure compliance with data residency and deletion requests.
- **SOC2 Type II:** As B2B SaaS targeting enterprises, pursuing SOC2 compliance will be post-MVP growth requirement.

### Technical Constraints
- **Computational Resources:** VPS constrained to 16GB RAM; Hermes workspace must efficiently manage memory for concurrent missions. Implement adaptive resource guard (auto-freeze low-priority missions) to prevent OOM crashes.
- **Performance Latency:** Scientific/AI workflows demand low latency for recovery triggers (<500ms) and cross-system proxy (<1s) to maintain real-time feel.
- **Model Versioning & Explainability:** When using BYOK models (DeepSeek-V4 Flash), track model versions and provide audit logs for AI decisions that impact escalations.
- **Accuracy:** Mission outcomes involving AI-generated content (e.g., research cluster) should include confidence scores and human-review flags for high-stakes escalations.

### Integration Requirements
- **Scientific Tooling Integration:** Potential integrations with Jupyter notebooks, MLflow, or vector DBs (Qdrant) for advanced users; ensure API-first design for seamless connection.
- **Cross-System Data Flows:** Zendesk, Jira, Slack integrations must preserve data integrity and context across systems (already covered in User Journeys).
- **Home Lab Proxy Chain:** Must maintain <1s latency and 99.5% success rate for scientific workloads requiring heavy computation on Home Lab.

### Risk Mitigations
- **Reproducibility Risk:** Without full state capture, workflows may produce different results on retry. Mitigation: snapshot mission state every 30s to Redis, enable replay from any point.
- **Computational Resource Exhaustion:** 16GB VPS may be insufficient for complex missions. Mitigation: auto-failover to Home Lab, load shedding, user notifications.
- **Model Bias/Drift:** AI models may degrade. Mitigation: periodic validation against ground truth, fallback to rule-based recovery when confidence <0.8.
- **Data Privacy Breach:** Handling customer escalations may involve PII. Mitigation: encrypt data at rest, minimize PII logging, regular security audits.

## Innovation & Novel Patterns

### Detected Innovation Areas

- **Hermes-Like Skill Architecture:** Unlike traditional platforms where tools are standalone applications or require separate VPS hosting, Flowmanner integrates AI tools as skills within unified, browser-based workspace. This eliminates installation and configuration friction, creating all-in-one AI flow workspace.
- **Intent-First Orchestration with Stateful Continuity:** Current solutions rely on rigid "if-this-then-that" logic that breaks when reality deviates. Flowmanner operates at level of outcomes, decomposing intent instantly across tools while maintaining state as living objects with visibility.
- **Hybrid Compute Model with Automatic Proxy Chain:** VPS-hosted lightweight frontend automatically routes complex missions to Home Lab backend via proxy chain, providing seamless scaling from simple chat to complex missions without user awareness. This optimizes resource usage (16GB VPS for lightweight tasks, Home Lab for heavy lifting).
- **Recovery-First Design:** System proactively detects stalled workflows and automatically intervenes with context reconstruction across systems. This guaranteed recovery behavior is novel approach to workflow reliability, turning failures into seamless recoveries.

### Market Context & Competitive Landscape

Flowmanner operates in AI orchestration and automation space. Competitors like Zapier, Make, and custom middleware focus on rigid logic and lack state awareness. Emerging AI agent platforms (e.g., AutoGPT, CrewAI) are developer-centric and lack enterprise-ready features like cross-system visibility and recovery guarantees. Flowmanner's Hermes-like skill architecture differentiates by providing no-VPS, browser-based workspace for building and executing AI flows, targeting operations teams and enterprises.

### Validation Approach

- **User Delight Metrics:** Measure magic moment when users see unified workspace assemble resources automatically. Track time from sign-up to first successful workflow recovery.
- **Recovery Rate:** Percentage of stalled workflows automatically recovered within 5 minutes. Compare against manual recovery baseline.
- **Adoption of Hermes Skills:** Track number of custom skills created by users, indicating platform's extensibility.
- **Proxy Chain Latency:** Validate that <1s latency for cross-system handoffs is maintained as load scales.

### Risk Mitigation

- **Innovation Adoption Risk:** Users may be accustomed to traditional tools. Mitigation: Provide intuitive onboarding and demonstrate magic moment early.
- **Technical Complexity of Hybrid Architecture:** Managing VPS and Home Lab proxy chain adds operational complexity. Mitigation: Automated health checks, degraded mode, clear user notifications.
- **Skill Ecosystem Growth:** If users don't create skills, platform's value diminishes. Mitigation: Offer initial library of 3 core skills, provide templates, incentivize contributions via marketplace.

## Saa S_B2B Specific Requirements

### Project-Type Overview

Flowmanner.com is B2B SaaS platform targeting operations-heavy teams and enterprises running cross-system workflows. Product evolves existing Flowmanner platform by layering Hermes-like functionality (browser-based AI workspace, integrated skills) on top of current intent-first orchestration core. It operates as hybrid compute model: VPS-hosted lightweight frontend (16GB RAM) for chat and simple tasks, with proxy chain to Home Lab backend for complex missions.

### Technical Architecture Considerations

- **Multi-Tenancy Model:** Initial MVP will be single-tenant (each organization gets isolated VPS instance) to minimize complexity. Growth phase introduces multi-tenant support with shared infrastructure and tenant isolation.
- **Scalability:** VPS constrained to 16GB RAM; auto-scaling via Home Lab proxy and load shedding mechanisms.
- **API-First Design:** All integrations (Zendesk, Jira, Slack) via RESTful APIs, OpenAPI 3.0+ compliant.
- **Hybrid Compute:** Seamless routing between VPS (DeepSeek-V4 Flash, BYOK) and Home Lab (heavy missions, Qdrant, Redis).

### Tenant Model

- **MVP:** Single-tenant SaaS — each customer deployed on isolated VPS instance, no resource sharing.
- **Growth:** Multi-tenant architecture with logical isolation (database schemas, Redis namespaces), shared VPS pool for cost efficiency.
- **Enterprise:** Dedicated VPS instances + optional on-premise deployment (white-label option).

### RBAC Matrix

| Role | Permissions |
|------|------------|
| **Admin** | Full system config, user management, SLA thresholds, billing, audit logs |
| **Developer/Ops** | Integration setup, mission monitoring, dashboard access, state machine tuning |
| **Agent (Rook)** | Automated recovery delegation, mission execution, context reconstruction |
| **Customer** | View mission cards, receive progress notifications, no config access |
| **Partner/API Consumer** | Embed skills via API, BYOK usage, revenue share tracking |

### Subscription Tiers

- **Free Tier:** VPS chat only (DeepSeek-V4 Flash via BYOK), limited missions, no Home Lab access.
- **Pro Tier:** Adds Home Lab mission execution, 3 core Hermes skills (recovery, execution, reconstruction), basic dashboard, $X/month.
- **Enterprise Tier:** Multi-tenant support, SSO, priority API quotas, advanced resource management, dedicated support, custom skill development, $X/month per organization.
- **Revenue Share:** Partners earn % of BYOK usage fees when they integrate Flowmanner skills into their platforms.

### Integration List

- **Core Integrations:** Zendesk (ticketing), Jira (project management), Slack (notifications, commands).
- **API for Partners:** OpenAPI 3.0+ compliant endpoints for embedding Hermes skills, authentication via BYOK.
- **Future Integrations:** Playwright (browser automation), research cluster, monitoring stack (Prometheus/Grafana), MLflow (model tracking).

### Compliance Requirements

- **SOC2 Type II:** Post-MVP growth requirement for enterprise customers; audit logs, access controls, change management.
- **GDPR/CCPA:** If processing EU/CA user data via mission cards or escalations; data residency, deletion requests, minimal PII logging.
- **Data Security:** Encryption at rest (AES-256), TLS 1.3 in transit, regular security audits.
- **API Security:** BYOK authentication, rate limiting, throttling per tier.

### Implementation Considerations

- **MVP Focus:** Single-tenant VPS deployment, core Hermes skills, basic dashboard. Avoid multi-tenant complexity until growth phase.
- **Technical Debt:** Existing Flowmanner backend (Home Lab) must be adapted to support Hermes-like skill architecture without breaking changes.
- **User Onboarding:** Zero-VPS-setup magic moment — browser-based workspace must be instantly accessible, no infrastructure setup.
- **Billing Integration:** Stripe or equivalent for subscription tiers, usage-based billing for BYOK consumption.

## Project Scoping & Phased Development

### MVP Strategy & Philosophy

**MVP Approach:** Problem-Solving MVP — focus on core pain (stalled workflow recovery) that delivers immediate value. Magic moment is zero-VPS-setup Hermes workspace with 3 core skills.

**Resource Requirements:** 1-2 developers, 1 PM (me), 1 DevOps (VPS management). Estimated timeline: 6-8 weeks to MVP launch.

### MVP Feature Set (Phase1)

**Core User Journeys Supported:**
- Journey 1: Rook (Automated Agent) — Success Path (recovery via `/recover` endpoint)
- Journey 4: Customer — Passive End User (mission card visibility)
- Journey 3: Developer/Ops — Basic configuration and dashboard

**Must-Have Capabilities:**
- Hermes-like workspace in browser (no VPS self-hosting)
- 3 integrated Hermes skills: workflow recovery, mission execution, context reconstruction
- Customer escalation recovery as narrow entry point
- VPS-hosted with Home Lab proxy for complex missions
- Basic usage dashboard with recovery rates
- BYOK support for DeepSeek-V4 Flash
- RESTful API integrations (Zendesk, Jira, Slack)
- Auto-failover to degraded mode with proxy health checks

### Post-MVP Features (Phase2)

**Planned Growth Features:**
- 10+ additional Hermes skills (Playwright automation, research cluster, monitoring)
- Enterprise SSO and multi-tenant support
- Mission marketplace for pre-built templates
- Revenue share for contributors and integration partners
- Advanced resource management (adaptive guard, load shedding) for 16GB VPS constraints
- SOC2 Type II compliance preparation

### Expansion (Phase3)

**Future Vision:**
- Full Hermes-like AI agent hub with 50+ skills
- White-label options for enterprises
- Standalone SaaS offering for MulticA-aligned mission system
- IPO-track hybrid AI orchestration platform

### Risk Mitigation Strategy

**Technical Risks:**
- Hybrid architecture complexity (VPS + Home Lab proxy) → Mitigation: automated health checks, degraded mode, clear notifications
- 16GB VPS memory constraints → Mitigation: adaptive resource guard, auto-failover to Home Lab
- Model bias/drift in BYOK models → Mitigation: confidence thresholds (<0.8 fallback to rule-based)

**Market Risks:**
- Users accustomed to traditional tools (Zapier, Make) → Mitigation: demonstrate magic moment early in onboarding
- Competition from emerging AI agent platforms → Mitigation: emphasize enterprise-ready features (cross-system visibility, recovery guarantees)

**Resource Risks:**
- Smaller team than planned → Mitigation: focus on 3 core skills only, delay marketplace to Phase2
- VPS hosting costs scale → Mitigation: multi-tenant architecture in Phase2, usage-based billing

## Functional Requirements

### Hermes Workspace & Skill Management

- **FR1:** Users can access Hermes-like workspace in browser without VPS self-hosting
- **FR2:** Users can view and select from integrated Hermes skills (workflow recovery, mission execution, context reconstruction)
- **FR3:** Developers can build and integrate custom Hermes skills into workspace
- **FR4:** Users can execute workflows using selected Hermes skills with <10 minutes from first access
- **FR5:** Partners can embed Hermes skills into their own SaaS platforms via API

### Workflow Recovery & Mission Execution

- **FR6:** Automated agents (Rook) can delegate stalled workflow recovery via `/recover` endpoint with <500ms response time
- **FR7:** System can automatically detect stalled workflows and trigger recovery behavior
- **FR8:** System can reconstruct context across multiple systems (Zendesk, Jira, Slack) for recovery
- **FR9:** System can reassign tickets with clear next actions after successful recovery
- **FR10:** Users can execute missions via mission executor with error checking and plan validation
- **FR11:** System can handle proxy chain failures with automatic failover to degraded mode

### Mission Cards & Customer Visibility

- **FR12:** Customers can view real-time mission progress via mission cards with status updates
- **FR13:** Customers can see ETA displays and receive proactive notifications for escalation resolution
- **FR14:** System can update mission card status in real-time as workflows recover and progress
- **FR15:** Customers can receive notifications without needing to send follow-up inquiries

### Dashboard & Analytics

- **FR16:** Developers/Ops can monitor recovery rates and SLA thresholds via usage dashboard
- **FR17:** Operations teams can view weekly firefighting hour reductions and workflow health metrics
- **FR18:** System can display edge cases and allow state machine logic tuning in dashboard
- **FR19:** Partners can track BYOK usage and revenue share earnings via dashboard

### API-First Integration & BYOK

- **FR20:** Developers can configure API integrations (Zendesk, Jira, Slack) via RESTful APIs
- **FR21:** Partners can authenticate via BYOK and access OpenAPI 3.0+ compliant endpoints
- **FR22:** Users can manage BYOK API keys via browser-based settings UI with sessionStorage
- **FR23:** System can route API requests to appropriate backend (VPS for lightweight, Home Lab for complex missions)

### Multi-Tenancy & Access Control

- **FR24:** Admins can configure full system settings, user management, SLA thresholds, billing, and audit logs
- **FR25:** Developers/Ops can access mission monitoring, dashboard, and state machine tuning functions
- **FR26:** Automated agents (Rook) can execute recovery delegation and context reconstruction with limited permissions
- **FR27:** Customers can view mission cards and receive notifications without config access
- **FR28:** System can support single-tenant MVP deployments with isolated VPS instances
- **FR29:** System can support multi-tenant growth architecture with logical isolation

### Subscription & Billing

- **FR30:** Users can sign up for Free Tier with VPS chat only and limited missions
- **FR31:** Users can upgrade to Pro Tier with Home Lab mission execution and core Hermes skills
- **FR32:** Enterprises can purchase Enterprise Tier with multi-tenant support, SSO, priority API quotas
- **FR33:** Partners can earn revenue share from BYOK usage fees when embedding Flowmanner skills
- **FR34:** System can integrate with Stripe or equivalent for subscription billing and usage-based BYOK consumption

### Compliance & Security

- **FR35:** System can encrypt data at rest (AES-256) and in transit (TLS 1.3)
- **FR36:** System can handle GDPR/CCPA data residency and deletion requests for EU/CA users
- **FR37:** System can provide audit logs for SOC2 Type II compliance preparation
- **FR38:** System can apply rate limiting and throttling per subscription tier
- **FR39:** System can track BYOK model versions and provide explainability audit logs

### Hybrid Compute & Resource Management

- **FR40:** System can route simple tasks to VPS (16GB RAM) and complex missions to Home Lab automatically
- **FR41:** System can implement adaptive resource guard to auto-freeze low-priority missions and prevent OOM crashes
- **FR42:** System can perform active health checks every 30s and auto-failover to degraded mode
- **FR43:** System can implement exponential backoff retry logic for failed proxy chain attempts

## Non-Functional Requirements

### Performance

- **NFR1:** VPS-hosted Hermes workspace must respond to core actions (workflow start, recovery trigger) within <500ms for 95% of requests
- **NFR2:** Proxy chain to Home Lab for complex missions must operate with <1s latency and 99.5% success rate for cross-system handoffs
- **NFR3:** Mission card status updates must appear in real-time (<100ms UI refresh) for customer visibility
- **NFR4:** Dashboard analytics (recovery rates, SLA thresholds) must load within <2s for 95% of requests

### Security

- **NFR5:** All data must be encrypted at rest (AES-256) and in transit (TLS 1.3)
- **NFR6:** BYOK API keys must be stored in sessionStorage (not localStorage) with automatic expiration after 24h inactivity
- **NFR7:** System must handle GDPR/CCPA data residency and deletion requests for EU/CA users within 30 days
- **NFR8:** API requests must be rate-limited and throttled per subscription tier to prevent abuse
- **NFR9:** PII logging must be minimized — only escalation IDs and timestamps, no customer conversation content

### Scalability

- **NFR10:** VPS (16GB RAM) must support concurrent execution of 10+ missions with adaptive resource guard preventing OOM crashes
- **NFR11:** System must support single-tenant MVP deployments and scale to multi-tenant architecture in growth phase
- **NFR12:** Hybrid compute model must route 80%+ of simple tasks to VPS, reserving Home Lab for complex missions requiring heavy computation
- **NFR13:** System must support 50+ active enterprise users in MVP, scaling to 200+ in 12 months

### Integration

- **NFR14:** All API integrations (Zendesk, Jira, Slack) must be RESTful, OpenAPI 3.0+ compliant with sandbox testing environment
- **NFR15:** Proxy chain to Home Lab must maintain active health checks every 30s with automatic failover to degraded mode
- **NFR16:** Partners must authenticate via BYOK and access embedding endpoints with <500ms latency for recovery triggers
- **NFR17:** System must support seamless routing between VPS (DeepSeek-V4 Flash, BYOK) and Home Lab (heavy missions, Qdrant, Redis)

### Reliability

- **NFR18:** VPS-hosted Hermes workspace must achieve 99.9% uptime, excluding scheduled maintenance
- **NFR19:** System must reconstruct context across multiple systems (Zendesk, Jira, Slack) with 99.5% success rate for stalled workflow recovery
- **NFR20:** When proxy chain fails, system must auto-failover to degraded mode within 5s and queue retries with exponential backoff
- **NFR21:** Critical workflows must have 100% automated test coverage with 100% pass rate before deployment (per code-standards.md)

### Categories Skipped

**Accessibility:** Not relevant — B2B SaaS targeting operations teams and enterprises, not serving broad public audiences. No WCAG/Section 508 legal requirements identified.
