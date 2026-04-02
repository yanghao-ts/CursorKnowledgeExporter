# CursorKnowledgeExporter

> Extract and preserve knowledge generated during AI-assisted development workflows.

Teams using Cursor (or similar AI coding assistants) accumulate valuable engineering knowledge through daily interactions — design decisions, bug analysis, build procedures, testing methods, and more. Most of this knowledge lives only in transient AI chat sessions and is lost when those sessions expire.

**CursorKnowledgeExporter** provides a structured toolkit to systematically convert these transient AI interactions into reusable, long-term engineering assets.

## What's Included

```
KnowledgeExporter/
├── 使用指南.md                           ← User guide (Chinese)
├── cursor-knowledge-export-checklist.md  ← Standalone checklist (printable)
├── skill/
│   ├── SKILL.md                          ← Cursor Skill: scan & export
│   └── references/
│       └── asset-checklist.md            ← Shared asset registry (extensible)
└── rule/
    └── knowledge-recording.mdc           ← Cursor Rule: daily auto-reminders
```

| Component | Role | Trigger |
|-----------|------|---------|
| **Skill** | Systematically scan project, identify missing docs, guide generation | User says "导出知识资产" / "export knowledge" |
| **Rule** | Detect work patterns during daily dev, remind to record | Automatic (alwaysApply) |
| **asset-checklist.md** | Shared data source defining 6 R&D phases × 31 asset items with prompt templates | Referenced by both Skill & Rule |

## Coverage: 6 R&D Phases

| Phase | Items | Focus |
|-------|:-----:|-------|
| ① Requirements Analysis | 3 | Requirement breakdown, feasibility, effort estimation |
| ② Design | 4 | Architecture, decisions, interfaces, tech selection |
| ③ Coding | 7 | Build methods, environment setup, dependencies, deployment |
| ④ Self-testing | 4 | Test methods, unit tests, smoke tests |
| ⑤ Bug Fixing | 5 | Bug analysis records, methodology, patterns, performance |
| ⑥ Testing | 8 | Test cases, automation scripts, frameworks, cross-machine collaboration |

## Quick Start

### 1. Install Skill (global, all projects)

Copy `skill/` folder to:
```
Windows: %USERPROFILE%\.cursor\skills\knowledge-export\
macOS:   ~/.cursor/skills/knowledge-export/
```

### 2. Install Rule (per project)

Copy `rule/knowledge-recording.mdc` to:
```
<project-root>/.cursor/rules/knowledge-recording.mdc
```

### 3. Use

In Cursor chat, say:
- **"帮我导出知识资产"** — Full scan & guided export
- **"检查文档完整性"** — Check what's missing
- **"帮我补充编译指导文档"** — Generate a specific document

## Extending the Checklist

To add new knowledge asset types, simply append a row to the corresponding phase table in `skill/references/asset-checklist.md`:

```markdown
| 3.8 | New asset name | Description | Reference prompt text |
```

Both Skill and Rule will automatically pick up the new entry on next execution.

## License

[MIT](LICENSE)
