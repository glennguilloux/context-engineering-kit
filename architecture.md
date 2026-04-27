## Category 4: Infrastructure & Deployment
Following Pa s3 Step 4 well all 6 ADRs)

### ADR 4.1: Infrastructure Topology
Date: 2026-04-27
Status: Proposed (Party Mode Signed by Mary, Amelia, Quinn, John, Bob)
Context: Flowmanner requires a hybrid compute model to balance cost-effective edge hosting with GPU-intensive AI/mission workloads. The VPS (74.208.115.142) has a hard 16GB RAM limit, while the Home Lab (172.16.1.1) has 4x RTX GPU for large model inference and complex mission execution.
Decision: Adopt a hybrid topology:
- VPS hosts edge services: Traefik v3.6.14, Next.js 16 frontend, VPS backend proxy (flowmanner-app)
- Home Lab hosts core backend services: FastAPI backend, Postgres 16, Redis 7.2, Qdrant 1.7, GPU-accelerated mission workers
-  Auto-failover routes lightweigh tasks to VPS, complex missions to home Lab
Consequences: 
- 🌱 Cost-effective: only VPS edge services incur hosting costs
- 🚀 GPU access:: Home Lab handles resource-intensive LLM/mission workloads
- 🚀 Proxy chain latency: adds ~200ms per request (within >1s NFR target)
- 🚀 Conservation: requires stable Home Lab connectivity for core backend availability

### ADR 4.2: Containerization & Orchestration
D
