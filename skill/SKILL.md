---
name: knowledge-export
description: >-
  Scan the current project and export knowledge assets accumulated during
  Cursor-assisted development. Use when the user says '导出知识资产',
  '知识资产检查', 'export knowledge', '文档自检', or '检查文档完整性'.
  Do NOT use for daily development recording — that is handled by the
  knowledge-recording rule.
---

# Knowledge Exporter: 知识资产扫描与导出

扫描项目，识别缺失的知识文档，引导用户补全并导出。

## Quick Reference

| 用户说 | 执行动作 |
|--------|---------|
| "导出知识资产" / "知识资产检查" | 完整流程（Step 1-4） |
| "检查 XX 阶段的文档" | 仅扫描指定阶段 |
| "补充 XX 文档" | 直接生成指定文档 |

---

## 执行流程

### Step 1 · 扫描项目现状

扫描项目的 `doc/` 目录（或用户指定目录），识别已有的文档。

```
扫描范围：
- doc/**/*.md
- README.md
- 构建配置文件（CMakeLists.txt / .pro / Makefile / package.json 等）
- 测试相关目录（test/ / tests/ / scripts/ 等）
```

### Step 2 · 对照清单识别缺口

对照 [references/asset-checklist.md](references/asset-checklist.md) 中的 6 个研发阶段，将现有文档映射到清单项，识别缺失项。

输出格式：

```
## 扫描结果

### 已有文档
| 清单项 | 对应文档 | 完整度 |
|--------|---------|--------|
| 3.1 编译/构建方法 | doc/编译指导.md | ✅ 完整 |
| ...    | ...     | ...    |

### 缺失文档
| 清单项 | 优先级 | 建议操作 |
|--------|--------|---------|
| 5.1 历史 Bug 分析记录 | P0 | 回顾对话历史生成 |
| ...    | ...    | ...     |
```

### Step 3 · 引导用户选择导出项

向用户展示扫描结果，询问：

1. 哪些缺失项需要立即导出？
2. 已有文档中哪些需要补充完善？
3. 是否有不在清单中但需要记录的内容？（如有，记录到自定义项）

CRITICAL: 尊重用户选择，不要强制导出所有项。按用户选择的优先级执行。

### Step 4 · 逐项生成文档

对用户选择的每一项，使用 [references/asset-checklist.md](references/asset-checklist.md) 中的参考提示词作为生成指引：

1. 回顾当前对话及项目中已有的相关信息
2. 生成文档内容
3. 保存到 `doc/` 目录（或用户指定路径）
4. 向用户展示，确认是否需要补充

每完成一项，更新进度：
```
✅ 3.1 编译/构建方法 → doc/编译指导.md（已生成）
⏳ 5.1 历史 Bug 分析记录 → 进行中...
❌ 2.2 关键设计决策 → 待处理
```

---

## 扩展机制

如果用户发现有知识资产不在现有清单中：

1. 询问该资产属于哪个研发阶段（①-⑥）
2. 确认资产名称、说明、参考提示词
3. 追加到 [references/asset-checklist.md](references/asset-checklist.md) 对应阶段的表格末尾
4. 立即为该项生成文档

---

## 文档质量标准

生成的每份文档需满足：
- 新人仅凭此文档能独立完成对应工作
- 操作步骤可直接执行，不含模糊描述
- Bug 记录有完整链路：现象 → 分析 → 根因 → 修复 → 验证
- 不含指向 Cursor 对话的引用（这些将不可访问）
