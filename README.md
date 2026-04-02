# CursorKnowledgeExporter

> Automatically analyze, classify, and archive knowledge from AI-assisted development conversations.

Teams using Cursor accumulate valuable engineering knowledge through daily AI interactions — design decisions, bug analysis, build procedures, testing methods, and more. Most of this knowledge lives only in transient chat sessions and is lost when those sessions expire.

**CursorKnowledgeExporter** automatically analyzes conversation content, maps it to R&D workflow phases, and saves it as structured, reusable documentation.

## How It Works

```
Conversation content
       ↓
  AI analyzes & classifies
       ↓
  Maps to R&D phase (coding / bug fix / design / ...)
       ↓
  Generates structured doc → saves to doc/
```

Two complementary components:

| Component | Role | How it works |
|-----------|------|-------------|
| **Skill** | On-demand archiving | User says "保存对话" → AI analyzes full conversation → classifies → saves docs |
| **Rule** | Just-in-time prompting | After completing a task (e.g. fixing a bug), AI proposes to save a summary doc |

Both use a shared **asset checklist** (6 R&D phases, 31 items) as classification index.

## What's Included

```
KnowledgeExporter/
├── install-skill.bat                     ← One-click install (Windows)
├── install-skill.sh                      ← One-click install (macOS/Linux)
├── 使用指南.md                           ← User guide (Chinese)
├── cursor-knowledge-export-checklist.md  ← Standalone checklist (printable)
├── skill/
│   ├── SKILL.md                          ← Cursor Skill: analyze & archive
│   └── references/
│       └── asset-checklist.md            ← Shared classification index
└── rule/
    └── knowledge-recording.mdc           ← Cursor Rule: just-in-time save prompts
```

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

**Option A: Run the install script (recommended)**
```bash
# Windows
install-skill.bat

# macOS / Linux
bash install-skill.sh
```

**Option B: Manual copy** — copy `skill/` folder to:
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

**On-demand archiving (Skill):**
- Say **"保存对话"** — AI analyzes the conversation, classifies content by R&D phase, generates and saves docs

**Just-in-time saving (Rule):**
- After fixing a bug, AI proposes: *"Bug fixed. Save the analysis process as a doc?"*
- Reply "好" / "save" / "yes" → doc is generated and saved automatically

## Extending the Checklist

Append a row to the corresponding phase table in `skill/references/asset-checklist.md`:

```markdown
| 3.8 | New asset name | Description | Reference prompt text |
```

Both Skill and Rule will automatically pick up the new entry.

## License

[MIT](LICENSE)
