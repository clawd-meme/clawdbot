#!/usr/bin/env bash
set -euo pipefail

echo "🦞 Clawdbot Installer"
echo "Source: https://github.com/clawd-meme/clawdbot"
echo

command -v git >/dev/null 2>&1 || { echo "git is required" >&2; exit 1; }
command -v node >/dev/null 2>&1 || { echo "node is required" >&2; exit 1; }

# Prefer pnpm via corepack (repo uses pnpm workspace)
if command -v corepack >/dev/null 2>&1; then
  corepack enable >/dev/null 2>&1 || true
fi

TARGET="${HOME}/.clawdbot"
if [ -d "$TARGET/.git" ]; then
  echo "→ Updating existing install at $TARGET"
  git -C "$TARGET" pull --ff-only
else
  echo "→ Cloning into $TARGET"
  rm -rf "$TARGET"
  git clone --depth 1 https://github.com/clawd-meme/clawdbot.git "$TARGET"
fi

cd "$TARGET"

# Use pnpm (via corepack if needed)
if command -v pnpm >/dev/null 2>&1; then
  PNPM="pnpm"
else
  PNPM="corepack pnpm"
fi

$PNPM install
$PNPM ui:build || true
$PNPM build || true

echo
echo "✅ Done. Next: follow the README 'from source' steps inside $TARGET"
