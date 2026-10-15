<div align="center">

# 毛泽东 · 整合版 Skill (Mao Integrated Skill)

> *"通过实践而发现真理，又通过实践而证实真理和发展真理。实践、认识、再实践、再认识，这种形式，循环往复以至无穷。"*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Python 3.8+](https://img.shields.io/badge/Python-3.8%2B-blue.svg)](https://python.org)
[![AgentSkills](https://img.shields.io/badge/AgentSkills-Standard-green)](https://agentskills.io)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Compatible-blue)](https://claude.ai/code)

**以《毛泽东选集》方法论为核心的三层 AI Skill：可执行引擎 + 思维操作系统 + 结构化分析工作流，支持挂载毛选 1-7 卷全文语料做原文检索与精确引用。**

</div>

---

## 三层架构

| 层 | 内容 | 适用场景 | 整合自 |
|---|---|---|---|
| **引擎层** | `mao_skill.py` CLI：智能分析（6 方法自动推荐）、四级学习路径、方法比较 | 要程序化输出、学习路径 | [wwwaapplleecu-source/mao-skill](https://github.com/wwwaapplleecu-source/mao-skill) |
| **思维层** | 7 个心智模型 + 10 条决策启发式 + 表达 DNA | 角色扮演式分析（"教员会怎么看"） | [leezythu/maoxuan-skill](https://github.com/leezythu/maoxuan-skill) |
| **工作流层** | 信息决策门、三段式回复结构、8 张方法卡、硬边界 | 不角色扮演的现实问题结构化拆解 | [SamadhiFire/xinqingnian-maoxuan-skill](https://github.com/SamadhiFire/xinqingnian-maoxuan-skill) |

`SKILL.md` 是总入口，内含路由规则：Agent 按用户意图自动选层，也可显式指定。

## 快速开始

### 1. 安装

```bash
git clone https://github.com/<you>/mao-integrated-skill.git ~/.agents/skills/mao
cd mao-integrated-skill
pip install -r requirements.txt
```

兼容 Claude Code / OpenClaw / Hermes Agent 等 Agent Skills 标准宿主（将含 `SKILL.md` 的目录拷入各自 skills 目录即可）。

### 2. （可选）拉取毛选语料库

语料不随仓库分发（体量与版权考虑），用脚本拉取：

```bash
bash scripts/fetch_corpus.sh
```

从 [NpTIme/MaoZeDongAnthology](https://github.com/NpTIme/MaoZeDongAnthology) 拉取官方五卷（第五卷 70 篇）及静火版六、七卷（非官方整理）到 `knowledge/`。没有语料库时所有功能正常，仅缺原文精确引用能力。

### 3. 使用

**命令行（引擎层）——注意整条命令必须是引号内的一个参数：**

```bash
python mao_skill.py "analyze 团队执行力不行，如何改进"
python mao_skill.py "learn"                  # 四级学习路径
python mao_skill.py "compare 矛盾论 实践论"   # 方法比较
python mao_skill.py "help"
```

**Agent 内（三层路由）**：把本目录作为 skill 加载后自动路由——角色扮演式提问走思维层（第一人称、矛盾论切入）；现实问题拆解走工作流层（摆情况 / 抓主要矛盾 / 定中心任务 三段式）；引用原文先 grep `knowledge/` 语料库验证，不编造语录。

## 核心方法速查

**7 个心智模型**：矛盾分析法 / 实践认识循环 / 持久战略 / 农村包围城市 / 统一战线 / 群众路线 / 纸老虎论（战略藐视 + 战术重视）

**10 条决策启发式**：没有调查就没有发言权 / 抓主要矛盾 / 战略上藐视战术上重视 / 团结一切可团结的力量 / 星星之火可以燎原 / 实事求是 / 不打无准备之仗 / 一分为二 / 从群众中来到群众中去 / 自力更生为主争取外援为辅

**分析工作流**：信息决策门（信息足够直接分析；不足时最多问 2 个高杠杆问题）→ 三段式外显结构 → 按需调用 1-2 张方法卡（core-contradiction、investigation、stage-judgment、forces-resources、alliance-boundaries、execution-routes、review-loop、communication-calibration）

## 硬边界

- 不把人简单分成敌我，不生成操控/羞辱/胁迫/报复/煽动冲突的策略
- 不把单次事件直接上升为"主要矛盾"或阶段变化
- 医疗/法律/财务/人身安全等高风险问题先给安全处置，不伪装成结构分析
- 区分 **原文依据 / 现代转译 / 本次推断**，不声称现代结论是原文直接结论
- 角色扮演激活时声明"基于《毛选》公开著作提炼，供参考"，保持学术中立，不进行政治宣传，不讨论敏感历史评价

## 项目结构

```
├── SKILL.md                 # 总入口：三层路由 + 边界 + 引文规范
├── mao_skill.py             # 引擎 CLI（六层认知架构）
├── tools/                   # 引擎核心组件
├── references/
│   ├── thinking-os/         # 思维操作系统（7 模型/10 启发式/表达 DNA）
│   ├── xinqingnian/         # 新青年工作流（方法卡/澄清/风险/场景）
│   └── legacy-commands.md   # 上游 v1.2.0 命令文档
├── knowledge/               # 毛选语料（脚本拉取，不入库）
├── scripts/fetch_corpus.sh  # 语料拉取脚本
└── docs/                    # 上游遗留文档
```

## 已知限制

- 引擎的 `concepts` 概念查询需要上游未随仓库发布的概念库文件，当前返回空属正常，不影响其他功能
- 第六、七卷为"静火版"民间整理，编者按语混在正文中，引用需甄别并注明非官方
- 本 Skill 聚焦方法论与思维框架的提炼与应用，不涉及政治立场评判

## 许可与致谢

MIT。见 [LICENSE](LICENSE) 与 [NOTICE.md](NOTICE.md)（上游归属与语料版权说明）。

- [wwwaapplleecu-source/mao-skill](https://github.com/wwwaapplleecu-source/mao-skill) — 引擎（六层认知架构）
- [leezythu/maoxuan-skill](https://github.com/leezythu/maoxuan-skill) — 思维操作系统
- [SamadhiFire/xinqingnian-maoxuan-skill](https://github.com/SamadhiFire/xinqingnian-maoxuan-skill) — 新青年分析工作流
- [NpTIme/MaoZeDongAnthology](https://github.com/NpTIme/MaoZeDongAnthology) — 毛选数字化语料

---

**智慧传承 · 方法永存 · 实践为先**
