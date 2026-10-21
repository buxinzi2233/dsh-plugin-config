# bundle 栈（32 层，按加载顺序）

dsh.profile.bundles 是有序数组：越靠后的层优先级越高，但行级覆盖仍以 id 匹配、后写胜出。

| # | bundle | 作用 |
| --- | --- | --- |
| 1 | @deepseek-ai/dsh-base | 核心层：会话、LLM、工具、沙箱、存储、权限。 |
| 2 | @deepseek-ai/dsh-web-app | Web 界面层：浏览器外壳、侧栏、设置、插件页。 |
| 3 | dshmarket | 插件市场。 |
| 4 | dsh-better-sidebar | 多功能侧栏（需早于依赖它的 better-plan / audio）。 |
| 5 | @huanlin/dsh-plugin-better-sidebar-plugin-audio | 侧栏音频预览（当前 pending）。 |
| 6 | @huanlin/dsh-plugin-better-plan | 计划面板与审批卡。 |
| 7 | dsh-context | 上下文面板与命令。 |
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
| 25 | dsh-free-search | 免费搜索 provider（当前未被 web 配置选中）。 |
| 26 | dsh-neartoken | NearToken / New API 供应商。 |
| 27 | @local/dsh-preset-ptc-custom | 本地预设 bundle（ptc-custom / ptc-computer-use）。 |
| 28 | @deepseek-ai/dsh-experimental-agent-team-profile | Agent Teams 实验组合。 |
| 29 | @huanlin/dsh-plugin-sidebar-brand-text | 侧栏品牌文案。 |
| 30 | @huanlin/dsh-plugin-preface-context | 会话开头上下文注入。 |
| 31 | @huanlin/dsh-plugin-komari | Komari 面板工具。 |
| 32 | @deepseek-ai/dsh-experimental-voice-input-bundle | 官方语音输入（app 内置）。 |

## 关键约束

- dsh-better-sidebar 必须在 better-plan / better-sidebar-plugin-audio 之前。
- @local/dsh-preset-ptc-custom 与 agent-team-profile 会注册 agent 预设；默认预设仍由 agent-preset-registry 的配置决定（当前 standard）。
- @deepseek-ai/dsh-experimental-voice-input-bundle 不在 dependencies 里，由 DSH 安装目录提供。
- 停用某个 bundle 只需从数组里移除；依赖包可以保留。
