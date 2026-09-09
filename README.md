<p align="center">
  <img src="https://raw.githubusercontent.com/nervosys/IronBridgeCLI/master/assets/banner.png" alt="IronBridge" width="100%">
</p>

<p align="center">
  <strong>Chat Session Manager (IronBridge): Bridging the divide between AI providers</strong><br>
  <em>Harvest, harmonize, and recover your AI chat and agent task histories</em>
</p>

<p align="center">
  <a href="https://crates.io/crates/ironbridge-cli"><img src="https://img.shields.io/crates/v/ironbridge-cli.svg?style=flat-square&logo=rust&logoColor=white&color=orange" alt="Crates.io"></a>
  <a href="https://docs.rs/ironbridge-cli"><img src="https://img.shields.io/docsrs/ironbridge-cli?style=flat-square&logo=docs.rs&logoColor=white" alt="Documentation"></a>
  <a href="https://github.com/nervosys/IronBridgeCLI/actions"><img src="https://img.shields.io/github/actions/workflow/status/nervosys/IronBridgeCLI/ci.yml?style=flat-square&logo=github&logoColor=white&label=CI" alt="CI Status"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-AGPL--3.0-blue.svg?style=flat-square" alt="License"></a>
  <a href="https://github.com/nervosys/IronBridgeCLI/releases"><img src="https://img.shields.io/github/v/release/nervosys/IronBridgeCLI?style=flat-square&logo=github&logoColor=white&label=release" alt="Release"></a>
</p>

<p align="center">
  <a href="#-recover-lost-chat-sessions">Recover Sessions</a> •
  <a href="#-harvest--search-all-history">Harvest & Export</a> •
  <a href="#-chat-with-any-ai-provider">Run & Record</a> •
  <a href="#-no-vendor-lock-in">Cross-Provider</a> •
  <a href="#-agentic-coding">Agency</a> •
  <a href="#-merge--consolidate-long-histories">Merge</a> •
  <a href="#-installation">Install</a>
</p>

<br>

<p align="center">
  <img src="https://raw.githubusercontent.com/nervosys/IronBridgeCLI/master/assets/getting-started.gif" alt="IronBridge Demo" width="800">
</p>

<br>

---

**IronBridge** bridges the divide between AI providers by extracting and unifying chat sessions from AI coding assistants like GitHub Copilot, Cursor, and more. Never lose your AI conversations again.

## ✨ Features

- 🔄 **Recover** - Restore lost or orphaned chat sessions to VS Code
- 🔍 **Harvest** - Extract chat sessions from VS Code, Cursor, Windsurf, and other editors
- 🚀 **Run & Record** - Chat with Ollama, Claude, ChatGPT, Claude Code, or OpenCode — every message auto-saved
- 🔀 **No Lock-in** - Universal session format that works across all providers
- 🤖 **Agentic Coding** - Run coding tasks with any LLM backend (like Claude Code, but provider-agnostic)
- 🔗 **Merge** - Combine sessions across workspaces and time periods
- 📡 **Real-time Recording** - Live session recording to prevent data loss from editor crashes
- 🔌 **API Server** - REST + WebSocket API for building custom integrations
- 🗃️ **Universal Database** - SQLite-based storage that normalizes all providers

---

## 🔄 Recover Lost Chat Sessions

The #1 use case — recover chat sessions that disappeared from VS Code after an update, crash, or workspace change:

```bash
# Recover sessions for a specific project
ironbridge fetch path /path/to/your/project

# Example output:
# [<] Fetching Chat History for: my-project
# ======================================================================
# Found 3 historical workspace(s)
#
#    [OK] Fetched: Implementing authentication system... (abc12345-...)
#    [OK] Fetched: Debugging API endpoints... (def67890-...)
#
# ======================================================================
# Fetched: 2 sessions
#
# [i] Reload VS Code (Ctrl+R) and check Chat history dropdown
```

After running, **reload VS Code** (`Ctrl+R` or `Cmd+R`) and your sessions will appear in the Chat history dropdown.

### Find orphaned sessions

```bash
# Scan for orphaned workspaces with recoverable sessions
ironbridge detect orphaned /path/to/your/project

# Automatically recover them
ironbridge detect orphaned --recover /path/to/your/project

# Register recovered sessions so VS Code sees them
ironbridge register all --force --path /path/to/your/project
```

### Investigate a workspace

```bash
# See everything ironbridge knows about a workspace
ironbridge detect all /path/to/your/project --verbose

# Output shows:
# - Workspace ID and status
# - Available sessions
# - Detected providers
# - Recommendations
```

---

## 📊 Harvest & Search All History

Bulk-collect sessions from every provider on your machine into a single searchable database:

```bash
# Scan for all available providers and sessions
ironbridge harvest scan

# Harvest everything into a unified database
ironbridge harvest run

# Harvest only from specific providers
ironbridge harvest run --providers copilot

# Full-text search across ALL your AI conversations
ironbridge harvest search "authentication"
ironbridge harvest search "react component"

# Check database status
ironbridge harvest status
```

### Browse and explore

```bash
# List all discovered workspaces
ironbridge list workspaces

# List sessions for a specific project
ironbridge list sessions --project-path /path/to/your/project

# Search by project name or content
ironbridge find session "my-project"

# View full session content
ironbridge show session <session-id>
```

### Export and backup

```bash
# Export sessions from a project
ironbridge export path /backup/dir /path/to/your/project

# Batch export from multiple projects
ironbridge export batch /backup/dir /project1 /project2 /project3

# Sync between database and provider workspaces
ironbridge sync --pull     # provider → database
ironbridge sync --push     # database → provider
ironbridge sync --pull --push  # bidirectional
```

---

## 🚀 Chat with Any AI Provider

Launch any AI provider directly from the terminal — every message is automatically recorded to IronBridge's database. No data loss, no manual exports, full history retention.

```bash
# Chat with a local Ollama model
ironbridge run ollama
ironbridge run ollama -m codellama
ironbridge run ollama -m mistral --endpoint http://remote-server:11434

# Chat with Claude (Anthropic API)
ironbridge run claude
ironbridge run claude -m claude-3-haiku

# Chat with ChatGPT (OpenAI API)
ironbridge run chatgpt
ironbridge run chatgpt -m gpt-4o-mini

# Launch Claude Code CLI with recording
ironbridge run claudecode --workspace /path/to/project

# Launch OpenCode CLI with recording
ironbridge run opencode --workspace /path/to/project

# Interactive TUI browser
ironbridge run tui
```

All sessions are automatically persisted to the database. Search them later:

```bash
ironbridge harvest search "the bug we fixed yesterday"
ironbridge list sessions
```

---

## 🔀 No Vendor Lock-in

Your AI chat history is scattered across VS Code Copilot (SQLite + JSON), Cursor (proprietary format), ChatGPT (web-only), Claude (web-only), and local LLMs (various formats). Each uses different formats, storage locations, and APIs. If you switch providers, you lose context.

IronBridge normalizes all sessions into a **universal format** so you can:

1. **Import from any provider** into a unified database
2. **Export to any format** (JSON, Markdown, CSV)
3. **Continue sessions** with a different provider
4. **Search across all history** regardless of source

### Cross-provider workflow

```bash
# 1. Start a project with GitHub Copilot in VS Code
#    (sessions automatically tracked)

# 2. Later, recover and view your sessions
ironbridge fetch path /path/to/project
ironbridge list sessions --project-path /path/to/project

# 3. Export for portability
ironbridge export path ./backup /path/to/project

# 4. Continue with Claude, GPT-4, or local Ollama
ironbridge agency run -m claude-3 --context ./backup/session.json \
  "Review the code we wrote and suggest improvements"

# 5. Merge multiple sessions into one unified history
ironbridge merge path /path/to/project

# 6. Search across ALL your AI conversations
ironbridge harvest search "authentication implementation"
```

### Universal session format

```json
{
  "id": "uuid",
  "title": "Session title",
  "provider": "copilot|cursor|chatgpt|claude|ollama|...",
  "workspace": "/path/to/project",
  "created_at": "2026-01-08T12:00:00Z",
  "messages": [
    {
      "role": "user|assistant|system",
      "content": "Message text",
      "timestamp": "2026-01-08T12:00:00Z",
      "tool_calls": [],
      "references": []
    }
  ],
  "metadata": {
    "model": "gpt-4o",
    "total_tokens": 15000,
    "files_referenced": ["src/main.rs", "Cargo.toml"]
  }
}
```

| Feature              | Vendor Lock-in    | With IronBridge                  |
| -------------------- | ----------------- | --------------------------- |
| Switch providers     | Lose all history  | Keep everything             |
| Search old chats     | Per-provider only | Search all at once          |
| Backup conversations | Manual exports    | Automatic harvesting        |
| Continue sessions    | Start fresh       | Full context preserved      |
| Compare providers    | Impossible        | Same task, different models |

---

## 🤖 Agentic Coding

IronBridge includes a full **agentic coding toolkit** similar to Claude Code, but provider-agnostic. Run coding tasks with any LLM backend.

```bash
# Simple coding task (single agent)
ironbridge agency run "Add error handling to main.rs"

# Specify a model
ironbridge agency run -m gpt-4o "Refactor this function to use async/await"

# Use local Ollama model
ironbridge agency run -m ollama/codellama "Write unit tests for lib.rs"

# Multi-agent swarm for complex tasks
ironbridge agency run --orchestration swarm "Build a REST API with authentication"

# Parallel agents for speed
ironbridge agency run --orchestration parallel "Analyze and fix all TODO comments"
```

### Available tools

| Tool           | Description                    |
| -------------- | ------------------------------ |
| `file_read`    | Read file contents             |
| `file_write`   | Write or modify files          |
| `terminal`     | Execute shell commands         |
| `code_search`  | Search codebase for symbols    |
| `web_search`   | Search the web for information |
| `http_request` | Make HTTP requests             |
| `calculator`   | Perform calculations           |

### Orchestration modes

| Mode           | Description                                 |
| -------------- | ------------------------------------------- |
| `single`       | Traditional single-agent (like Claude Code) |
| `sequential`   | Agents execute one after another            |
| `parallel`     | Multiple agents work simultaneously         |
| `swarm`        | Coordinated multi-agent collaboration       |
| `hierarchical` | Lead agent delegates to specialists         |
| `debate`       | Agents debate to find best solution         |

### Agent roles

- **coordinator** - Orchestrates multi-agent workflows
- **coder** - Writes and refactors code
- **reviewer** - Reviews code for issues
- **tester** - Generates and runs tests
- **researcher** - Gathers information
- **executor** - Runs commands and tasks

---

## 🔗 Merge & Consolidate Long Histories

Over time, AI conversations scatter across workspaces, branches, and providers. IronBridge's merge commands consolidate them into a coherent timeline:

```bash
# Merge all sessions for a project into a single session
ironbridge merge path /path/to/your/project

# Merge sessions from matching workspaces
ironbridge merge workspace "my-project*"

# Merge specific sessions by ID
ironbridge merge sessions <id1> <id2> <id3>

# Merge everything across all providers
ironbridge merge all
```

This is especially useful for:
- **Long-running projects** with dozens of scattered sessions
- **Team handoffs** where multiple developers chatted about the same codebase
- **Context consolidation** before starting a new coding task with full history

---

## 🔌 API Server & Real-time Recording

Start the REST API server for integration with web/mobile apps:

```bash
ironbridge api serve --host 0.0.0.0 --port 8787
```

### Endpoints

| Method | Endpoint                      | Description                          |
| ------ | ----------------------------- | ------------------------------------ |
| GET    | `/api/health`                 | Health check                         |
| GET    | `/api/workspaces`             | List workspaces                      |
| GET    | `/api/workspaces/:id`         | Get workspace details                |
| GET    | `/api/sessions`               | List sessions                        |
| GET    | `/api/sessions/:id`           | Get session with messages            |
| GET    | `/api/sessions/search?q=`     | Search sessions                      |
| GET    | `/api/stats`                  | Database statistics                  |
| GET    | `/api/providers`              | List supported providers             |
| POST   | `/api/recording/events`       | Send real-time recording events      |
| POST   | `/api/recording/snapshot`     | Store full session snapshot          |
| GET    | `/api/recording/sessions`     | List active recording sessions       |
| GET    | `/api/recording/sessions/:id` | Get recorded session by ID           |
| GET    | `/api/recording/status`       | Recording service status             |
| WS     | `/api/recording/ws`           | WebSocket for live session recording |

### Real-time recording

IronBridge's recording API prevents data loss from editor crashes by capturing sessions as they happen. Extensions send incremental events and IronBridge persists them in real-time.

**Recording modes:** Live (WebSocket), Batch (REST), Hybrid (WebSocket + REST checkpoints)

| Event            | Description                                    |
| ---------------- | ---------------------------------------------- |
| `session_start`  | Begin recording a new session                  |
| `session_end`    | End a recording session                        |
| `message_add`    | Add a new message (user, assistant, or system) |
| `message_update` | Update message content (streaming responses)   |
| `message_append` | Append to message content (incremental chunks) |
| `heartbeat`      | Keep session alive during idle periods         |

---

## 🗃️ Supported Providers

### Editor-based
- ✅ GitHub Copilot (VS Code)
- ✅ Cursor
- ✅ Windsurf
- ✅ Continue.dev

### Local LLMs
- ✅ Ollama
- ✅ LM Studio
- ✅ GPT4All
- ✅ LocalAI
- ✅ Jan.ai
- ✅ llama.cpp / llamafile
- ✅ vLLM
- ✅ Text Generation WebUI

### Cloud APIs
- ✅ OpenAI / ChatGPT
- ✅ Anthropic / Claude
- ✅ Google / Gemini
- ✅ Azure AI Foundry
- ✅ Perplexity
- ✅ DeepSeek

---

## 📦 Installation

### From crates.io

> **Not published under this name yet.** Everything released so far is on
> crates.io as [`chasm-cli`](https://crates.io/crates/chasm-cli), the project's
> former name, up to 2.0.0. Until `ironbridge-cli` is registered, install from
> source below — `cargo install ironbridge-cli` will not resolve.

```bash
cargo install ironbridge-cli
```

### From source

```bash
git clone https://github.com/nervosys/IronBridgeCLI.git
cd ironbridge-cli
cargo install --path .
```

### Pre-built binaries

Download from [GitHub Releases](https://github.com/nervosys/IronBridgeCLI/releases):

| Platform    | Download                                                                                               |
| ----------- | ------------------------------------------------------------------------------------------------------ |
| Windows x64 | [ironbridge-v1.0.0-x86_64-pc-windows-msvc.zip](https://github.com/nervosys/IronBridgeCLI/releases/latest)       |
| Windows ARM | [ironbridge-v1.0.0-aarch64-pc-windows-msvc.zip](https://github.com/nervosys/IronBridgeCLI/releases/latest)      |
| macOS x64   | [ironbridge-v1.0.0-x86_64-apple-darwin.tar.gz](https://github.com/nervosys/IronBridgeCLI/releases/latest)       |
| macOS ARM   | [ironbridge-v1.0.0-aarch64-apple-darwin.tar.gz](https://github.com/nervosys/IronBridgeCLI/releases/latest)      |
| Linux x64   | [ironbridge-v1.0.0-x86_64-unknown-linux-gnu.tar.gz](https://github.com/nervosys/IronBridgeCLI/releases/latest)  |
| Linux musl  | [ironbridge-v1.0.0-x86_64-unknown-linux-musl.tar.gz](https://github.com/nervosys/IronBridgeCLI/releases/latest) |

### Database locations

| Platform | Location                                   |
| -------- | ------------------------------------------ |
| Windows  | `%LOCALAPPDATA%\csm\csm.db`                |
| macOS    | `~/Library/Application Support/csm/csm.db` |
| Linux    | `~/.local/share/csm/csm.db`                |

---

## 📖 Complete CLI Reference

<details>
<summary><strong>Click to expand full command reference</strong></summary>

### Session Recovery & Fetching

| Command                            | Description                                                         |
| ---------------------------------- | ------------------------------------------------------------------- |
| `ironbridge fetch path <project-path>`  | **Recover sessions** - Fetches and registers sessions for a project |
| `ironbridge fetch workspace <pattern>`  | Fetch sessions from workspaces matching a pattern                   |
| `ironbridge fetch session <id>`         | Fetch a specific session by ID                                      |
| `ironbridge register all --path <path>` | Register all on-disk sessions into VS Code's database index         |

### Listing & Discovery

| Command                                     | Description                                        |
| ------------------------------------------- | -------------------------------------------------- |
| `ironbridge list workspaces`                     | List all discovered workspaces                     |
| `ironbridge list sessions`                       | List all sessions                                  |
| `ironbridge list sessions --project-path <path>` | List sessions for a specific project               |
| `ironbridge detect all <path>`                   | Auto-detect workspace, providers, and sessions     |
| `ironbridge detect workspace <path>`             | Detect workspace info for a path                   |
| `ironbridge detect providers`                    | List available LLM providers                       |
| `ironbridge detect orphaned <path>`              | Find orphaned workspaces with recoverable sessions |
| `ironbridge detect orphaned --recover <path>`    | Recover orphaned sessions to the active workspace  |

### Viewing & Searching

| Command                          | Description                     |
| -------------------------------- | ------------------------------- |
| `ironbridge show session <id>`        | Display full session content    |
| `ironbridge find session <pattern>`   | Search sessions by text pattern |
| `ironbridge find workspace <pattern>` | Search workspaces by name       |

### Export & Import

| Command                                     | Description                              |
| ------------------------------------------- | ---------------------------------------- |
| `ironbridge export path <dest> <project-path>`   | Export sessions from a project           |
| `ironbridge export workspace <dest> <hash>`      | Export sessions from a workspace         |
| `ironbridge export batch <dest> <paths...>`      | Batch export from multiple projects      |
| `ironbridge import path <source> <project-path>` | Import sessions into a project workspace |

### Merging

| Command                                | Description                               |
| -------------------------------------- | ----------------------------------------- |
| `ironbridge merge path <project-path>`      | Merge all sessions for a project into one |
| `ironbridge merge workspace <pattern>`      | Merge sessions from matching workspaces   |
| `ironbridge merge sessions <id1> <id2> ...` | Merge specific sessions by ID             |
| `ironbridge merge all`                      | Merge all sessions across all providers   |

### Sync & Recovery

| Command                                   | Description                                               |
| ----------------------------------------- | --------------------------------------------------------- |
| `ironbridge sync --pull`                       | Pull sessions from provider workspaces into database      |
| `ironbridge sync --push`                       | Push sessions from database back to provider workspaces   |
| `ironbridge sync --pull --push`                | Bidirectional sync                                        |
| `ironbridge sync --pull --workspace <pattern>` | Sync only matching workspaces                             |
| `ironbridge recover scan`                      | Scan for recoverable sessions from various sources        |
| `ironbridge recover extract <path>`            | Extract sessions from a VS Code workspace by project path |
| `ironbridge recover orphans`                   | List sessions that may be orphaned in workspaceStorage    |
| `ironbridge recover repair`                    | Repair corrupted session files in place                   |
| `ironbridge recover convert`                   | Convert session files between JSON and JSONL formats      |
| `ironbridge recover status`                    | Show recovery status and recommendations                  |

### Harvesting (Bulk Collection)

| Command                                 | Description                                       |
| --------------------------------------- | ------------------------------------------------- |
| `ironbridge harvest scan`                    | Scan for all available providers and sessions     |
| `ironbridge harvest run`                     | Harvest sessions from all providers into database |
| `ironbridge harvest run --providers copilot` | Harvest only from specific providers              |
| `ironbridge harvest status`                  | Show harvest database status                      |
| `ironbridge harvest search <query>`          | Full-text search across all harvested sessions    |
| `ironbridge harvest sync --push`             | Alias for `ironbridge sync --push`                     |
| `ironbridge harvest sync --pull`             | Alias for `ironbridge sync --pull`                     |

### Interactive Tools

| Command                              | Description                                  |
| ------------------------------------ | -------------------------------------------- |
| `ironbridge run tui`                      | Launch interactive TUI browser               |
| `ironbridge run ollama`                   | Chat with Ollama (auto-records session)      |
| `ironbridge run ollama -m codellama`      | Chat with a specific Ollama model            |
| `ironbridge run claudecode`               | Launch Claude Code CLI with recording        |
| `ironbridge run opencode`                 | Launch OpenCode CLI with recording           |
| `ironbridge run claude`                   | Chat with Claude API (auto-records session)  |
| `ironbridge run claude -m claude-3-haiku` | Chat with a specific Claude model            |
| `ironbridge run chatgpt`                  | Chat with ChatGPT API (auto-records session) |
| `ironbridge run chatgpt -m gpt-4o-mini`   | Chat with a specific ChatGPT model           |

### Git Integration

| Command              | Description                                 |
| -------------------- | ------------------------------------------- |
| `ironbridge git init`     | Initialize git versioning for chat sessions |
| `ironbridge git add`      | Stage and commit chat sessions              |
| `ironbridge git status`   | Show git status of chat sessions            |
| `ironbridge git log`      | Show history of chat session commits        |
| `ironbridge git snapshot` | Create a tagged snapshot                    |

### Provider Management

| Command               | Description                   |
| --------------------- | ----------------------------- |
| `ironbridge provider list` | List discovered LLM providers |

### Server & API

| Command                       | Description               |
| ----------------------------- | ------------------------- |
| `ironbridge api serve`             | Start the REST API server |
| `ironbridge api serve --port 8787` | Start on specific port    |

### Telemetry

| Command               | Description                            |
| --------------------- | -------------------------------------- |
| `ironbridge telemetry`     | Show current telemetry status          |
| `ironbridge telemetry on`  | Enable anonymous usage data collection |
| `ironbridge telemetry off` | Disable telemetry (opt-in by default)  |

</details>

---

## 🛠️ Development

### Prerequisites

- Rust 1.85+
- Git

### Building

```bash
git clone https://github.com/nervosys/IronBridgeCLI.git
cd ironbridge-cli
cargo build --release
```

### Running tests

```bash
cargo test
```

## 📜 License

This project is dual-licensed:

- **Open Source**: [GNU Affero General Public License v3.0](LICENSE) — free for open-source use. If you modify IronBridge and deploy it on a network, you must make the source available.
- **Commercial**: A proprietary license is available for companies that need to use IronBridge without AGPL obligations. See [COMMERCIAL_LICENSE.md](COMMERCIAL_LICENSE.md) for details or contact **licensing@nervosys.ai**.

## 🤝 Contributing

Contributions are welcome! By contributing, you agree that your contributions may be used under both licenses. Please read our [Contributing Guide](CONTRIBUTING.md) and [Code of Conduct](CODE_OF_CONDUCT.md).

## 🔒 Security

For security issues, please see our [Security Policy](SECURITY.md).

### Security Audit Summary (v1.2.9)

IronBridge underwent a comprehensive security audit in January 2026 against industry frameworks:

| Framework        | Status      | Notes                           |
| ---------------- | ----------- | ------------------------------- |
| **CVE/RustSec**  | ✅ Pass      | No direct vulnerabilities       |
| **MITRE ATT&CK** | ✅ Mitigated | Command execution requires auth |
| **NIST FIPS**    | ✅ Compliant | Argon2id password hashing       |
| **CMMC 2.0**     | ✅ Compliant | Authentication hardened         |

**Key Security Features:**
- 🔐 **Argon2id** password hashing (OWASP recommended)
- 🔑 **JWT authentication** with required secrets (no dev fallbacks)
- 🛡️ **Parameterized SQL** queries (no injection vectors)
- 🔒 **DPAPI/Keychain** integration for credential access

**Dependencies:** 2 transitive advisories from `ratatui` TUI framework (`paste` unmaintained, `lru` unsound iterator) - compile-time/TUI only, no runtime security risk.

## 📞 Support

- 📖 [Documentation](https://docs.rs/ironbridge-cli)
- 💬 [GitHub Discussions](https://github.com/nervosys/IronBridgeCLI/discussions)
- 🐛 [Issue Tracker](https://github.com/nervosys/IronBridgeCLI/issues)
- 📧 [Email Support](mailto:support@nervosys.com)

---

<p align="center">
  <sub>Built with Rust 🦀 by <a href="https://nervosys.ai">NERVOSYS</a></sub>
</p>

<p align="center">
  <a href="https://github.com/nervosys/IronBridgeCLI/stargazers">⭐ Star us on GitHub</a>
</p>
