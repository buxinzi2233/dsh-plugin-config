#!/usr/bin/env bash
set -euo pipefail
src="$(cd "$(dirname "$0")/.." && pwd)"
profile="$1"
if [ -z "$profile" ]; then
  profile="$HOME/.dsh/profiles/desktop"
fi

if [ ! -f "$profile/package.json" ]; then
  echo "profile 不存在：$profile" >&2
  exit 1
fi

major="$(pnpm --version 2>/dev/null | cut -d. -f1 || true)"
if [ -z "$major" ]; then
  major=none
fi
if [ "$major" != "11" ]; then
  echo "警告：检测到 pnpm $major，建议用 pnpm 11.x（DSH Desktop 内置 11.28.5）。" >&2
fi

ts="$(date +%Y%m%d%H%M%S)"
for f in package.json pnpm-lock.yaml pnpm-workspace.yaml cordis.patch.yml; do
  if [ -f "$profile/$f" ]; then
    cp -p "$profile/$f" "$profile/$f.bak-$ts"
  fi
done
echo "已备份现有文件（*.bak-$ts）"

cp "$src/profile/package.json" "$src/profile/pnpm-lock.yaml" "$src/profile/pnpm-workspace.yaml" "$src/profile/cordis.patch.yml" "$profile/"

cd "$profile"
pnpm install --frozen-lockfile
echo
echo "恢复完成。请完全退出并重开 DeepSeek Harness。"
