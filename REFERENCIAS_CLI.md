# 📚 Referencias Oficiales — GitHub Copilot CLI & Ecosistema

## 📖 Documentación Oficial

### CLI Command Reference
- **URL:** https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-command-reference
- **Contenido:** Referencia completa de todos los comandos, slash commands, shortcuts, modelos soportados, MCP servers, skills, custom agents, seguridad, OpenTelemetry
- **Fecha:** Build 2026

### CLI Configuration Directory
- **URL:** https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-configuration-directory
- **Contenido:** Configuración de settings, environment variables, hooks, plugins

### CLI Plugin Reference
- **URL:** https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-plugin-reference
- **Contenido:** Sistema de plugins y marketplaces

### CLI Programmatic Reference
- **URL:** https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-programmatic-reference
- **Contenido:** Uso programático con `--prompt`, `--interactive`, `--silent`

## 🔑 Comandos Clave del CLI

### Command-line Commands
| Comando | Propósito |
|---------|-----------|
| `copilot` | Launch interactive UI |
| `copilot completion SHELL` | Tab completion (bash, zsh, fish) |
| `copilot help [TOPIC]` | Help: billing, config, commands, environment, logging, monitoring, permissions, providers |
| `copilot init` | Initialize custom instructions for repo |
| `copilot login` | OAuth device flow authentication |
| `copilot mcp` | Manage MCP server configurations |
| `copilot plugin` | Manage plugins and marketplaces |
| `copilot update` | Download and install latest version |
| `copilot version` | Display version info |

### Slash Commands Principales
| Comando | Propósito |
|---------|-----------|
| `/add-dir PATH` | Add directory to allowed file access |
| `/after DELAY PROMPT` | Schedule non-recurring prompt (experimental) |
| `/agent` | Browse and select from available agents |
| `/app` | Launch GitHub Copilot App |
| `/ask QUESTION` | Quick side question (experimental) |
| `/allow-all [on/off/show]` | Enable all permissions (yolo) |
| `/changelog [summarize]` | Display CLI changelog |
| `/chronicle <standup|tips|improve>` | Session history tools and insights |
| `/clear [PROMPT]` / `/new [PROMPT]` / `/reset [PROMPT]` | New conversation |
| `/compact [FOCUS-INSTRUCTIONS]` | Summarize conversation to reduce context |
| `/context` | Show context window token usage |
| `/cwd [PATH]` / `/cd [PATH]` | Change working directory |
| `/delegate [PROMPT]` | Delegate to remote with AI-generated PR |
| `/diff` | Review changes (experimental) |
| `/downgrade VERSION` | Restart into specific version (team accounts) |
| `/env` | Show loaded environment details |
| `/every INTERVAL PROMPT` | Schedule recurring prompt (experimental) |
| `/experimental [on/off/show]` | Toggle experimental features |
| `/feedback` / `/bug` | Provide feedback |
| `/fleet [PROMPT]` | Enable parallel subagent execution |
| `/help` | Show help for interactive commands |
| `/ide` | Connect to VS Code workspace |
| `/init` | Initialize custom instructions |
| `/instructions` | View and toggle custom instructions |
| `/keep-alive [on/off/busy/DURATION]` | Prevent machine from sleeping |
| `/list-dirs` | Display allowed directories |
| `/login` | Log in to Copilot |
| `/logout` | Log out |
| `/lsp [show|test|reload] [SERVER]` | Manage language server config |
| `/mcp [show|add|edit|delete|disable|enable|auth|reload|search] [SERVER]` | Manage MCP servers |
| `/model [MODEL]` / `/models [MODEL]` | Select AI model |
| `/permissions [show|reset]` | View or clear tool approvals |
| `/plan [PROMPT]` | Create implementation plan |
| `/plugin [marketplace|install|uninstall|update|list]` | Manage plugins |
| `/pr [view|create|fix|auto]` | Manage pull requests |
| `/remote [on/off]` | Remote control status |
| `/rename [NAME]` | Rename current session |
| `/research TOPIC` | Deep research with GitHub search |
| `/resume [SESSION-ID]` / `/continue [SESSION-ID]` | Switch to different session |
| `/review [PROMPT]` | Run code review agent |
| `/rubber-duck [PROMPT]` | Rubber duck agent for second opinion |
| `/sandbox [enable|disable]` | Configure shell command sandboxing |
| `/security-review [PROMPT]` | Run security review agent |
| `/session [info|checkpoints|files|plan|rename|cleanup|prune|delete]` | Manage sessions |
| `/settings [show|KEY VALUE|reset KEY]` | Open settings dialog |
| `/share [file|html|gist] [session|research] [PATH]` | Share session to Markdown/HTML/Gist |
| `/skills [list|info|add|remove|reload]` | Manage skills |
| `/statusline` / `/footer` | Configure status line items |
| `/subagents` / `/agents` | Configure default and per-agent subagent models |
| `/tasks` | View and manage tasks |
| `/terminal-setup` | Configure terminal for multiline input |
| `/theme [default|dim|high-contrast|colorblind]` | Set color mode |
| `/undo` / `/rewind` | Rewind last turn and revert file changes |
| `/update` / `/upgrade` | Update CLI to latest version |
| `/usage` | Display session usage metrics |
| `/user [show|list|switch]` | Manage GitHub user |
| `/version` | Display version info |
| `/worktree [branch]` / `/move [branch]` | Create Git worktree (experimental) |

### Global Shortcuts
| Shortcut | Propósito |
|----------|-----------|
| `@ FILENAME` | Include file contents in context |
| `# NUMBER` | Include GitHub issue or PR in context |
| `! COMMAND` | Execute command in local shell |
| `?` | Open quick help |
| `Esc` | Cancel current operation |
| `Ctrl+C` | Cancel operation / clear input |
| `Ctrl+D` | Shutdown |
| `Ctrl+G` | Edit prompt in external editor |
| `Ctrl+L` | Clear screen |
| `Ctrl+Enter` / `Ctrl+Q` | Queue message while agent is busy |
| `Ctrl+R` | Reverse search command history |
| `Ctrl+V` | Paste from clipboard |
| `Ctrl+X then /` | Run slash command after typing prompt |
| `Ctrl+X then b` | Promote task to background |
| `Shift+Tab` | Cycle between standard, plan, and autopilot mode |

### Supported Models
| Modelo | Mejor para |
|--------|-----------|
| `claude-sonnet-4.6` | General-purpose coding (default) |
| `gpt-5.4` | Complex reasoning tasks |
| `claude-haiku-4.5` | Fast, lightweight operations |
| `gpt-5.3-codex` | Code-focused tasks |
| `gemini-3.1-pro-preview` | Google Gemini reasoning |
| `gemini-3.5-flash` | Fast Google Gemini responses |
| `mai-code-1-flash` | Fast, adaptive coding tasks |

## 🛠️ Built-in MCP Servers

| Servidor | Descripción |
|----------|-----------|
| `github-mcp-server` | GitHub API: issues, PRs, labels, commits, code search, Actions |
| `playwright` | Browser automation: navigate, click, type, screenshot |
| `fetch` | HTTP requests via fetch tool |
| `time` | Time utilities |
| `computer-use` | Screen capture and mouse/keyboard automation |

## 🔒 Seguridad

- **Command safety analysis:** Detecta `rm -rf`, `sudo`, `chmod 777`, network exfiltration, credential access
- **Environment variable denylist:** Bloquea `LD_*`, `DYLD_*`, `GIT_CONFIG_*`, `PATH`, `BASH_ENV`
- **web_fetch SSRF protection:** Protocol allowlist (http/https only), IP blocklist (loopback, RFC-1918, cloud metadata), no auto-redirects
- **OpenTelemetry monitoring:** Traces, metrics, spans para agent interactions, LLM calls, tool executions, token usage

## 📊 Environment Variables Clave

| Variable | Descripción |
|----------|-----------|
| `COPILOT_ALLOW_ALL` | Allow all permissions automatically |
| `COPILOT_AUTO_UPDATE` | Disable automatic updates |
| `COPILOT_GITHUB_TOKEN` | Authentication token (highest precedence) |
| `COPILOT_HOME` | Override config directory (default: ~/.copilot) |
| `COPILOT_MODEL` | Set AI model |
| `COPILOT_SUBAGENT_MAX_CONCURRENT` | Max concurrent subagents (default: 32, range: 1-256) |
| `COPILOT_SUBAGENT_MAX_DEPTH` | Max subagent nesting depth (default: 6, range: 1-256) |

## 📁 Skills Locations (Priority Order)

1. `.github/skills/` — Project
2. `.agents/skills/` — Project (alternative)
3. `.claude/skills/` — Project (Claude-compatible)
4. Parent `.github/skills/` — Inherited (monorepo)
5. `~/.copilot/skills/` — Personal
6. `~/.agents/skills/` — Personal (alternative)
7. Plugin directories — Plugin
8. `COPILOT_SKILLS_DIRS` — Custom
9. Bundled with CLI — Built-in (lowest priority)

## 🤖 Custom Agents

| Agent | Default Model | Descripción |
|-------|--------------|-----------|
| `code-review` | claude-sonnet-4.5 | High signal-to-noise code review |
| `explore` | claude-haiku-4.5 | Fast codebase exploration |
| `general-purpose` | claude-sonnet-4.5 | Full-capability agent for complex tasks |
| `research` | claude-sonnet-4.6 | Deep research agent |
| `rubber-duck` | complementary model | Constructive critique of proposals |
| `task` | claude-haiku-4.5 | Command execution (tests, builds, lints) |

## 🎯 Comandos Post-Build Destacados

### `/fleet [PROMPT]`
Enable parallel subagent execution of parts of a task. Permite ejecutar múltiples agentes en paralelo para dividir tareas complejas.

### `/research TOPIC`
Deep research investigation using GitHub search and web sources. Genera informes basados en código, repositorios y web.

### `/delegate [PROMPT]`
Delega cambios a un repo remoto con un PR generado por IA. Útil para workflows de colaboración.

### `/compact [FOCUS-INSTRUCTIONS]`
Summariza la conversación para reducir el uso del context window. Opcionalmente puede enfocarse en módulos específicos.

### `/pr [view|create|fix|auto]`
Manage pull requests for the current branch. Incluye auto-merge granular.

### `/sandbox [enable|disable]`
Configure shell command sandboxing para mayor seguridad.

### `/worktree [branch]`
Create a new Git worktree and switch to it, moving uncommitted changes. Experimental.

### `/after DELAY PROMPT`
Schedule a non-recurring prompt, skill, or schedulable slash command. Experimental.

### `/every INTERVAL PROMPT`
Schedule a recurring prompt, skill, or schedulable slash command. Experimental.

### `/remote [on/off]`
Remote control status. Enable remote steering from another device.

### `/share [file|html|gist] [session|research] [PATH]`
Share session to Markdown, HTML, or GitHub gist.
