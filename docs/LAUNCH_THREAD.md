# IronBridge Launch Thread — X / Twitter

> **Instructions:** Post tweet 1, then reply to it with tweet 2, reply to tweet 2 with tweet 3, etc. Each tweet is ≤280 characters unless noted. Suggested images/media are marked with 🖼️.

---

### 🧵 1/12 — Hook

Your AI chat history is a ticking time bomb.

VS Code update? Gone.
Renamed a folder? Gone.
Cursor crash? Gone.

We analyzed 100+ forum threads. Session loss is the #1 pain point across every AI coding assistant.

So we built IronBridge. 🔗

🖼️ *Attach: banner.png*

---

### 2/12 — What is IronBridge

IronBridge is an open-source CLI that harvests, recovers, and unifies your AI chat sessions across every provider.

Copilot · Cursor · Windsurf · Claude · ChatGPT · Ollama · 20+ more.

One command. All your history. Never lost again.

`cargo install ironbridge-cli`

🖼️ *Attach: demo.svg (or screen recording GIF)*

---

### 3/12 — Recovery (38% demand)

The #1 use case: recover lost sessions.

```
ironbridge fetch path /path/to/project
```

That's it. Sessions reappear in VS Code's Chat dropdown.

Renamed your project folder? IronBridge finds orphaned sessions too:

```
ironbridge detect orphaned --recover /path/to/project
```

50+ Cursor forum threads asked for exactly this. Zero tools solved it—until now.

---

### 4/12 — Harvest & Export (27% demand)

Every AI tool stores history differently. Copilot uses SQLite + JSONL. Cursor uses a proprietary format. Claude is web-only.

IronBridge harvests them all into one searchable database:

```
ironbridge harvest scan
ironbridge harvest run
ironbridge harvest search "auth implementation"
```

Export to JSON, Markdown, CSV, or JSONL. Your conversations, your data.

---

### 5/12 — Run & Record

Chat with any AI provider from your terminal. Every message is auto-saved. No more lost sessions from editor crashes.

```
ironbridge run ollama -m codellama
ironbridge run claude
ironbridge run chatgpt -m gpt-4o
ironbridge run claudecode --workspace ./project
```

Real-time recording via REST + WebSocket ensures nothing is lost—even mid-stream.

---

### 6/12 — No vendor lock-in

Switch from Copilot to Cursor? Cursor to Claude? Local Ollama to cloud GPT-4o?

Your entire conversation history comes with you.

IronBridge normalizes every provider into a universal session format. Import, export, search, and continue—regardless of source.

No more starting from zero when you switch tools.

---

### 7/12 — Agentic coding

Like Claude Code, but provider-agnostic.

```
ironbridge agency run "Add error handling to main.rs"
ironbridge agency run -m ollama/codellama "Write tests for lib.rs"
ironbridge agency run --orchestration swarm "Build a REST API"
```

Single agent. Multi-agent swarm. Parallel execution. Hierarchical delegation. Debate mode.

Use any model. Keep all history.

---

### 8/12 — Merge & consolidate

Long-running projects scatter sessions across workspaces, branches, and providers.

```
ironbridge merge path /path/to/project
ironbridge merge all
```

Consolidate dozens of fragmented sessions into a coherent timeline. Essential for team handoffs and context loading.

---

### 9/12 — By the numbers

Our market analysis (public in the repo):

📊 50+ Cursor forum threads on "lost chat history"
📊 50+ threads on "export chat"
📊 72 closed GitHub issues on chat history in Cursor alone
📊 chatgpt-exporter: 2.2K ★, 92 releases over 4 years
📊 0 tools that do recovery + export + search + run-and-record

IronBridge is the first.

---

### 10/12 — Built with Rust 🦀

Fast. Single binary. No runtime dependencies.

- Cross-platform: Windows, macOS, Linux
- SQLite-based universal database
- REST + WebSocket API server
- Argon2id auth, parameterized SQL, no dev fallbacks
- Apache 2.0 licensed

MSRV: Rust 1.85

---

### 11/12 — Ecosystem

IronBridge isn't just a CLI:

🖥️ Desktop app (Tauri 2)
🌐 Web dashboard (Vite + React)
📱 Mobile app (React Native)
🔌 VS Code extension
🔌 JetBrains plugin
🔌 Neovim / Vim plugins
🌍 Browser extension (Chrome + Firefox)

All open source. All in one monorepo.

---

### 12/12 — Get started

```
cargo install ironbridge-cli
ironbridge harvest scan
ironbridge fetch path /path/to/your/project
```

⭐ Star us: github.com/nervosys/ironbridge-cli
📖 Docs: docs.rs/ironbridge-cli
💬 Discussions: github.com/nervosys/ironbridge-cli/discussions

Built by @nervosys

Your AI history deserves better than a locked SQLite file buried in AppData.

---

## Alt-text for accessibility

- **Banner image:** "IronBridge — Chat Session Manager. Bridging the divide between AI providers. Terminal CLI interface showing session recovery and harvest commands."
- **Demo SVG:** "Animated terminal recording showing ironbridge fetch path recovering lost sessions, ironbridge run ollama launching a chat, and ironbridge harvest search finding results across providers."

## Hashtags (rotate across tweets)

```
#OpenSource #RustLang #AI #DevTools #CLI #ChatGPT #Copilot #Cursor #LLM #AICoding #DeveloperExperience
```

## Posting schedule suggestion

| Tweet | Timing                         | Notes                |
| ----- | ------------------------------ | -------------------- |
| 1/12  | Launch time (e.g., Tue 9am PT) | Hook with pain point |
| 2–8   | Every 3–5 min                  | Keep thread tight    |
| 9–11  | Every 5 min                    | Data + ecosystem     |
| 12/12 | Final, pin the thread          | CTA                  |

## Cross-posting

- **LinkedIn:** Condense to 3–4 paragraphs + banner image
- **Reddit:** r/rust, r/programming, r/vscode, r/ChatGPT — use a single post, not a thread
- **Hacker News:** "Show HN: IronBridge — recover, harvest, and unify AI chat sessions (Rust CLI)"
- **Dev.to / Hashnode:** Expand into a blog post with the ANALYSIS.md data
