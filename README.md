# Pshima Dotfiles

Ground up build of my personal dotfiles.

## tmux status bar

Tabs read `N: dirname`. Colors, driven by Claude Code and Codex hooks calling
`bin/agent-tmux-state`:

- blue: the window you are in
- amber: the agent finished or needs a decision and is waiting for you
- green: the agent is working
- default: idle shell

Every pane has a top border line with the directory and the same agent state.
Claude Code also gets a status line above its prompt (`bin/claude-statusline`)
showing `[tmux window] ~/dir  branch  ·  model  ·  ctx %`.

Hook config: `codex/hooks.json` is symlinked by `install.sh`; the Claude Code
equivalent lives in `claude/settings-snippet.json` and is merged into
`~/.claude/settings.json` by hand.
