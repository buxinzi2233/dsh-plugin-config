# 已知问题

## 1. web_search 不可用

- 现象：调用 web_search 报 configured web provider "dsh-zh-web" is not registered。
- 原因：profile/cordis.patch.yml 里 id: web 配置了 searchProvider: dsh-zh-web，但提供该 provider 的 deepseek-harness-zh_pro 处于停用状态。
- 修复（二选一）：
  1. 启用 deepseek-harness-zh_pro bundle；或
  2. 把 web.searchProvider 改成 deepseek-official，让已启用的 dsh-free-search 接管（插件只在出厂默认值上接管）。

## 2. better-sidebar-plugin-audio 未激活

- 启动日志：pending (waiting for service: webRuntime)。
- 原因：该插件 inject 了 webRuntime，当前 DSH 0.2.1-rc.2 没有这个服务。
- 影响：音频预览不出现，其余侧栏功能不受影响。

## 3. @morlay 消息操作 pending

- 启动日志：mkt-client--morlay-ui-conversation-message-actions ... pending (waiting for service: sessionBranch)。
- 原因：sessionBranch 由 @morlay/better-session bundle 提供，而该 bundle 故意未启用。

## 4. @morlay/better-session 故意停用

- 它的 patch 会禁用 session-persistence-jsonl / session-query-sqlite / session-projection-cache / storage-json，把会话存储切到 ~/.dsh/sessions/sessions.sqlite。
- 现有 JSONL 会话不会迁移，切换后列表会变空（文件仍在磁盘）。
- 启用前先备份 ~/.dsh/sessions；把 @morlay/better-session 追加到 dsh.profile.bundles 再重启。

## 5. 悬空覆盖

cordis.patch.yml 里有 7 条覆盖指向未启用的行：codex-subscription、dsh-zh、dsh-catppuccin、mnemon、mnemon-strategy-auto-capture、mnemon-strategy-scoped、mnemon-strategy-light-context。启动时会打印 entry ... not found，无功能影响。

## 6. 磁盘

根分区约 4.7 GB 可用（99% 已用）。node_modules 约 1.1 GB；语音模型 int8 约 241 MB（fp32 另需 938 MB，不建议）。

## 7. 安装方式

desktop profile 由 Electron 独占管理：

- dsh plugin --profile desktop ... 会被拒绝；
- 用 profile 自带的 pnpm 11.28.5（resources/runtime/primary-runtime/dependencies/pnpm/bin/pnpm.cjs）在 profile 目录执行 pnpm add；
- 新增包需要同时登记到 dsh.profile.bundles（如果它声明了 dsh.bundle）；
- 新宿主模块通常需要完全退出并重开应用才会加载。
