# Reliable Engineering through Spec-Driven Development (SDD)

Structured workflow for features and bugs requiring planning, specifications, and architecture decisions before implementation. Mainly based around of [SDD](../plugins/sdd/README.md) plugin.

For simple features, use [Feature Development with Quality Gates](./feature-development.md) workflow.

## When to Use

- Features requiring complex development
- Significant architectural changes or integrations

## Plugins needed for this workflow

- [SDD](../plugins/sdd/README.md)
- [Git](../plugins/git/README.md)

## Workflow

### Specification Creation

Optional, but highly recommended to switch model to `sonnet[1m]` in order to keep model focused for longer time.

Important: it not means that sonnet will be used for work itself. By default `sonnet` will be used as orcestrator in order to launch `opus` agents that will perform actual work.

```bash
/model sonnet[1m]
```

Create tasks file with initial prompt

```bash
/add-task "Design and implement authentication middleware with JWT support"
# Output:
# Created task file: .specs/tasks/draft/design-implement-authentication-middleware-with-jwt-support.feature.md
# Title: Design and implement authentication middleware with JWT support
# Type: feature
# Depends on: None
```

You can adjust task file to incorrporate additional details and creiterias at this moment. But it is not required.

Run planing process

```bash
/plan 
```

It will perform following refinement process in order to update task file with more detailed specification:

```mermaid
flowchart TB
    subgraph Input
        A[📄 Draft Task File<br/>.specs/tasks/draft/*.md]
    end

    subgraph Phase2["Phase 2: Parallel Analysis"]
        direction LR
        B1[🔬 Research<br/>researcher · sonnet]
        B2[📂 Codebase Analysis<br/>code-explorer · sonnet]
        B3[💼 Business Analysis<br/>business-analyst · opus]
        
        J1[⚖️ Judge 2a]
        J2[⚖️ Judge 2b]
        J3[⚖️ Judge 2c]
        
        B1 --> J1
        B2 --> J2
        B3 --> J3
    end

    subgraph Phase3["Phase 3: Architecture Synthesis"]
        C[🏗️ Architecture Synthesis<br/>software-architect · opus]
        JC[⚖️ Judge 3]
        C --> JC
    end

    subgraph Phase4["Phase 4: Decomposition"]
        D[📋 Decomposition<br/>tech-lead · opus]
        JD[⚖️ Judge 4]
        D --> JD
    end

    subgraph Phase5["Phase 5: Parallelize"]
        E[🔀 Parallelize Steps<br/>team-lead · opus]
        JE[⚖️ Judge 5]
        E --> JE
    end

    subgraph Phase6["Phase 6: Verifications"]
        F[✅ Define Verifications<br/>qa-engineer · opus]
        JF[⚖️ Judge 6]
        F --> JF
    end

    subgraph Output
        G[📄 Refined Task File<br/>.specs/tasks/todo/*.md]
        H[📚 Skill File<br/>.claude/skills/*/SKILL.md]
        I[📊 Analysis File<br/>.specs/analysis/*.md]
    end

    A --> Phase2
    J1 & J2 & J3 --> Phase3
    JC --> Phase4
    JD --> Phase5
    JE --> Phase6
    JF --> G & H & I

    style A fill:#e1f5fe
    style G fill:#c8e6c9
    style H fill:#c8e6c9
    style I fill:#c8e6c9
```

It will output updated task file to `.specs/tasks/todo/design-implement-authentication-middleware-with-jwt-support.feature.md` and create new skills if it is needed. Plus, it will produce scratchpads and verification reports along the way in order to properly think and evaluate each step of the process. You can simply ignore all of them.

At this moment you can verify specification and adjust, and then run `/plan --refine` command again in order for agents to update rest of the specification if it not aligned with your changes. It uses top-to-bottom approach to update specification, which means that all sections below your changes will be rethinked and updated accordingly.

### Code Generation

Once you are happy with specification, you can run implementation process

```bash
/implement
```

It will perform following actions:

```mermaid
flowchart TB
    subgraph Phase0["Phase 0: Select Task"]
        A[📄 Task from todo/<br/>or in-progress/]
        A --> B[📁 Move to in-progress/]
    end

    subgraph Phase1["Phase 1: Load Task"]
        C[📖 Parse Implementation Steps<br/>& Verification Requirements]
    end

    subgraph Phase2["Phase 2: Execute Steps"]
        D[🔄 For Each Step]
        
        subgraph StepExec["Step Execution Loop"]
            E[👨‍💻 Developer Agent<br/>Implement Step]
            F{Verification<br/>Level?}
            
            G1[⏭️ None<br/>Skip Judge]
            G2[⚖️ Single Judge<br/>threshold: 4.0]
            G3[⚖️⚖️ Panel of 2<br/>threshold: 4.5]
            G4[⚖️ Per-Item<br/>Parallel Judges]
            
            H{PASS?}
            I[🔧 Fix & Retry<br/>with feedback]
            J[✅ Mark Step DONE]
        end
        
        D --> E
        E --> F
        F -->|None| G1 --> J
        F -->|Single| G2 --> H
        F -->|Panel| G3 --> H
        F -->|Per-Item| G4 --> H
        H -->|Yes| J
        H -->|No| I --> E
        J --> D
    end

    subgraph Phase3["Phase 3: Final Verification"]
        K[📋 Verify Definition of Done]
        L{All DoD<br/>PASS?}
        M[🔧 Fix Failing Items]
    end

    subgraph Phase4["Phase 4: Complete"]
        N[📁 Move to done/]
        O[📊 Final Report]
    end

    Phase0 --> Phase1
    Phase1 --> Phase2
    Phase2 --> Phase3
    K --> L
    L -->|No| M --> K
    L -->|Yes| Phase4

    style A fill:#e1f5fe
    style N fill:#c8e6c9
    style O fill:#c8e6c9
```

It will automatically write tests and verify them, build and verify that solution is working as expected.

Once implementation is complete, you can check it and adjust, then run `/implement --refine` command again in order to agent to update rest of the implementation if it not aligned with your cahgnes or feedback.

### Commit and Push

Once it complete, you can use [git](../git) plugin in order to commit changes and create pull request.

```bash
/git:commit
/git:create-pr
```
