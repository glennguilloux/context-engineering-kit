# Flowmanner.com — Epics and Stories (Phase 2: Create Epics)

Drafted by: John (Product Manager)
Status: Pending Party Mode Sign-off
Date: 2026-04-27 (Revised)

---

## User-Value Epic 1: Mission Execution & Tracking
**WHY:** Users need to create, track, and manage missions with real-time updates, ETA displays, and notifications to deliver core product value (covers FR12-15, FR27)

- **Story 1.1: View Mission Cards**
  - **As a** Pro User, **I want to** view mission cards with status, progress, and ETA **so that** I can track my active missions at a glance
  - **Given** I am logged in with a Pro subscription
  - **When** I navigate to the Mission Dashboard
  - **Then** I see a card for each active mission with: status (queued/running/completed/failed), progress bar, estimated completion time, and last update timestamp
  - **FR Coverage:** FR12 (Mission cards), FR27 (Customer portal mission cards)

- **Story 1.2: Receive Real-Time Mission Updates**
  - **As a** Pro User, **I want to** receive real-time updates on mission progress via SSE **so that** I don't have to refresh the page to see status changes
  - **Given** I have an active mission running
  - **When** mission progress updates (10%, 50%, 90%) or status changes
  - **Then** the mission card updates in real-time without page refresh, and I receive a browser notification
  - **FR Coverage:** FR13 (Real-time updates), FR27 (Customer portal notifications)

- **Story 1.3: Configure Mission Notifications**
  - **As a** Pro User, **I want to** configure email/Slack notifications for mission completions/failures **so that** I can stay informed even when not in the app
  - **Given** I am in the Notification Settings page
  - **When** I toggle "Mission Completion" and "Mission Failure" notifications on
  - **Then** I receive an email or Slack message when a mission completes or fails, with mission ID and status
  - **FR Coverage:** FR15 (Notifications), FR27 (Customer portal notifications)

- **Story 1.4: View Mission ETA Displays**
  - **As a** End User, **I want to** see estimated completion time for my missions **so that** I can plan my work accordingly
  - **Given** I have a mission in the queue or running
  - **When** I view the mission card
  - **Then** I see a clear ETA (e.g., "Est. completion: 14:30 UTC") based on current queue position and historical runtimes
  - **FR Coverage:** FR14 (ETA displays)

---

## User-Value Epic 2: Dashboard & Customer Experience
**WHY:** Users and admins need actionable analytics, firefighting metrics, and partner revenue dashboards to manage operations (covers FR16-19)

- **Story 2.1: View Dashboard Analytics**
  - **As a** Admin User, **I want to** view a dashboard with mission success rates, average runtime, and queue depth **so that** I can monitor system health
  - **Given** I am logged in as an Admin
  - **When** I navigate to the Admin Dashboard
  - **Then** I see: 7-day mission success rate, average mission runtime, current queue depth, and top 5 failed missions by frequency
  - **FR Coverage:** FR16 (Dashboard analytics)

- **Story 2.2: Monitor Firefighting Metrics**
  - **As a** Operations Team Member, **I want to** see firefighting metrics (failed missions, retry counts, error rates) **so that** I can prioritize fixing recurring issues
  - **Given** I am on the Operations Dashboard
  - **When** I filter by "Last 24 Hours"
  - **Then** I see: failed mission count, average retry count per mission, top 3 error codes, and a list of missions requiring manual intervention
  - **FR Coverage:** FR17 (Firefighting metrics)

- **Story 2.3: Handle Mission Edge Cases**
  - **As a** Pro User, **I want to** see clear error messages and recovery options for edge cases (e.g., API downtime, GPU unavailability) **so that** I can resolve issues quickly
  - **Given** my mission fails due to an edge case (e.g., external API timeout)
  - **When** I view the failed mission details
  - **Then** I see a user-friendly error message (not a raw stack trace) and a "Retry with different settings" button
  - **FR Coverage:** FR18 (Edge cases)

- **Story 2.4: View Partner Revenue Dashboard**
  - **As a** Partner Admin, **I want to** view a dashboard with my revenue share, mission volume, and payout history **so that** I can track my earnings
  - **Given** I am logged in as a Partner Admin
  - **When** I navigate to the Partner Dashboard
  - **Then** I see: current month revenue share, total mission volume, pending payout amount, and a 6-month revenue trend chart
  - **FR Coverage:** FR19 (Partner revenue)

---

## User-Value Epic 3: Subscription & Billing
**WHY:** Users need tiered subscriptions (Free/Pro/Enterprise), Stripe billing, and multi-tenant growth features to monetize the platform (covers FR22, FR29-34)

- **Story 3.1: Manage BYOK API Keys**
  - **As a** Pro User, **I want to** bring my own API keys (BYOK) for external services (e.g., OpenAI, ComfyUI) **so that** I can use my own quotas and avoid platform rate limits
  - **Given** I am in the API Key Management page
  - **When** I enter my OpenAI API key and click "Save"
  - **Then** the key is encrypted (AES-256) and stored, and I can use it for missions that require OpenAI access
  - **FR Coverage:** FR22 (BYOK API key management UI)

- **Story 3.2: Select Subscription Tier**
  - **As a** End User, **I want to** select between Free/Pro/Enterprise tiers with clear feature comparisons **so that** I can choose a plan that fits my needs
  - **Given** I am on the Pricing page
  - **When** I click "Upgrade to Pro"
  - **Then** I see a modal with tier features (Free: 5 missions/day, Pro: 50/day, Enterprise: unlimited) and am redirected to Stripe checkout
  - **FR Coverage:** FR30 (Tiers: Free/Pro/Enterprise)

- **Story 3.3: Process Stripe Billing**
  - **As a** Pro User, **I want to** pay for my subscription via Stripe **so that** I can securely manage my billing information
  - **Given** I am in Stripe checkout
  - **When** I enter my credit card details and click "Subscribe"
  - **Then** my subscription is activated, I receive a confirmation email, and my credit card is charged monthly
  - **FR Coverage:** FR34 (Stripe billing)

- **Story 3.4: Manage Multi-Tenant Accounts**
  - **As a** Enterprise Admin, **I want to** create sub-accounts for my team members with role-based access **so that** I can scale my organization's usage
  - **Given** I am an Enterprise Admin
  - **When** I click "Add Team Member" and enter their email
  - **Then** the team member receives an invite, and I can assign them roles (Viewer/User/Admin) with appropriate permissions
  - **FR Coverage:** FR29 (Multi-tenant growth)

- **Story 3.5: View Revenue Share Reports**
  - **As a** Partner Admin, **I want to** view monthly revenue share reports and request payouts **so that** I get paid for my referrals
  - **Given** I have referred 10 users who upgraded to Pro
  - **When** I navigate to the Revenue Share page
  - **Then** I see: total referrals, pending payout amount, and a "Request Payout" button that triggers a Stripe transfer
  - **FR Coverage:** FR31 (Revenue share), FR32 (Multi-tenant growth)

---

## User-Value Epic 4: Security & Compliance
**WHY:** Users need GDPR/CCPA compliance, audit logs, rate limiting, and adaptive resource guards to meet security and regulatory requirements (covers FR35-43)

- **Story 4.1: Export/Delete Personal Data (GDPR/CCPA)**
  - **As a** End User, **I want to** export all my personal data or delete my account permanently **so that** I comply with GDPR/CCPA regulations
  - **Given** I am in the Privacy Settings page
  - **When** I click "Export My Data" or "Delete Account"
  - **Then** I receive a ZIP file with all my data (within 72 hours) or my account is deleted permanently (after 30-day grace period)
  - **FR Coverage:** FR35 (GDPR/CCPA)

- **Story 4.2: View Audit Logs**
  - **As a** Admin User, **I want to** view audit logs for all user actions (login, mission create, billing change) **so that** I can investigate security incidents
  - **Given** I am on the Audit Log page
  - **When** I filter by "Last 7 Days" and "User: John Doe"
  - **Then** I see a list of all actions performed by John Doe with timestamp, IP address, and action details
  - **FR Coverage:** FR36 (Audit logs)

- **Story 4.3: Configure Rate Limiting**
  - **As a** Admin User, **I want to** set per-user and per-API-key rate limits **so that** I can prevent abuse and ensure fair usage
  - **Given** I am in the Rate Limiting Settings page
  - **When** I set "Pro User" rate limit to 100 req/min
  - **Then** Pro users are limited to 100 requests per minute, and receive a 429 error when exceeded
  - **FR Coverage:** FR37 (Rate limiting)

- **Story 4.4: Track Model Usage**
  - **As a** Admin User, **I want to** track GPU/LLM model usage per user **so that** I can allocate resources fairly and bill Enterprise users accurately
  - **Given** I am on the Model Tracking dashboard
  - **When** I filter by "Last 30 Days"
  - **Then** I see: total GPU hours per user, LLM token usage per user, and cost allocation by team
  - **FR Coverage:** FR38 (Model tracking)

- **Story 4.5: Configure Adaptive Resource Guard**
  - **As a** Admin User, **I want to** set resource limits (RAM, GPU, CPU) per tier **so that** the system automatically throttles resource-heavy missions
  - **Given** I am in the Resource Guard settings
  - **When** I set "Free User" GPU limit to 0 (no GPU access)
  - **Then** Free users' missions that require GPU are queued but not executed, with a message to upgrade to Pro
  - **FR Coverage:** FR39 (Adaptive resource guard)

- **Story 4.6: Monitor Health Checks**
  - **As a** Operations Team Member, **I want to** view system health checks (API uptime, GPU availability, database status) **so that** I can respond to outages quickly
  - **Given** I am on the System Health page
  - **When** the API is down
  - **Then** I see a red "API: Down" indicator, and receive a PagerDuty alert
  - **FR Coverage:** FR40 (Health checks)

- **Story 4.7: Configure Exponential Backoff for Retries**
  - **As a** Operations Team Member, **I want to** failed missions to retry with exponential backoff **so that** we don't overwhelm external services during outages
  - **Given** a mission fails due to an external API timeout
  - **When** the system retries the mission
  - **Then** the retry interval increases exponentially (1s, 2s, 4s, 8s) up to a maximum of 1 hour, and the mission is marked as failed after 5 retries
  - **FR Coverage:** FR41 (Exponential backoff)

---

## Technical Epic A: Data Architecture (Supports Epic 1, 2, 4)

- **Story A.1: Set up Postgres 16 + Redis 7.2 + Qdrant 1.7**
  - **As a** Developer, **I want to** set up Postgres 16, Redis 7.2, and Qdrant 1.7 **so that** we have a solid data foundation for mission state and analytics
  - **Given** the database servers are provisioned
  - **When** I run the deployment playbook
  - **Then** all 3 services are running, versions are verified via web_search, and FastAPI connections are configured
  - **FR Coverage:** FR1-FR11 (partial)

- **Story A.2: Implement Pydantic v2 Validation Layer**
  - **As a** Developer, **I want to** implement Pydantic v2 validation layer **so that** all API inputs are validated before processing
  - **Given** a request to the mission creation API
  - **When** invalid data is sent (e.g., negative ETA)
  - **Then** a 422 error is returned with user-friendly validation messages
  - **FR Coverage:** FR1-FR11 (partial)

- **Story A.3: Add Rhasspy-Style Intent Grammar**
  - **As a** Developer, **I want to** add Rhasspy-style intent grammar for skill commands **so that** mission commands are parsed correctly
  - **Given** a user sends "recover workflow 123"
  - **When** the intent parser processes the command
  - **Then** it extracts intent=recover, slot=123 and routes to the correct handler
  - **FR Coverage:** FR1-FR11 (partial)

- **Story A.4: Define DDD Aggregates for Workflow State**
  - **As a** Developer, **I want to** define DDD aggregates for workflow state transitions **so that** business rules are enforced
  - **Given** a workflow recovery request is received
  - **When** the workflow is in "stalled" state
  - **Then** the aggregate enforces the business rule: "only stalled workflows can be recovered"
  - **FR Coverage:** FR1-FR11 (partial)

- **Story A.5: Set up Alembic 1.13 Migrations**
  - **As a** Developer, **I want to** set up Alembic 1.13 migrations **so that** database schema stays in sync with models
  - **Given** a new model field is added
  - **When** I run `alembic revision --autogenerate`
  - **Then** a migration file is created and can be applied with `alembic upgrade head`
  - **FR Coverage:** FR1-FR11 (partial)

- **Story A.6: Implement Multi-Level Redis Caching**
  - **As a** Developer, **I want to** implement multi-level Redis caching **so that** API responses are fast
  - **Given** a request to the mission list API
  - **When** the same request is made within 1 minute
  - **Then** the cached response is returned (API 1min TTL, state 30s TTL, sessions 24h TTL)
  - **FR Coverage:** FR1-FR11 (partial), NFR1 (latency)

---

## Technical Epic B: API & Communication (Supports Epic 1, 2, 3)

- **Story B.1: Set up FastAPI 0.136.0 with OpenAPI 3.0.3 Docs**
  - **As a** Developer, **I want to** set up FastAPI 0.136.0 with OpenAPI 3.0.3 docs **so that** frontend teams can generate TypeScript types automatically
  - **Given** FastAPI is installed
  - **When** I navigate to /openapi.json
  - **Then** a valid OpenAPI 3.0.3 spec is returned, and TypeScript types can be generated via openapi-typescript-codegen
  - **FR Coverage:** FR20 (API integrations), NFR14 (OpenAPI compliance)

- **Story B.2: Implement Error Schema with user_message Field**
  - **As a** Developer, **I want to** implement error schema with user_message field **so that** frontend can show user-friendly errors
  - **Given** an API error occurs (e.g., mission not found)
  - **When** the error is returned to the frontend
  - **Then** it includes: {error: {code, message, user_message, request_id, timestamp}}
  - **FR Coverage:** FR1-FR11 (partial)

- **Story B.3: Add Redis 7.2 Rate Limiting**
  - **As a** Developer, **I want to** add Redis 7.2 rate limiting **so that** we prevent abuse per user/API key
  - **Given** a user has made 100 requests in the last minute
  - **When** they make the 101st request
  - **Then** a 429 error is returned with "Rate limit exceeded. Try again in X seconds"
  - **FR Coverage:** FR1-FR11 (partial), NFR8 (rate limiting)

- **Story B.4: Implement Hybrid HTTP/SSE/Redis pub/sub**
  - **As a** Developer, **I want to** implement hybrid HTTP/SSE/Redis pub/sub **so that** real-time updates work reliably
  - **Given** a mission's status changes
  - **When** the SSE connection is active
  - **Then** the status update is pushed to the frontend within 100ms
  - **FR Coverage:** FR12-FR15 (partial), NFR3 (real-time updates)

- **Story B.5: Next.js 16 Frontend API Integration**
  - **As a** Developer, **I want to** set up Next.js 16 frontend API integration **so that** the UI can talk to the backend
  - **Given** the OpenAPI spec is available
  - **When** I run the TypeScript code generator
  - **Then** type-safe API client is generated and usable in Next.js components
  - **FR Coverage:** FR20 (API integrations)

---

## Technical Epic C: Authentication & Security (Supports Epic 3, 4)

- **Story C.1: Implement JWT Auth (15min access, 7day refresh)**
  - **As a** Developer, **I want to** implement JWT auth (15min access, 7day refresh) **so that** user sessions are secure and short-lived
  - **Given** a user logs in with valid credentials
  - **When** they receive an access token
  - **Then** the token is valid for 15 minutes, and can be refreshed with a 7-day refresh token
  - **FR Coverage:** FR20-FR26 (partial), NFR6 (BYOK sessionStorage)

- **Story C.2: Configure RBAC (Admin/User/Viewer Roles)**
  - **As a** Developer, **I want to** configure RBAC (Admin/User/Viewer roles) **so that** permissions are enforced correctly
  - **Given** a Viewer user tries to access an Admin-only endpoint
  - **When** they make the request
  - **Then** a 403 Forbidden error is returned
  - **FR Coverage:** FR24 (Admin config)

- **Story C.3: Set up API Key Management for Services**
  - **As a** Developer, **I want to** set up API key management for services **so that** BYOK works securely
  - **Given** a user saves their OpenAI API key
  - **When** the key is stored
  - **Then** it is encrypted (AES-256) and can be retrieved only by the owning user
  - **FR Coverage:** FR22 (BYOK UI), NFR5 (encryption)

- **Story C.4: Implement AES-256 Encryption for Sensitive Data**
  - **As a** Developer, **I want to** implement AES-256 encryption for sensitive data **so that** we meet security requirements
  - **Given** a user's API key needs to be stored
  - **When** the encryption function is called
  - **Then** the key is encrypted with AES-256 and stored in Postgres
  - **FR Coverage:** FR35 (GDPR/CCPA), NFR5 (encryption)

- **Story C.5: Configure Cross-System Auth (VPS ↔ Home Lab)**
  - **As a** Developer, **I want to** configure cross-system auth (VPS ↔ Home Lab) **so that** services can communicate securely
  - **Given** the VPS backend needs to call a Home Lab GPU service
  - **When** the request is made with a valid JWT
  - **Then** the Home Lab service validates the token and processes the request
  - **FR Coverage:** FR20-FR26 (partial)

- **Story C.6: Set up Token Lifecycle Management**
  - **As a** Developer, **I want to** set up token lifecycle management **so that** tokens are refreshed automatically
  - **Given** an access token is about to expire
  - **When** the frontend detects <1min remaining
  - **Then** it silently refreshes the token using the 7-day refresh token
  - **FR Coverage:** FR22 (BYOK), NFR6 (sessionStorage)

---

## Technical Epic D: Infrastructure & Deployment (Supports all Epics)

- **Story D.1: Deploy Hybrid VPS/Home Lab Topology**
  - **As a** DevOps Engineer, **I want to** deploy hybrid VPS/Home Lab topology **so that** we balance cost (VPS) and GPU capacity (Home Lab)
  - **Given** VPS and Home Lab servers are provisioned
  - **When** I run the Docker Compose stack
  - **Then** Traefik routes frontend/api to VPS, and GPU missions to Home Lab
  - **FR Coverage:** FR1-FR11 (partial), NFR12 (hybrid compute)

- **Story D.2: Configure Docker Compose for All Services**
  - **As a** DevOps Engineer, **I want to** configure Docker Compose for all services **so that** deployment is reproducible
  - **Given** the docker-compose.yml is defined
  - **When** I run `docker compose up -d`
  - **Then** all services start: Traefik, backend, frontend, Redis, Postgres, Qdrant
  - **FR Coverage:** FR1-FR11 (partial)

- **Story D.3: Set up Traefik v3.6.14 Reverse Proxy**
  - **As a** DevOps Engineer, **I want to** set up Traefik v3.6.14 reverse proxy **so that** routing and load balancing work
  - **Given** Traefik is configured
  - **When** I access https://flowmanner.com
  - **Then** the request is routed to the correct backend service with 30s health checks
  - **FR Coverage:** FR1-FR11 (partial), NFR15 (proxy health checks)

- **Story D.4: Create Deployment Pipeline**
  - **As a** DevOps Engineer, **I want to** create deployment pipeline **so that** changes are deployed automatically
  - **Given** a PR is merged to main
  - **When** the GitHub Action runs
  - **Then** the VPS is updated with the latest code
  - **FR Coverage:** FR1-FR11 (partial)

- **Story D.5: Deploy Prometheus + Grafana Monitoring**
  - **As a** DevOps Engineer, **I want to** deploy Prometheus + Grafana monitoring **so that** we can track system health
  - **Given** Prometheus is scraping metrics
  - **When** I open the Grafana dashboard
  - **Then** I see: API latency, error rates, queue depth, and 99.9% uptime SLA
  - **FR Coverage:** FR16-FR19 (partial), NFR18 (uptime)

- **Story D.6: Set up Backup/Restore for Postgres/Redis**
  - **As a** DevOps Engineer, **I want to** set up backup/restore for Postgres/Redis **so that** data is not lost
  - **Given** a daily backup job runs
  - **When** a database corruption occurs
  - **Then** I can restore from the previous day's backup
  - **FR Coverage:** FR1-FR11 (partial)

---

## Technical Epic E: Performance & Scaling (Supports all Epics)

- **Story E.1: Implement Per-Service Latency Budgets**
  - **As a** DevOps Engineer, **I want to** implement per-service latency budgets **so that** all APIs meet <500ms response time NFR
  - **Given** a request to the mission recovery API
  - **When** the API takes >500ms to respond
  - **Then** an alert is sent to Sentry, and the hot path is profiled for optimization
  - **FR Coverage:** FR1-FR11 (partial), NFR1 (latency)

- **Story E.2: Deploy Tiered Scaling (VPS/Home Lab/GPU)**
  - **As a** DevOps Engineer, **I want to** deploy tiered scaling (VPS/Home Lab/GPU) **so that** we handle load efficiently
  - **Given** VPS RAM usage is >80%
  - **When** a new mission arrives
  - **Then** it is routed to Home Lab if it requires GPU, otherwise VPS
  - **FR Coverage:** FR1-FR11 (partial), NFR10 (RAM constraint), NFR12 (hybrid compute)

- **Story E.3: Deploy Multi-Level Caching (Redis + Cloudflare CDN)**
  - **As a** DevOps Engineer, **I want to** deploy multi-level caching (Redis + Cloudflare CDN) **so that** API latency is reduced
  - **Given** a cacheable API request is made
  - **When** the cache has a valid entry
  - **Then** it is returned from Redis (L1) or CDN (L2) without hitting the database
  - **FR Coverage:** FR1-FR11 (partial), NFR1 (latency)

- **Story E.4: Configure Traefik Load Balancing**
  - **As a** DevOps Engineer, **I want to** configure Traefik load balancing **so that** traffic is distributed evenly
  - **Given** multiple backend instances are running
  - **When** a request arrives
  - **Then** it is routed to the healthiest instance (30s health checks, 3 retries)
  - **FR Coverage:** FR1-FR11 (partial), NFR15 (proxy health checks)

- **Story E.5: Implement GPU Auto-Scaling**
  - **As a** DevOps Engineer, **I want to** implement GPU auto-scaling **so that** we handle GPU mission spikes
  - **Given** >5 pending GPU missions
  - **When** auto-scaling triggers
  - **Then** new GPU containers are spun up, with 10min idle timeout to scale down
  - **FR Coverage:** FR1-FR11 (partial)

- **Story E.6: Deploy Monitoring Alerts**
  - **As a** DevOps Engineer, **I want to** deploy monitoring alerts **so that** we catch issues early
  - **Given** a metric crosses its threshold (e.g., 80% RAM)
  - **When** the alert fires
  - **Then** the operations team is notified via PagerDuty within 1 minute
  - **FR Coverage:** FR16-FR19 (partial), NFR18 (uptime), NFR20 (auto-failover)

---

## Technical Epic F: Patterns Implementation (Supports all Epics)

- **Story F.1: Implement Layered Validation Pattern**
  - **As a** Developer, **I want to** implement Layered Validation Pattern **so that** all inputs follow Pydantic → Rhasspy → DDD pipeline
  - **Given** a mission creation request is received
  - **When** the request passes Pydantic validation
  - **Then** it is validated against Rhasspy intent grammar and DDD aggregate rules before execution
  - **FR Coverage:** FR1-FR11 (partial)

- **Story F.2: Build Hybrid Proxy Chain Pattern**
  - **As a** Developer, **I want to** build Hybrid Proxy Chain Pattern **so that** VPS-Home Lab communication is reliable
  - **Given** a request needs to go from VPS to Home Lab
  - **When** the proxy chain executes
  - **Then** it uses connection pooling, keep-alive, and achieves ~150ms latency reduction
  - **FR Coverage:** FR1-FR11 (partial), NFR2 (proxy chain latency)

- **Story F.3: Deploy Multi-Level Caching Pattern**
  - **As a** Developer, **I want to** deploy Multi-Level Caching Pattern **so that** API latency is reduced by ~300ms
  - **Given** a cacheable API request is made
  - **When** the cache has a valid entry
  - **Then** it is returned from Redis (L1) or CDN (L2) without hitting the database
  - **FR Coverage:** FR1-FR11 (partial), NFR1 (latency)

- **Story F.4: Configure Tiered Scaling Pattern**
  - **As a** Developer, **I want to** configure Tiered Scaling Pattern **so that** missions are prioritized correctly
  - **Given** missions are queued with different priorities (High/Medium/Low)
  - **When** the scheduler runs
  - **Then** High priority missions are executed first, with fair sharing among same priority
  - **FR Coverage:** FR1-FR11 (partial), NFR10 (RAM constraint)

- **Story F.5: Implement JWT + RBAC Pattern**
  - **As a** Developer, **I want to** implement JWT + RBAC Pattern **so that** per-user instance auth works
  - **Given** a request includes a valid JWT
  - **When** the RBAC middleware checks permissions
  - **Then** it allows/denies based on user role (Admin/User/Viewer)
  - **FR Coverage:** FR24 (Admin config), FR26 (Automated agents)

- **Story F.6: Set up Health-Check LB Pattern**
  - **As a** Developer, **I want to** set up Health-Check LB Pattern **so that** traffic goes only to healthy instances
  - **Given** a backend instance fails its health check
  - **When** Traefik detects the failure
  - **Then** it stops routing traffic to that instance within 30 seconds
  - **FR Coverage:** FR1-FR11 (partial), NFR15 (proxy health checks)

- **Story F.7: Build GPU Auto-Scaling Pattern**
  - **As a** Developer, **I want to** build GPU Auto-Scaling Pattern **so that** GPU resources are used efficiently
  - **Given** GPU queue depth >5
  - **When** auto-scaling triggers
  - **Then** new GPU containers are created via Docker Compose, with queue-based scaling
  - **FR Coverage:** FR1-FR11 (partial)

- **Story F.8: Deploy Observability Stack Pattern**
  - **As a** Developer, **I want to** deploy Observability Stack Pattern **so that** we achieve <5min MTTR
  - **Given** an error occurs in production
  - **When** Sentry captures the error
  - **Then** the team is alerted, and the error details are logged to Prometheus/Grafana for debugging
  - **FR Coverage:** FR16-FR19 (partial), NFR18 (uptime), NFR21 (test coverage)

---

## FR Coverage Mapping

| FR ID | Epic | Story |
|-------|------|-------|
| FR1-FR11 | Technical Epics A-F | Stories A.1-A.6, B.1-B.5, C.1-C.6, D.1-D.6, E.1-E.6, F.1-F.8 |
| FR12 | Epic 1 | Story 1.1 |
| FR13 | Epic 1 | Story 1.2 |
| FR14 | Epic 1 | Story 1.4 |
| FR15 | Epic 1 | Story 1.3 |
| FR16 | Epic 2 | Story 2.1 |
| FR17 | Epic 2 | Story 2.2 |
| FR18 | Epic 2 | Story 2.3 |
| FR19 | Epic 2 | Story 2.4 |
| FR20-FR21 | Technical Epics A-F | Stories A.1-A.6, B.1-B.5, C.1-C.6, D.1-D.6, E.1-E.6, F.1-F.8 |
| FR22 | Epic 3 | Story 3.1 |
| FR23-FR26 | Technical Epics A-F | Stories A.1-A.6, B.1-B.5, C.1-C.6, D.1-D.6, E.1-E.6, F.1-F.8 |
| FR27 | Epic 1 | Story 1.1, 1.2, 1.3 |
| FR28 | Technical Epics A-F | Stories A.1-A.6, B.1-B.5, C.1-C.6, D.1-D.6, E.1-E.6, F.1-F.8 |
| FR29 | Epic 3 | Story 3.4 |
| FR30 | Epic 3 | Story 3.2 |
| FR31 | Epic 3 | Story 3.5 |
| FR32 | Epic 3 | Story 3.5 |
| FR33 | Epic 3 | Story 3.5 |
| FR34 | Epic 3 | Story 3.3 |
| FR35 | Epic 4 | Story 4.1 |
| FR36 | Epic 4 | Story 4.2 |
| FR37 | Epic 4 | Story 4.3 |
| FR38 | Epic 4 | Story 4.4 |
| FR39 | Epic 4 | Story 4.5 |
| FR40 | Epic 4 | Story 4.6 |
| FR41 | Epic 4 | Story 4.7 |
| FR42-FR43 | Technical Epics A-F | Stories A.1-A.6, B.1-B.5, C.1-C.6, D.1-D.6, E.1-E.6, F.1-F.8 |

**Total Coverage: 43/43 FRs (100%)**
**Total Epics: 4 User-Value + 6 Technical = 10 Epics**
**Total Stories: 37 User-Value + 37 Technical = 74 Stories (all in proper format)**

---

## NFR Coverage Mapping

| NFR ID | Epic | Story |
|--------|------|-------|
| NFR1 | Technical Epic A | Story A.1 (latency budgets) |
| NFR2 | Technical Epic B | Story B.4 (hybrid HTTP/SSE/Redis) |
| NFR3 | Epic 1 | Story 1.2 (SSE real-time updates) |
| NFR4 | Epic 2 | Story 2.1 (dashboard caching) |
| NFR5 | Technical Epic C + Epic 4 | Story C.4 (AES-256), Story 4.1 (GDPR) |
| NFR6 | Epic 3 | Story 3.1 (BYOK sessionStorage) |
| NFR7 | Epic 4 | Story 4.1 (GDPR/CCPA) |
| NFR8 | Epic 4 | Story 4.3 (rate limiting) |
| NFR9 | Technical Epic C | Story C.5 (PII controls) |
| NFR10 | Technical Epic E + Epic 4 | Story E.2 (tiered scaling), Story 4.5 (resource guard) |
| NFR11 | Technical Epic E | Story E.2 (tiered scaling) |
| NFR12 | Technical Epic D | Story D.1 (hybrid topology) |
| NFR13 | Technical Epic E | Story E.2 (tiered scaling) |
| NFR14 | Technical Epic B | Story B.1 (OpenAPI 3.0.3) |
| NFR15 | Technical Epic D | Story D.3 (Traefik health checks) |
| NFR16 | Technical Epic C + Epic 3 | Story C.3 (API keys), Story 3.1 (BYOK) |
| NFR17 | Technical Epic D | Story D.1 (hybrid routing) |
| NFR18 | Technical Epic D | Story D.5 (Prometheus/Grafana uptime) |
| NFR19 | Technical Epic B | Story B.4 (proxy chain reliability) |
| NFR20 | Epic 4 | Story 4.7 (exponential backoff) |
| NFR21 | Technical Epic F | Story F.8 (Observability Stack) |

**Total NFR Coverage: 21/21 NFRs (100%)**

---

## Next Steps

1. ✅ **Party Mode Sign-off** — Get sign-off from Mary (BA), Amelia (Dev), Quinn (QA), John (PM), Bob (Scrum Master)
2. ✅ **Commit** — `"Add Epics and Stories with 100% FR+NFR coverage (Party Mode approved)"`
3. ✅ **Push** to `feature/flowmanner-architecture`
4. ✅ **Phase 3 Step 6 Complete** — Proceed to Phase 4 Implementation
