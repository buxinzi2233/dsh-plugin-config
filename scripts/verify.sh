#!/usr/bin/env bash
set -euo pipefail
profile="$1"
if [ -z "$profile" ]; then
  profile="$HOME/.dsh/profiles/desktop"
fi
cd "$profile"
pnpm install --frozen-lockfile --reporter=append
python3 -c "import json;d=json.load(open('package.json'));b=d['dsh']['profile']['bundles'];print('dependencies:',len(d['dependencies']));print('bundles:',len(b));[print(f'{i:2d}. {n}') for i,n in enumerate(b,1)]"
