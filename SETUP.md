# Setup: wiring up an agent to run the auditor

This auditor is a folder of instructions and standards, not a program. It runs **inside a
tool-capable AI agent** that can act on your machine. This file is the few-minute setup.

It is model- and vendor-agnostic. The root `AGENTS.md` and `CLAUDE.md` point any compliant
agent at the same pipeline (`CLAUDE.md` -> `CONTEXT.md` -> the stage contracts). Known-good
hosts: **Claude Code, OpenAI Codex, Cursor, Hermes.** Anything with the four capabilities below
will work.

## The four capabilities

| Capability | Used for |
|---|---|
| **Read files** in this folder | Load `identity.md`, `rules.md`, the stage contracts, and `reference/` |
| **Run a shell** | `curl` the page under audit, run `verify-citations.sh` and `check-standards-freshness.sh` |
| **Write files** | Write the two reports into `output/<run>/` |
| **Drive a browser** (Playwright MCP or equivalent) | Stage 03 renders the page: contrast, keyboard, focus, reflow, licence type-size |

The first three are table stakes in any coding agent. The fourth is the one you usually have to
add on purpose — see below. **Without the browser the audit still runs**, declares the gap in
its header, and reaches 20 of 50 WCAG criteria instead of 34. It never passes a check it did
not perform.

## Where it will NOT run

A plain chat window, or a knowledge-only "project"/workspace that only attaches this folder as
reference. Those can read the files but cannot save the page, write reports, or open a browser,
so the run described in the README is impossible there. If that is all you have, save a page
yourself and paste it in for a source-only reasoning pass — but that is not an audit this tool
will stand behind.

---

## 1. Get the folder onto your machine

```
git clone https://github.com/SuperFish101/real-estate-agent-website-auditor.git
cd real-estate-agent-website-auditor
```

## 2. Open it in a tool-capable agent

Pick one:

- **Claude Code** — `cd` into the folder and run `claude`. It reads `CLAUDE.md` automatically.
- **OpenAI Codex** — open the folder as the working directory. It reads `AGENTS.md`.
- **Cursor** — open the folder as the workspace; use the agent/composer with shell + file tools enabled.
- **Hermes** — point a session at the folder; it reads `AGENTS.md`/`CLAUDE.md`.

Confirm shell + file writing work before you audit anything real:

```
./verify-citations.sh
```

Six checks, no dependencies. If it prints the six passes, your agent can read the folder and
run a shell.

## 3. Add the browser tools (recommended)

Stage 03 uses **Playwright MCP** to render the page. Add it once to your agent's MCP config:

```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest"]
    }
  }
}
```

- **Claude Code:** `claude mcp add playwright -- npx @playwright/mcp@latest`, then restart.
- **Cursor / Claude Desktop / Codex:** paste the block above into that client's MCP settings file and restart.

The first run downloads a browser via `npx`; after that it is offline. If you skip this step,
add `no browser` to your audit command so the run declares the gap up front.

## 4. Run an audit

In the agent, with the folder attached:

```
audit samples/live-agent-ca/
```

or point it at a real site and let it save the page for you:

```
Audit this real estate agent's website: https://www.example-realty.com/
```

The reports land in `output/<run>/`. See the README's "Judge protocol" for a six-minute
verification path.

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Agent describes the audit but writes no `output/` files | No file-write tool, or a knowledge-only workspace | Use a coding agent with file access (section 2) |
| Every colour/contrast row says REQUIRES BROWSER | Playwright not wired, or the page was saved without its CSS | Add Playwright (section 3); capture CSS too — see `samples/README.md` |
| `browser_navigate` fails on a `file://` path | Playwright MCP blocks `file:` | Serve the folder over loopback: `python3 -m http.server 8765`, then navigate to `http://127.0.0.1:8765/index.html` (this is what `method/browser-mode.md` already does) |
| `verify-citations.sh: command not found` / permission denied | Not executable, or no shell | `chmod +x verify-citations.sh`; run inside an agent that has a shell |
