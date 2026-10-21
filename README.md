# DSH 插件配置（desktop profile）

记录这台机器上 DeepSeek Harness **desktop profile** 的插件配置、启用状态，以及每个插件的作用。
本仓库是配置快照 + 说明书，不包含任何 API Key；cordis.patch.yml 含个人模型端点与 persona 文案，默认私有，公开前请自查。

- 最后更新：2026-10-21
- DSH Desktop / Runtime：0.2.1-rc.2
- 系统：Linux（CachyOS，niri / Wayland）
- profile：~/.dsh/profiles/desktop
- 规模：63 个依赖 / 32 个 bundle（2 框架层 + 29 依赖 bundle + 1 app 内置语音 bundle）

## 统计

| 类别 | 数量 | 说明 |
| --- | --- | --- |
| 直接启用的 bundle 依赖 | 29 | 列在 dsh.profile.bundles |
| 随 codegraph bundle 启用的子包 | 4 | 不单独出现在 bundles 列表 |
| 已安装但停用 | 30 | 依赖仍在，bundle 未选中 |
| app 内置官方可选 bundle | 1 | 语音输入，不写入 dependencies |
| 未纳入的私有插件 | 4 | 见 docs/unavailable.md |

## 当前启用的插件

作用列是给未来的自己看的；备注列记录已知限制。完整 63 包清单见 docs/plugins.md。

| 包 | 版本 | 分类 | 作用 | 备注 |
| --- | --- | --- | --- | --- |
| @deepseek-ai/dsh-experimental-agent-team-profile | 0.2.1-rc.2 | Agent | Agent Teams 实验组合：队长/队友协作、任务与消息工具、Web UI。 | 用 0.2.1-rc.2；截图里的 rc.1 与本机运行时 rc.2 不兼容。 |
| @huanlin/dsh-focus-chat | 0.2.1 | 会话视图 | 聚焦会话视图：工具调用折叠成简洁阅读面，只关注最终产出。 |  |
| @huanlin/dsh-plugin-android-use | 0.4.2 | 工具 | 通过 adb 操作安卓手机：截图、UI 树、点击、滑动、输入、按键、开应用。 | 需要本机 adb 与已连接设备。 |
| @huanlin/dsh-plugin-better-glob | 0.2.2 | 工具 | 顶替内置 glob：自动排除 node_modules/dist 等无底洞目录，必须显式 include。 |  |
| @huanlin/dsh-plugin-better-plan | 0.6.2 | 计划 | 替换内置 plan mode：计划写成 Markdown 文件，侧栏计划面板展示，聊天里只留审批卡。 |  |
| @huanlin/dsh-plugin-better-sidebar-plugin-audio | 0.1.0 | 侧栏 | better-sidebar 的音频预览：波形、频谱、Range 流式播放。 | 当前 pending：rc.2 没有 webRuntime 服务，音频预览暂不出现。 |
| @huanlin/dsh-plugin-codegraph | 0.2.2 | 代码理解 | 代码结构智能 bundle：codegraph / codegraph_index 工具，查询符号、调用与依赖关系。 |  |
| @huanlin/dsh-plugin-copilot | 0.3.1 | 模型接入 | GitHub Copilot 引导层：设置页一键授权，自动写入 provider profile 激活路由。 |  |
| @huanlin/dsh-plugin-input-history | 0.4.2 | 输入 | 输入框上/下方向键翻历史，跨会话持久化。 |  |
| @huanlin/dsh-plugin-interpreters | 0.5.3 | 工具 | run_python / run_node 工具，解释器路径可配置。 |  |
| @huanlin/dsh-plugin-komari | 0.1.0 | 工具 | Komari 探针面板工具：列机器、远程执行、上传下载文件。 | 截图 OCR 拼成 komani，已按正确名安装。 |
| @huanlin/dsh-plugin-mcp-manager | 0.5.0 | MCP | MCP 服务器管理面板：增删改配置、浏览工具、提供 mcp_* 管理工具。 |  |
| @huanlin/dsh-plugin-preface-context | 0.4.0 | 提示词 | 每次会话开头注入一段可配置的文本上下文。 | 截图 OCR 拼成 prefaec-context，已按正确名安装。 |
| @huanlin/dsh-plugin-prts-neuron | 0.1.0 | UI | 把运行状态行换成 PRTS 神经元连接动画。 |  |
| @huanlin/dsh-plugin-sidebar-brand-text | 0.7.3 | UI | 替换侧栏左上角品牌名与构建徽标文案。 | 截图 OCR 拼成 sidbar-brand-text，已按正确名安装。 |
| @huanlin/dsh-plugin-sidebar-terminal-tools | 0.2.1 | 工具 | 把官方侧栏终端桥接给模型：6 个 sidebar_terminal_* 工具（含 wait_for）。 |  |
| @huanlin/dsh-plugin-sleep | 0.2.2 | 工具 | 提供 sleep 工具：按毫秒暂停，可取消。 |  |
| @huanlin/dsh-plugin-tools-manager | 0.4.2 | 工具 | 工具管理器：按来源分组列出所有注册工具，可全局禁用单个工具。 |  |
| @huanlin/dsh-plugin-toolsets | 0.1.0 | 工具 | 命名工具集按需加载（get_tools），降低工具 schema 的上下文成本。 |  |
| @huanlin/dsh-plugin-workspace-system | 0.1.1 | 提示词 | 按 workspace 注入一段可编辑的 system 提示词，保存后下一轮生效。 |  |
| @huanlin/dsh-plugin-ya-workspace-sidebar | 0.10.0 | 侧栏 | 两级工作区侧栏：全局最近会话 + Workspace 到 Session + 面包屑。 |  |
| @local/dsh-preset-ptc-custom | link:/home/buxinzi/.dsh/local-plugins/dsh-preset-ptc-custom-original | 预设 | 本地 agent 预设 bundle：ptc-custom、ptc-computer-use 等预设。 | link 到 ~/.dsh/local-plugins/dsh-preset-ptc-custom-original，不在 npm。 |
| dsh-better-sidebar | 0.28.0 | 侧栏 | 多合一侧栏：文件树、编辑器、变更、任务、侧聊，每个会话独立。 |  |
| dsh-context | 0.73.3 | 上下文 | 上下文洞察与管理面板，含 context 命令。 | 此前关闭，本次按截图重新启用。 |
| dsh-ego-browser | 0.8.6 | 浏览器 | ego 浏览器自动化：30+ ego_* 工具，内置 ego 运行时。 |  |
| dsh-free-search | 0.9.11 | 搜索 | 免费网页搜索：27 个引擎（Bing/DDG/SearXNG 等），无需 API key。 | 当前 web 配置仍指向 dsh-zh-web，尚未由它接管。 |
| dsh-neartoken | 0.10.0 | 模型接入 | New API（NearToken）登录并作为模型供应商接入。 |  |
| dsh-whale-widget | 0.4.2 | 侧栏 | 右下角余额小鲸鱼挂件：余额、今日用量、峰谷价、自定义气泡与角色。 |  |
| dshmarket | 1.66.41 | 市场 | 可视化插件市场：浏览、搜索、一键安装社区插件。 |  |
| @huanlin/dsh-plugin-codegraph-service | 0.2.2 | 代码理解 | codegraph 的服务定义：Provider 注册与查询接口。 | 随 codegraph bundle 启用。 |
| @huanlin/dsh-plugin-codegraph-sqlite | 0.2.2 | 代码理解 | codegraph 的只读 SQLite 存储（.codegraph/codegraph.db）。 | 随 codegraph bundle 启用。 |
| @huanlin/dsh-plugin-codegraph-tool | 0.2.2 | 代码理解 | codegraph 的模型工具层：10 个结构查询 + codegraph_index。 | 随 codegraph bundle 启用。 |
| @huanlin/dsh-plugin-codegraph-tree-sitter | 0.2.2 | 代码理解 | 用 web-tree-sitter 建图并写入 schema v4 索引。 | 随 codegraph bundle 启用。 |
| @deepseek-ai/dsh-experimental-voice-input-bundle | 0.2.1-rc.2 | 语音 | 官方实验性语音输入：输入框麦克风 + 本地 SenseVoice 识别（首次下载约 241 MB 模型）。 | app 内置官方可选 bundle，不在 dependencies。 |

## 已安装但停用的插件

这些包仍在 dependencies 里，但对应 bundle 没有选中，所以不会加载（部分 client 模块仍可能被扫描到）。
恢复方式：在 Web 插件页把它们打开，或把包名追加进 dsh.profile.bundles 后重启。

| 包 | 版本 | 分类 | 作用 | 备注 |
| --- | --- | --- | --- | --- |
| @deepseek-ai/dsh-computer-use | 0.2.1-rc.2 | Computer Use | 官方 computer-use provider 注册。 | 已装未启用；需与 cua-driver 成对并由 ptc-computer-use 预设挂载。 |
| @deepseek-ai/dsh-experimental-computer-use-cua-driver-native | 0.2.1-rc.2 | Computer Use | Cua Driver 原生驱动（实验）。 | 已装未启用；配合 computer-use。 |
| @linxin666/dsh-client-ui-git-graph | 0.4.7 | Git | Git 分支选择器 + 提交图。 |  |
| @michengai/dsh-automation | 1.0.2 | 自动化 | 在独立 session 中按计划执行编码任务。 |  |
| @michengai/dsh-code-review | 1.0.1 | 审查 | Codex 风格代码审查，支持独立子 Agent 与中英文报告。 |  |
| @michengai/dsh-skills-manager | 1.2.6 | Skills | 统一加载并安全管理本机 Agent Skills。 |  |
| @morlay/better-session | 0.1.10 | 会话 | 会话编辑闭环：rewind / retry / recall / fork。 | 故意不启用：会把会话存储切成 SQLite，现有 JSONL 会话将不再显示。 |
| @morlay/dsh-client-ui-primitives | 0.0.13 | UI | @morlay 系列共用的 client UI 组件。 |  |
| @morlay/dsh-reference | 0.0.10 | 输入 | 把 @path / skill:name 引用展开为注入内容。 |  |
| @morlay/session-branch | 0.1.9 | 会话 | 会话分支/回退的 provider 抽象与服务。 |  |
| @morlay/session-rdb | 0.1.9 | 会话 | SQLite / PostgreSQL 会话持久化后端。 |  |
| @morlay/ui-conversation-manager | 0.1.10 | 会话 | 全局对话管理面板：搜索、分页、归档、导出、删除、统计。 |  |
| @morlay/ui-conversation-message-actions | 0.1.10 | 会话 | 消息 rewind / retry / recall / fork 的前端交互。 | 当前 pending：等待 sessionBranch，需先启用 better-session。 |
| @nonamelego/dsh-catppuccin | 0.6.3 | 主题 | Catppuccin 四主题 + 玻璃拟态皮肤。 |  |
| @xmanrui/dsh-im | 5.1.0 | 集成 | 微信、飞书、企微、钉钉、QQ、Telegram 等 IM 接入。 |  |
| billion-context | 0.1.202 | 上下文 | 上下文压缩：小窗口跑长会话，省 token。 |  |
| cc-safety-net | 2.6.14 | 安全 | 拦截破坏性命令与敏感文件访问的 CLI hook。 |  |
| deepseek-harness-zh_pro | 0.10.3 | 增强 | 中文增强：界面优化、布局调整、提示词注入。 | 关闭后 web_search 的 dsh-zh-web provider 不存在。 |
| dsh-browser-cdp | 1.2.2 | 浏览器 | 通过 CDP 连接已有 Chrome/Edge，结构化浏览器自动化。 |  |
| dsh-chat-import | 0.26.1 | 迁移 | 从 25+ AI 编码工具导入会话历史为可续聊会话。 |  |
| dsh-codex-subscription | 3.1.1 | 模型接入 | ChatGPT / Codex 订阅登录、额度、重置、图片与 Fast 模式。 |  |
| dsh-cost-meter | 1.9.7 | 费用 | 会话费用统计：170+ 模型价格、Coding Plan 额度。 |  |
| dsh-find-plugins | 0.2.10 | 市场 | 跨 5 个社区目录 + GitHub/npm 搜索插件并按信任度排序。 |  |
| dsh-image-generation | ^0.1.3 | 媒体 | 多供应商生图，对话里用 image_generate。 |  |
| dsh-mnemon | 0.5.32 | 记忆 | 可组合、分层记忆系统，多来源与策略。 |  |
| dsh-motion-ui | ^0.8.5 | 媒体 | 可交互 HTML/SVG 动效与本地 MP4 制作。 |  |
| dsh-oil-ui | github:oil-oil/dsh-oil-ui | UI | Oil UI 的 DSH 原生插件，可自动切换本地 Oil UI Pro。 |  |
| dsh-remotion | 0.6.0 | 媒体 | Remotion 视频技能、模板、Studio 预览与 MP4 导出。 |  |
| dsh-soulmojito | github:LingyeSoul/DSH-SoulMojito#361a4ca8b014c8f7d920d59199111446d85aee44&path:/packages/plugin | 角色扮演 | SillyTavern 兼容角色扮演工作区，支持角色卡/世界书。 |  |
| dsh-univer-office | 0.3.7 | Office | Univer 表格/文档预览与协作。 |  |

## 未纳入的私有插件

| 插件 | 原因 | 现状 |
| --- | --- | --- |
| @huanlin/dsh-plugin-account-signin | 逆向官方实现，不便公开 | 未安装 |
| @huanlin/dsh-plugin-annotations | 尚未写完 | 未安装 |
| @huanlin/dsh-plugin-deepseek-voice-input | 已由官方语音输入 bundle 替代 | 未安装；改用官方 dsh-experimental-voice-input-bundle |
| @huanlin/dsh-plugin-export-session | 企业版专用 | 未安装 |

截图里有 3 个包是 OCR 读错名字，已按正确名字装上：sidbar-brand-text -> sidebar-brand-text、prefaec-context -> preface-context、komani -> komari。详见 docs/unavailable.md。

## 已知问题

- web_search 仍不可用：cordis.patch.yml 里 web.searchProvider 是 dsh-zh-web，但 deepseek-harness-zh_pro 处于停用状态。可启用 zh_pro，或让 dsh-free-search 接管。
- better-sidebar-plugin-audio 停在 pending (waiting for service: webRuntime)，rc.2 没有该服务。
- @morlay/ui-conversation-message-actions 停在 pending (waiting for service: sessionBranch)，需先启用 @morlay/better-session。
- @morlay/better-session 故意不启用：会把会话存储从 JSONL 切到 SQLite，现有会话列表会变空。
- 磁盘只剩约 4.7 GB；语音模型 int8 约 241 MB。
- profile 里仍有 7 条悬空覆盖（codex-subscription、dsh-zh、catppuccin、mnemon 系列），对应插件停用。

细节见 docs/known-issues.md。

## 目录结构

    .
    ├── README.md                 # 本文件：配置快照 + 每个插件的作用
    ├── plugins.json              # 机器可读的插件清单（名称/版本/状态/分类/作用）
    ├── profile/
    │   ├── package.json          # dependencies + dsh.profile.bundles
    │   ├── pnpm-lock.yaml        # 精确版本锁定
    │   ├── pnpm-workspace.yaml   # pnpm 配置（hoisted / allowBuilds）
    │   ├── cordis.patch.yml      # 个人覆盖层（含 persona 与模型端点）
    │   └── README.md             # profile 快照说明
    ├── docs/
    │   ├── plugins.md            # 63 个依赖的完整目录与分组说明
    │   ├── bundles.md            # 32 层 bundle 的顺序与作用
    │   ├── unavailable.md        # 4 个私有插件 + 3 个 OCR 纠正
    │   └── known-issues.md       # 已知问题与修复选项
    └── scripts/
        ├── restore.sh            # 把快照恢复到 ~/.dsh/profiles/desktop
        └── verify.sh             # 校验 lockfile 与清单计数

## 恢复 / 迁移

    # 先完全退出 DeepSeek Harness
    ./scripts/restore.sh                    # 默认恢复到 ~/.dsh/profiles/desktop
    ./scripts/restore.sh /path/to/profile   # 或指定 profile
    # 重新打开 DeepSeek Harness

restore.sh 会先给现有文件打 .bak-时间戳 备份，再用 pnpm install --frozen-lockfile 按 lockfile 还原依赖。
建议用 pnpm 11.x（DSH Desktop 内置 11.28.5）；系统 pnpm 12 可能与 lockfile 代际不一致。

## 备注

- 这个 profile 由 Electron 应用独占管理，dsh plugin --profile desktop 会被拒绝；安装/恢复请直接改 profile 文件 + pnpm。
- dsh.profile.bundles 的顺序会影响 patch 层优先级：dsh-better-sidebar 必须早于依赖它的 better-plan / audio。
- 安装新插件后如果宿主模块没生效，完全退出并重开应用最稳。
