# bundle 栈（50 层，按加载顺序）

dsh.profile.bundles 是有序数组：越靠后的层优先级越高，但行级覆盖仍以 id 匹配、后写胜出。

| # | bundle | 作用 |
| --- | --- | --- |
| 1 | @deepseek-ai/dsh-base | 核心层：会话、LLM、工具、沙箱、存储、权限。 |
| 2 | @deepseek-ai/dsh-web-app | Web 界面层：浏览器外壳、侧栏、设置、插件页。 |
| 3 | dshmarket | 插件市场。 |
| 4 | dsh-better-sidebar | 多功能侧栏（需早于依赖它的 better-plan / audio）。 |
| 5 | @huanlin/dsh-plugin-better-sidebar-plugin-audio | 侧栏音频预览（webRuntime 缺失时 pending）。 |
| 6 | @huanlin/dsh-plugin-better-plan | 计划面板与审批卡。 |
| 7 | dsh-context | 上下文面板与 context 命令。 |
| 8 | dsh-whale-widget | 余额小鲸鱼挂件。 |
| 9 | @huanlin/dsh-focus-chat | 聚焦会话视图。 |
| 10 | @huanlin/dsh-plugin-android-use | adb 安卓操作工具。 |
| 11 | @huanlin/dsh-plugin-better-glob | 替代内置 glob。 |
| 12 | @huanlin/dsh-plugin-codegraph | 代码图 bundle（挂载 service/sqlite/tool/tree-sitter 四个子包）。 |
| 13 | @huanlin/dsh-plugin-copilot | GitHub Copilot 授权引导。 |
| 14 | @huanlin/dsh-plugin-input-history | 输入历史。 |
| 15 | @huanlin/dsh-plugin-interpreters | run_python / run_node。 |
| 16 | @huanlin/dsh-plugin-mcp-manager | MCP 管理面板。 |
| 17 | @huanlin/dsh-plugin-prts-neuron | PRTS 状态行。 |
| 18 | @huanlin/dsh-plugin-sidebar-terminal-tools | 侧栏终端工具。 |
| 19 | @huanlin/dsh-plugin-sleep | sleep 工具。 |
| 20 | @huanlin/dsh-plugin-tools-manager | 工具管理器。 |
| 21 | @huanlin/dsh-plugin-toolsets | 工具集按需加载。 |
| 22 | @huanlin/dsh-plugin-workspace-system | workspace 级 system 提示词。 |
| 23 | @huanlin/dsh-plugin-ya-workspace-sidebar | 两级工作区侧栏。 |
| 24 | dsh-ego-browser | ego 浏览器自动化。 |
| 25 | dsh-free-search | 免费搜索 provider（当前 web.searchProvider=ddg 由它接管）。 |
| 26 | dsh-neartoken | NearToken / New API 供应商。 |
| 27 | @local/dsh-preset-ptc-custom | 本地预设 bundle（ptc-custom / ptc-computer-use）。 |
| 28 | @deepseek-ai/dsh-experimental-agent-team-profile | Agent Teams 实验组合。 |
| 29 | @huanlin/dsh-plugin-sidebar-brand-text | 侧栏品牌文案。 |
| 30 | @huanlin/dsh-plugin-preface-context | 会话开头上下文注入。 |
| 31 | @huanlin/dsh-plugin-komari | Komari 面板工具。 |
| 32 | @deepseek-ai/dsh-experimental-voice-input-bundle | 官方语音输入（app 内置）。 |
| 33 | @deepseek-ai/dsh-experimental-auto-review | 工具调用前的模型授权审查（app 内置）。 |
| 34 | @morlay/better-session | 会话编辑闭环 + SQLite 持久化 backend。 |
| 35 | cc-safety-net | 拦截破坏性命令与敏感文件访问。 |
| 36 | dsh-remotion | Remotion 视频技能、模板与 MP4 导出。 |
| 37 | dsh-oil-ui | Oil UI 设计技能与本地 Pro 切换。 |
| 38 | dsh-image-generation | 多供应商生图（image_generate）。 |
| 39 | dsh-find-plugins | 跨目录搜索社区插件。 |
| 40 | dsh-codex-subscription | ChatGPT / Codex 订阅接入、额度与生图。 |
| 41 | @michengai/dsh-skills-manager | Skills 统一加载与安全管理。 |
| 42 | dsh-soulmojito | SillyTavern 兼容角色扮演工作区。 |
| 43 | dsh-motion-ui | 可交互 UI / 动效与本地 MP4 制作。 |
| 44 | dsh-mnemon | 分层记忆与 Documents。 |
| 45 | dsh-cost-meter | 会话费用与 Coding Plan 额度统计。 |
| 46 | @michengai/dsh-code-review | Codex 风格代码审查与子 Agent 报告。 |
| 47 | dsh-chat-import | 从 25+ 工具导入会话历史。 |
| 48 | @nonamelego/dsh-catppuccin | Catppuccin 主题与玻璃皮肤。 |
| 49 | @linxin666/dsh-client-ui-git-graph | Git 分支选择器 + 提交图。 |
| 50 | dsh-univer-office | Univer 表格/文档/幻灯片预览与协作。 |

## 关键约束

- dsh-better-sidebar 必须在 better-plan / better-sidebar-plugin-audio 之前。
- @local/dsh-preset-ptc-custom 与 agent-team-profile 会注册 agent 预设；默认预设由 agent-preset-registry 的配置决定（当前 selectedDefault: ptc-custom）。
- @deepseek-ai/dsh-experimental-voice-input-bundle 与 dsh-experimental-auto-review 不在 dependencies 里，由 DSH 安装目录提供。
- @morlay/better-session 位于末段：它会插入 session-rdb 相关行并切走 JSONL 持久化，改顺序前先读 docs/known-issues.md。
- @linxin666/dsh-client-ui-git-graph 与 dsh-univer-office 是 client 模块，patch 里各有一条 disabled: false 的显式行，防止 dshmarket 的 hot shim 覆盖。
- 停用某个 bundle 只需从数组里移除；依赖包可以保留。
