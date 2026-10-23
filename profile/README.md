# profile 快照

这是 ~/.dsh/profiles/desktop 的四个关键文件：

- package.json：依赖与 dsh.profile.bundles 顺序。
- pnpm-lock.yaml：精确版本锁定，restore.sh 依赖它。
- pnpm-workspace.yaml：pnpm 行为（hoisted、allowBuilds、minimumReleaseAgeExclude）。
- cordis.patch.yml：个人覆盖层，含模型端点（只有环境变量名，无密钥）、UI 偏好与插件参数。

恢复用 ../scripts/restore.sh，不要直接手抄。
换机器时把 llm-pi-ai 的 baseURL / 模型 id / apiKeyEnv 换成自己的；密钥请放 ~/.dsh/.credentials.yaml 或环境变量，不要提交。
