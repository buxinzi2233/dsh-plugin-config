# profile 快照

这是 ~/.dsh/profiles/desktop 的四个关键文件：

- package.json：依赖与 dsh.profile.bundles 顺序。
- pnpm-lock.yaml：精确版本锁定，restore.sh 依赖它。
- pnpm-workspace.yaml：pnpm 行为（hoisted、allowBuilds、minimumReleaseAgeExclude）。
- cordis.patch.yml：个人覆盖层。含模型端点（无密钥）与 dsh-zh 的 persona 文案；仓库转公开前请检查。

恢复用 ../scripts/restore.sh，不要直接手抄。
