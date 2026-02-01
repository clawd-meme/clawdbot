---
summary: "CLI reference for `clawdbot agents` (list/add/delete/set identity)"
read_when:
  - You want multiple isolated agents (workspaces + routing + auth)
title: "agents"
---

# `clawdbot agents`

Manage isolated agents (workspaces + auth + routing).

Related:

- Multi-agent routing: [Multi-Agent Routing](/concepts/multi-agent)
- Agent workspace: [Agent workspace](/concepts/agent-workspace)

## Examples

```bash
clawdbot agents list
clawdbot agents add work --workspace ~/.clawdbot/workspace-work
clawdbot agents set-identity --workspace ~/.clawdbot/workspace --from-identity
clawdbot agents set-identity --agent main --avatar avatars/clawdbot.png
clawdbot agents delete work
```

## Identity files

Each agent workspace can include an `IDENTITY.md` at the workspace root:

- Example path: `~/.clawdbot/workspace/IDENTITY.md`
- `set-identity --from-identity` reads from the workspace root (or an explicit `--identity-file`)

Avatar paths resolve relative to the workspace root.

## Set identity

`set-identity` writes fields into `agents.list[].identity`:

- `name`
- `theme`
- `emoji`
- `avatar` (workspace-relative path, http(s) URL, or data URI)

Load from `IDENTITY.md`:

```bash
clawdbot agents set-identity --workspace ~/.clawdbot/workspace --from-identity
```

Override fields explicitly:

```bash
clawdbot agents set-identity --agent main --name "Clawdbot" --emoji "🦞" --avatar avatars/clawdbot.png
```

Config sample:

```json5
{
  agents: {
    list: [
      {
        id: "main",
        identity: {
          name: "Clawdbot",
          theme: "space lobster",
          emoji: "🦞",
          avatar: "avatars/clawdbot.png",
        },
      },
    ],
  },
}
```
