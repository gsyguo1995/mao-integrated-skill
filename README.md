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

## 这个 Skill 解决什么问题

把《毛选》中可复用的认识方法与工作方法，蒸馏成 AI 可直接调用的三套互补能力：

| 你的需求 | 用哪层 | 效果 |
|---|---|---|
| "教员会怎么看这个问题" | **思维层** | 第一人称角色扮演：矛盾论切入、称"同志"、善用比喻，输出带毛选式论证节奏 |
| 现实问题要结构化拆解（不要角色扮演） | **工作流层** | 现代语言的三段式分析：摆情况 → 抓主要矛盾 → 定中心任务，附行动路线与止损条件 |
| 要程序化输出/系统学习 | **引擎层** | CLI 智能分析（6 方法自动推荐）、四级渐进学习路径、方法论比较 |
| 引用毛选原文佐证 | **语料库** | 对 1-7 卷全文 grep 检索，精确到篇名+年代引用，不编造语录 |

## 三层架构详解

### 引擎层（来自 [wwwaapplleecu-source/mao-skill](https://github.com/wwwaapplleecu-source/mao-skill)）

六层认知架构的 Python CLI：用户界面层 → 分析决策层（智能推荐，关键词匹配方法）→ 方法执行层 → 知识检索层 → 性能监控层 → 集成接口层。

```bash
# 注意：整条命令必须是引号内的一个参数
python mao_skill.py "analyze 团队执行力不行，如何改进"
# → 智能推荐：实践论方法（置信度 79%），输出四步分析 + 核心原则 + 学习建议

python mao_skill.py "learn"                    # 四级学习路径（入门15min/基础1h/进阶3h/专业10h）
python mao_skill.py "learn 矛盾论"              # 特定主题
python mao_skill.py "compare 矛盾论 实践论"     # 方法比较
python mao_skill.py "analyze 问题 --method=矛盾" # 指定方法
python mao_skill.py "help"
```

六种分析方法：矛盾分析法 / 实践论方法 / 调查研究法 / 战略思维法 / 群众路线法 / 综合分析法（默认智能选择）。

### 思维层（来自 [leezythu/maoxuan-skill](https://github.com/leezythu/maoxuan-skill)）

完整文档见 `references/thinking-os/mao-thinking-os.md`，包含：

**7 个心智模型**（每个含一句话定义 + 框架 + 原文证据 + 现代应用 + 局限）：

| 模型 | 一句话 | 典型现代应用 |
|---|---|---|
| 矛盾分析法 | 找到主要矛盾就找到破局之道 | 十个问题摆面前，先找牵一发动全身的那个 |
| 实践认识循环 | 没有调查就没有发言权 | 别在会议室讨论三个月，先做 MVP 见用户 |
| 持久战略 | 以时间换空间，防御→相持→反攻 | 创业公司别在巨头强项上硬拼 |
| 农村包围城市 | 先在边缘建根据地，再包围中心 | 先在三四线/垂直场景做到第一 |
| 统一战线 | 把朋友搞得多多的，敌人少少的 | 在主要矛盾上一致即可结盟，不求全一致 |
| 群众路线 | 从群众中来，到群众中去 | 最好方案从一线经验提炼，不是 leader 拍脑袋 |
| 纸老虎论 | 战略上藐视，战术上重视 | 看穿巨头本质脆弱，但每场具体战役全力打 |

**10 条决策启发式**：没有调查就没有发言权 / 抓主要矛盾 / 战略上藐视战术上重视 / 团结一切可团结的力量 / 星星之火可以燎原 / 实事求是 / 不打无准备之仗 / 一分为二 / 从群众中来到群众中去 / 自力更生为主争取外援为辅。

**表达 DNA**：标志性开头（"什么是XX？XX就是…"）、辩证收尾（"前途是光明的，道路是曲折的"）、排比反问、军事与生活化比喻、讽刺式幽默——用于角色扮演的文风还原。

### 工作流层（来自 [SamadhiFire/xinqingnian-maoxuan-skill](https://github.com/SamadhiFire/xinqingnian-maoxuan-skill)）

完整文档见 `references/xinqingnian/`（含 methods/clarification/risks/scenarios/routing 五个子目录），核心机制：

**信息决策门**——不机械追问：
- 信息足够 → 直接分析
- 基本足够 → 暂定判断 + 显式写出关键假设
- 严重不足 → 最多问 2 个高杠杆问题（补目标和最近关键事件）
- 用户说"不要追问" → 给有限结论并标注置信度

**三段式外显结构**（功能和顺序固定，措辞随语境变化）：
1. `先把情况摆清`：事实、目标、已知与未知
2. `再看什么牵住全局`：现象与结构、主次矛盾、阶段判断、控制点
3. `眼下先做什么`：中心任务、先后手、实践检验与止损条件

**8 张方法卡**（`references/xinqingnian/methods/`，每次按需调用 1-2 张）：
`core-contradiction`（核心矛盾）、`investigation`（调查研究）、`stage-judgment`（阶段判断）、`forces-resources`（力量与资源）、`alliance-boundaries`（联盟与边界）、`execution-routes`（执行路线）、`review-loop`（复盘循环）、`communication-calibration`（沟通校准）。

**六辨识度动作**：摆情况不抢定性 / 分层次辨现象结构 / 抓主要矛盾并交代为什么 / 看阶段与力量条件 / 定中心任务排先后手 / 交给实践检验。正式分析至少体现 3 步，简短回答至少 1-2 步。

## 硬边界（强制）

- 不把人简单分成敌我/先进落后；不生成操控、羞辱、胁迫、报复、煽动冲突的策略
- 不把单次事件直接上升为"主要矛盾"或阶段变化
- 不为显示方法感强行使用战争、斗争、整顿等高压词汇
- 医疗/法律/财务/人身安全等高风险问题先给安全处置，不伪装成结构分析
- 区分 **原文依据 / 现代转译 / 本次推断**，不声称现代结论是原文直接结论
- 角色扮演首次激活时声明"基于《毛选》公开著作提炼，供参考"；保持学术中立，不进行政治宣传，不讨论敏感历史评价
- **触发控制**：仅当用户明确要求毛选/教员/毛泽东视角时触发；问题复杂或提到"矛盾"二字本身不构成触发条件

## 语料库

1-7 卷全文（官方五卷 + 静火版六/七卷），共 233 篇、约 3.4MB Markdown：

```bash
bash scripts/fetch_corpus.sh    # 克隆后执行一次即可
```

| 卷 | 性质 | 篇数 | 时期 |
|---|---|---|---|
| 一至四卷 | 官方 | — | 1921–1949 |
| 第五卷 | 官方 | 70 | 1949–1957 |
| 第六卷 | 静火版（非官方） | 77 | 1958–1965 |
| 第七卷 | 静火版（非官方） | 86 | 文革时期 |

- 引用原文前先 grep 验证存在，标注篇名+年代；六/七卷注明"静火版，非官方"，注意编者按语混在正文中
- 不拉语料库时所有分析功能正常，仅缺原文精确引用
- 语料不随仓库分发（体量与版权考虑），见 [NOTICE.md](NOTICE.md)

## 快速开始

### 1. 安装

```bash
git clone https://github.com/gsyguo1995/mao-integrated-skill.git ~/.agents/skills/mao
cd ~/.agents/skills/mao
pip install -r requirements.txt
```

兼容 Claude Code / OpenClaw / Hermes Agent 等 Agent Skills 标准宿主（将含 `SKILL.md` 的目录拷入各自 skills 目录即可）。

### 2. （可选）拉取语料库

```bash
bash scripts/fetch_corpus.sh
```

### 3. 使用示例

**Agent 内（自动路由）**：

```
"用教员的方式分析：团队执行力不行"     → 思维层（角色扮演）
"帮我拆解这个产品卖不动的问题"        → 工作流层（三段式结构化分析）
"毛选里关于主要矛盾是怎么说的"        → 语料库检索 + 原文引用
```

**命令行（引擎层）**：

```bash
python mao_skill.py "analyze 市场竞争太激烈，产品卖不动"
# 🎯 智能推荐: 矛盾 (置信度: 78%)
# 1. 识别矛盾：找出问题中的各种矛盾
# 2. 区分主次：确定主要矛盾和次要矛盾
# 3. 分析关系：分析矛盾双方的对立统一关系
# 4. 制定对策：针对主要矛盾制定解决方案
# 核心原则: 事物发展的根本原因，不是在事物的外部而是在事物的内部，在于事物内部的矛盾性。
```

## 项目结构

```
├── SKILL.md                 # 总入口：三层路由 + 边界 + 引文规范
├── mao_skill.py             # 引擎 CLI（六层认知架构）
├── tools/                   # 引擎核心组件
│   ├── smart_recommender.py     # 智能方法推荐
│   ├── command_parser.py        # 命令解析
│   ├── six_layer_integration.py # 六层集成
│   └── ...
├── references/
│   ├── thinking-os/         # 思维操作系统（7 模型/10 启发式/表达 DNA/时间线/智识谱系）
│   ├── xinqingnian/         # 新青年工作流（方法卡/澄清/风险/场景/路由）
│   └── legacy-commands.md   # 上游 v1.2.0 命令文档
├── scripts/fetch_corpus.sh  # 语料拉取脚本
├── knowledge/               # 毛选语料（脚本拉取，不入库）
└── docs/                    # 上游遗留文档
```

## 已知限制

- 引擎的 `concepts` 概念查询需要上游未随仓库发布的概念库文件，当前返回空属正常，不影响其他功能
- 第六、七卷为"静火版"民间整理，编者按语混在正文中，引用需甄别并注明非官方
- 本 Skill 聚焦方法论与思维框架的提炼与应用，不涉及政治立场评判，不构成专业（医疗/法律/投资）建议

## 许可与致谢

MIT。见 [LICENSE](LICENSE) 与 [NOTICE.md](NOTICE.md)（上游归属与语料版权说明）。

- [wwwaapplleecu-source/mao-skill](https://github.com/wwwaapplleecu-source/mao-skill) — 引擎（六层认知架构）
- [leezythu/maoxuan-skill](https://github.com/leezythu/maoxuan-skill) — 思维操作系统
- [SamadhiFire/xinqingnian-maoxuan-skill](https://github.com/SamadhiFire/xinqingnian-maoxuan-skill) — 新青年分析工作流
- [NpTIme/MaoZeDongAnthology](https://github.com/NpTIme/MaoZeDongAnthology) — 毛选数字化语料

欢迎 PR：修引擎 bug、补充方法卡、完善语料索引格式均可。

---

**智慧传承 · 方法永存 · 实践为先**
