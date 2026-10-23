# 已知问题

## 1. 会话存储已切到 SQLite

- 现象：~/.dsh/sessions 下出现 sessions.sqlite（含 -wal/-shm），旧 JSONL 会话不再出现在会话列表。
- 原因：@morlay/better-session 已启用，它的 patch 禁用 session-persistence-jsonl / session-query-sqlite / session-projection-cache / storage-json，把持久化交给 @morlay/session-rdb。
- 数据没有丢：旧 JSONL 文件仍在 ~/.dsh/sessions 下（另有 sessions.bak-* 备份目录）。
- 回退：从 dsh.profile.bundles 移除 @morlay/better-session 并重启；会话列表回到 JSONL 那一套，SQLite 文件保留。

## 2. better-sidebar-plugin-audio 可能 pending

- 启动日志若出现 pending (waiting for service: webRuntime)，说明该服务在 0.2.1-rc.2 仍不存在。
- 影响：音频预览不出现，其余侧栏功能不受影响。

## 3. web_search 的 provider（已解决，留档）

- 旧配置 searchProvider 指向 dsh-zh-web，而提供它的 deepseek-harness-zh_pro 已卸载，会报 configured web provider not registered。
- 现在 patch 里 web.searchProvider=ddg、fetchProvider=fs-quality-fetch，由 dsh-free-search 接管；zh_pro 已从依赖中移除。

## 4. 个人模型端点

- profile/cordis.patch.yml 里 llm-pi-ai 配了三个供应商：cline（api.cline.bot）、commandcode（api.commandcode.ai）、jiangfan（第三方中转 sub.mathhomework.top）。
- 只写 apiKeyEnv 环境变量名，真正的 key 在 ~/.dsh/.credentials.yaml；本仓库不含密钥。换机器时端点与模型列表都要自己改。

## 5. 版本浮动的依赖

- dsh-image-generation 声明 ^0.1.3，dsh-oil-ui 与 dsh-soulmojito 走 github: 源（后者带 commit sha）。
- lockfile 固定了当前版本，但 restore 后手工 pnpm update 可能拉到新提交；追求完全复现时保留 pnpm-lock.yaml 不动。

## 6. 磁盘

- 根分区约 42 GB 可用（92% 已用）。profile 的 node_modules 约 1.0 GB。
- 语音输入模型：int8 约 241 MB，fp32 另需 938 MB，不建议。

## 7. 安装方式

desktop profile 由 Electron 独占管理：

- dsh plugin --profile desktop ... 会被拒绝；
- 用 profile 自带的 pnpm 11.28.5（resources/runtime/primary-runtime/dependencies/pnpm/bin/pnpm.cjs）在 profile 目录执行 pnpm add；
- 新增包需要同时登记到 dsh.profile.bundles（如果它声明了 dsh.bundle）；
- 新宿主模块通常需要完全退出并重开应用才会加载。
