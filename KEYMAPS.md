# Neovim keymaps reference

All keymaps from `lua/metaory/keymaps.lua` and plugin specs. Default = plugin default when different from ours; — = same as ours or N/A.

| Plugin          | Keymap                                      | Default        | Description                                                      |
| --------------- | ------------------------------------------- | -------------- | ---------------------------------------------------------------- |
| Core            |                                             |                |                                                                  |
| Core            | `j` / `k`                                   | —              | Move by display line (with count: add mark)                      |
| Core            | `<Esc>`                                     | —              | Clear hlsearch and escape (n, i)                                 |
| Core            | `<leader><Tab>d`                            | —              | Close tab                                                        |
| Core            | `<leader><Tab>n`                            | —              | Next tab                                                         |
| Core            | `<leader><Tab>p`                            | —              | Previous tab                                                     |
| Core            | `x` (visual)                                | —              | Delete without yank                                              |
| Core            | `dd`                                        | —              | Smart dd: blank line → blackhole, else normal dd                 |
| Core            | `Y`                                         | `y$`           | Yank to end of line                                              |
| Core            | `n` / `N`                                   | —              | Next/prev search with zzzv                                       |
| Core            | `gj`                                        | —              | Join line below                                                  |
| Core            | `<` / `>` (v)                               | —              | Indent less/more (stay in visual)                                |
| Core            | `<C-e>` / `<C-y>`                           | —              | Scroll down / 3 lines up                                         |
| Core            | `Q`                                         | —              | Disabled                                                         |
| Core            | `<leader><leader>`                          | —              | Last buffer                                                      |
| Core            | `<leader>bn`                                | —              | New file                                                         |
| Core            | `<leader>bq`                                | —              | Quit file                                                        |
| Core            | `<leader>bo`                                | —              | Close other buffers                                              |
| Core            | `<leader>bw` / `bW`                         | —              | Write / write all                                                |
| Core            | `<leader>bQ`                                | —              | Quit nvim                                                        |
| Core            | `<leader>fn`                                | —              | Noice (notification history)                                     |
| Core            | `<leader>1`/`2`/`3` (diff)                  | —              | Diffget LOCAL/BASE/REMOTE                                        |
| Core            | `<leader>lj` / `lJ`                         | —              | JSON format / compact                                            |
| Core            | `<leader>lf`                                | —              | LSP format                                                       |
| Core            | `<F10>` / `<F11>`                           | —              | Toggle conceallevel / concealcursor                              |
| Core            | `<C-M-k>` / `j` / `h` / `l`                 | TmuxResize     | Tmux resize panes                                                |
| Core            | `<leader>c,` / `c;`                         | —              | Add `,` / `;` to end of line                                     |
| Core            | `<leader>cn` / `cN`                         | —              | Replace next occurrence / backwards                              |
| Core            | `<leader>oc`                                | —              | Open Chrome DevTools + open file:line                            |
| Core            | `cedit`                                     | —              | Set to `<C-y>`                                                   |
| Core            | `<leader>l`                                 | (del)          | Removed (was LSP)                                                |
| Core            | `<C-a>` / `<C-e>` / `<C-f>` / `<C-b>` (i)   | —              | Home / End / Right / Left                                        |
| Core            | `<M-k>` / `<M-j>` (c)                       | —              | Up / Down in cmdline                                             |
| Core            | `<C-f>` / `<C-a>` / `<C-b>` / `<M-b>` (c)   | —              | Cmdline motion                                                   |
| Core            | `w!!` (c)                                   | —              | sudo tee %                                                       |
| Core            | `<C-M-J>` / `K` / `H` / `L`                 | —              | Resize window                                                    |
| Core            | `<M-Y>` / `<M-y>` / `<M-p>`                 | —              | Yank whole/line to system, Paste (n,i,v)                         |
| Core            | `<M-d>` / `<M-s>` / `<M-Q>` / `<M-q>`       | —              | Command / Save / Exit all / Quit                                 |
| Core            | `q` (t)                                     | —              | Quit gracefully in terminal                                      |
| Core            | `<M-j>` / `<M-k>` / `<M-x>`                 | —              | Prev/next buffer, delete buffer                                  |
| Core            | `<M-g>` / `<M-r>`                           | —              | Grep (cwd), Resume last picker                                   |
| Core            | `<leader>fM`                                | —              | Man pages (snacks picker)                                        |
| Core            | `<RightMouse>`                              | —              | Right-click: go to pos + yank inner quote to +                   |
| Core            | `\ct`                                       | —              | Trim trailing whitespace                                         |
| Core            | `\G` / `\O` / `\X` / `\h` / `\H`            | —              | Glyph / CursorLine / TSContext / TSHighlight / Hipatterns        |
| Core            | `\m` / `\Z` / `\T` / `\C` / `\w`            | —              | MiniMap / Zoom / Trailspace / CursorWord / Wrap                  |
| Core            | `\c` / `\f` / `\V` / `\d` / `\L` / `\l`     | —              | Conceal / cmdheight / verbose / diagnostic / LSP / numbers       |
| avante          |                                             |                |                                                                  |
| avante          | `<C-g>a`                                    | `<leader>aa`   | Ask Avante. n: file. x: selection                                |
| avante          | `<C-g><C-g>`                                | —              | n: ask operator (motion). x: ask selection                       |
| avante          | `<C-g>e`                                    | `<leader>ae`   | n: edit operator (motion). x: edit selection                     |
| avante          | `<C-g>t`                                    | `<leader>at`   | Toggle Avante sidebar (n)                                        |
| avante          | `<C-g>p`                                    | `<leader>ah`   | Avante chat history (n)                                          |
| avante          | `<CR>` / `<M-s>` / `<S-CR>`                 | insert `<C-s>` | Submit Avante prompt (n,i). `<C-s>` is tmux prefix               |
| gp              |                                             |                |                                                                  |
| gp              | `<C-g>r`                                    | —              | Rewrite (n,i)                                                    |
| gp              | `<C-g>i`                                    | —              | Implement (n,i)                                                  |
| opencode        | —                                           | —              | Spec present, `enabled = false`                                  |
| blink.cmp       |                                             |                |                                                                  |
| blink.cmp       | `<C-y>`                                     | ✓              | Select and accept completion                                     |
| blink.cmp       | `<Tab>` / `<S-Tab>`                         | snippet        | Accept, snippet, or fallback                                     |
| blink.cmp       | `<CR>`                                      | —              | Accept or fallback                                               |
| blink.cmp       | `<C-l>` / `<C-h>`                           | —              | Snippet forward/backward                                         |
| blink.cmp       | `<Up>` / `<Down>` / `<C-p>` / `<C-n>`       | —              | Select prev/next                                                 |
| blink.cmp       | `<C-b>` / `<C-f>`                           | —              | Scroll documentation                                             |
| blink.cmp       | `<C-space>` / `<C-e>`                       | —              | Show/cycle docs, hide                                            |
| snacks          |                                             |                |                                                                  |
| snacks          | `<leader>fg`                                | —              | Grep (with toggles)                                              |
| snacks          | `<leader>*`                                 | —              | Grep word under cursor                                           |
| snacks          | `<leader>fc`                                | —              | Command history                                                  |
| snacks          | `<leader>n`                                 | —              | Notification history                                             |
| snacks          | `<M-o>` / `<M-r>`                           | —              | Old files / Recent files                                         |
| snacks          | `<leader>fb`                                | —              | Buffers                                                          |
| snacks          | `<leader>fs`                                | —              | Git status                                                       |
| snacks          | `<leader>fh` / `fH` / `fi`                  | —              | Help / Highlights / Icons                                        |
| snacks          | `<leader>fr` / `fu`                         | —              | Resume / Undo history                                            |
| snacks          | `<leader>ff`                                | —              | LSP symbols (Function, Method, Field)                            |
| snacks          | `<leader>.` / `<leader>S`                   | —              | Scratch buffer / Select scratch                                  |
| snacks          | `<leader>bd` / `<leader>fR`                 | —              | Bufdelete / Rename file                                          |
| snacks          | `]]` / `[[`                                 | —              | Next/prev reference (n,t)                                        |
| fff             |                                             |                |                                                                  |
| fff             | `<C-p>`                                     | —              | Project files                                                    |
| fff             | `<M-f>`                                     | —              | Find files (fff picker)                                          |
| trouble         |                                             |                |                                                                  |
| trouble         | `<leader>xd`                                | —              | Document diagnostics                                             |
| trouble         | `<leader>xl`                                | —              | Loclist                                                          |
| trouble         | `<leader>xq`                                | —              | Quickfix                                                         |
| trouble         | `<leader>xr`                                | —              | LSP references                                                   |
| trouble         | `<c-t>` (in snacks picker)                  | —              | Open Trouble from picker                                         |
| gitsigns        |                                             |                |                                                                  |
| gitsigns        | `]h` / `[h`                                 | —              | Next/prev git hunk                                               |
| gitsigns        | `<leader>hs` / `hr`                         | —              | Stage / Reset hunk (n,v)                                         |
| gitsigns        | `<leader>hS` / `hu` / `hR`                  | —              | Stage buffer / Undo stage / Reset buffer                         |
| gitsigns        | `<leader>hp` / `hb` / `hg`                  | —              | Preview hunk / Blame line / Toggle line blame                    |
| gitsigns        | `<leader>hd` / `hD` / `ht`                  | —              | Diff this / Diff ~ / Toggle deleted                              |
| gitsigns        | `ih` (o,x)                                  | —              | Text object: hunk                                                |
| diffview        |                                             |                |                                                                  |
| diffview        | `<leader>gdo`                               | —              | Diffview open                                                    |
| diffview        | `<leader>gdf`                               | —              | File history                                                     |
| diffview        | `<leader>gdm` / `gdM`                       | —              | Diff master / main                                               |
| nvim-dap        |                                             |                |                                                                  |
| nvim-dap        | `<leader>dB` / `db`                         | —              | Breakpoint condition / Toggle breakpoint                         |
| nvim-dap        | `<leader>dc` / `da` / `dC`                  | —              | Continue / Run with args / Run to cursor                         |
| nvim-dap        | `<leader>dg` / `di` / `dj` / `dk`           | —              | Go to line / Step into / Down / Up                               |
| nvim-dap        | `<leader>dl` / `do` / `dO` / `dp`           | —              | Run last / Step over / Step out / Pause                          |
| nvim-dap        | `<leader>dr` / `ds` / `dT` / `dw`           | —              | REPL / Session / Terminate / Widgets                             |
| nvim-dap-ui     | `<leader>du` / `de`                         | —              | Toggle DAP UI / Eval (n,v)                                       |
| dap-go          | `<leader>dt`                                | —              | Debug test                                                       |
| lspconfig       |                                             |                |                                                                  |
| lspconfig       | `<leader>lr`                                | —              | LspRestart all                                                   |
| lspconfig       | `<leader>le`                                | —              | Restart eslint_d                                                 |
| glance          |                                             |                |                                                                  |
| glance          | `gd`                                        | LSP            | Glance definitions                                               |
| glance          | `gr`                                        | LSP            | Glance references                                                |
| glance          | `gY`                                        | —              | Glance type definitions                                          |
| glance          | `gi`                                        | —              | Glance implementations                                           |
| LSP             |                                             |                |                                                                  |
| LSP             | `gD`                                        | —              | Declaration                                                      |
| LSP             | `gh` / `gH`                                 | —              | Hover / Signature help                                           |
| LSP             | `ge`                                        | —              | Diagnostic float                                                 |
| LSP             | `[d` / `]d` / `[e` / `]e`                   | —              | Next/prev diagnostic / error                                     |
| LSP             | `<leader>lh`                                | —              | Toggle inlay hints                                               |
| which-key       | —                                           | —              | Groups only (no keymaps)                                         |
| grapple         |                                             |                |                                                                  |
| grapple         | `<leader>fm`                                | —              | Toggle tag                                                       |
| grapple         | `<leader>fo`                                | —              | Open tags                                                        |
| neotest         | —                                           | disabled       | —                                                                |
| noice           |                                             |                |                                                                  |
| noice           | `<Esc>`                                     | —              | RemoveNotiAndHl (nohl + dismiss)                                 |
| noice           | `<C-d>` / `<C-u>` (i,n)                     | —              | Scroll LSP doc forward/back (expr)                               |
| ssr             |                                             |                |                                                                  |
| ssr             | `<leader>cr`                                | —              | Find and replace with treesitter (n,x)                           |
| octo            |                                             |                |                                                                  |
| octo            | (many)                                      | —              | Issue/PR/Review mappings (see plugin; `<leader>o*`, `<space>o*`) |
| smart-open      | disabled                                    | `<C-p>`        | Project files                                                    |
| inc-rename      |                                             |                |                                                                  |
| inc-rename      | `gR`                                        | —              | IncRename (expr)                                                 |
| genghis         |                                             |                |                                                                  |
| genghis         | `<leader>yp` / `yn` / `yx`                  | —              | Copy path / filename / Move selection to new file                |
| gitlinker       |                                             |                |                                                                  |
| gitlinker       | `<leader>gym` / `gyb` / `gyc`               | —              | Copy line URL (main/current/commit) (n,v)                        |
| gitlinker       | `<leader>gB`                                | —              | GitHub blame (main) (n,v)                                        |
| gh-blame        |                                             |                |                                                                  |
| gh-blame        | `<leader>gg`                                | —              | GhBlameCurrentLine                                               |
| gh-addressed    |                                             |                |                                                                  |
| gh-addressed    | `<leader>gc`                                | —              | GhReviewComments                                                 |
| grug-far        |                                             |                |                                                                  |
| grug-far        | `<leader>cR`                                | —              | Find and replace globally (n,x)                                  |
| conform         |                                             |                |                                                                  |
| conform         | `<leader>lF`                                | —              | Toggle auto formatting                                           |
| blame           |                                             |                |                                                                  |
| blame           | `<leader>gb`                                | —              | BlameToggle                                                      |
| treewalker      |                                             |                |                                                                  |
| treewalker      | `H` / `J` / `K` / `L`                       | —              | Treewalker Up/Right/Left/Down (n,o)                              |
| tree-climber    | disabled                                    | K/L/H/J        | Goto parent/next/prev/child                                      |
| treesj          |                                             |                |                                                                  |
| treesj          | `<space>cb`                                 | —              | Split/join block                                                 |
| substitute      |                                             |                |                                                                  |
| substitute      | `<CR>` (n)                                  | —              | Substitute iw                                                    |
| substitute      | `<leader>p` / `pp` / `P`                    | —              | Substitute op/line/eol (n,x)                                     |
| substitute      | `<CR>` (x)                                  | —              | Substitute (visual)                                              |
| maximize        |                                             |                |                                                                  |
| maximize        | `<leader>bz`                                | —              | Maximize buffer                                                  |
| nvim-recorder   |                                             |                |                                                                  |
| nvim-recorder   | `qq` / `Q` / `!!` / `cq`                    | —              | Start/stop recording, Play, Breakpoint, Edit                     |
| vim-test        |                                             |                |                                                                  |
| vim-test        | `<leader>tn` / `tt` / `tf` / `tr`           | —              | Test nearest / suite / file / last                               |
| tmux-resizer    |                                             |                |                                                                  |
| tmux-resizer    | (from keymaps.lua)                          | —              | <C-M-j/k/h/l> resize                                             |
| mini.files      |                                             |                |                                                                  |
| mini.files      | `<leader>e`                                 | —              | Toggle mini.files at current file                                |
| mini.files      | `<leader>bw` (in mini.files)                | —              | Synchronize                                                      |
| visual-surround |                                             |                |                                                                  |
| visual-surround | `sc` / `sp` / `sb` / `st` / `sq` / `ss` (v) | —              | Surround with {} / () / [] / ` / " / '                           |
| toggle          |                                             |                |                                                                  |
| toggle          | `<leader>u*`                                | —              | Toggle option prefix; `<leader>us` status dashboard              |
| venv-selector   |                                             |                |                                                                  |
| venv-selector   | `<leader>cv`                                | —              | VenvSelect                                                       |
| kulala          |                                             |                |                                                                  |
| kulala          | `<leader>Rs` / `Ra` / `Rb` / `Ro`           | —              | Send request / all / Scratchpad / Open Kulala                    |
| gx              |                                             |                |                                                                  |
| gx              | `gx`                                        | netrw gx       | Browse URL (n,x)                                                 |
| qmk             | —                                           | —              | No keymaps (ft=keymap, layout only)                              |

## Leader and prefix

- Leader: `<space>` (from options)
- Second prefix: `\` (backslash) for toggles and utilities
- AI prefix: `<C-g>` — gp (`r`/`i`) and avante (`a`/`e`/`p`/`t`/`<C-g>`). OpenCode spec is present but disabled.

## Modes

- n = normal, i = insert, v = visual, x = visual line/block, c = command-line, t = terminal
- Unlisted mode = normal unless stated in plugin.

---

| Keymap     | Mode | Action               | Context sent                                       |
| ---------- | ---- | -------------------- | -------------------------------------------------- |
| <C-g>a     | n    | `avante.api.ask()`   | current file                                       |
| <C-g>a     | x    | ask selection        | visual range (`line("v")` / `.`)                   |
| <C-g><C-g> | n    | ask operator (`g@`)  | motion (`_` line, `ip`, `}`)                       |
| <C-g><C-g> | x    | ask selection        | visual range                                       |
| <C-g>e     | n    | edit operator (`g@`) | motion                                             |
| <C-g>e     | x    | edit selection       | visual range                                       |
| <C-g>t     | n    | `:AvanteToggle`      | toggle Avante sidebar                              |
| <C-g>p     | n    | `:AvanteHistory`     | picker of previous Avante chats                    |
| <CR>       | n, i | Avante submit        | Enter submits (insert too; newline via normal `o`) |
| <M-s>      | i    | Avante submit        | Alt+s in Avante input (overrides global save)      |
| <S-CR>     | i    | Avante submit        | Shift+Enter                                        |
| <C-g>r     | n, i | `:GpRewrite ~`       | rewrite with gp                                    |
| <C-g>i     | n, i | `:GpImplement ~`     | implement with gp                                  |

## Free keymaps (normal mode)

Keys not bound by this config in normal mode. "Vim default" = unbound by us but carries default behavior; remapping replaces it. Context-only bindings (blink insert, picker windows, octo buffers) do not count as taken. Plugin-wide global mappings (noice `<C-d>`/`<C-u>`, vim-tmux-navigator `<C-hjkl>`) DO count as taken.

### Ctrl

| Key         | Status             | Vim default          |
| ----------- | ------------------ | -------------------- |
| `<C-b>`     | Free               | Page back            |
| `<C-c>`     | Free               | Interrupt            |
| `<C-f>`     | Free               | Page forward         |
| `<C-n>`     | Free               | Next line/completion |
| `<C-o>`     | Free               | Jumplist back        |
| `<C-q>`     | Free               | Flow control (stty)  |
| `<C-r>`     | Free               | Redo                 |
| `<C-s>`     | tmux prefix        | Flow control (stty)  |
| `<C-t>`     | Free               | Tag jump             |
| `<C-space>` | Free               | —                    |
| `<C-/>`     | Free               | Same as `<C-_>`      |
| `<C-i>`     | Free (= `<Tab>`)   | Jumplist forward     |
| `<C-a>`     | dial increment     | Increment number     |
| `<C-x>`     | dial decrement     | Decrement number     |
| `<C-p>`     | fff find files     | Cursor up            |
| `<C-e>`     | Nop'd              | Scroll down 1 line   |
| `<C-y>`     | scroll up 3, cedit | Scroll up 1 line     |
| `<C-g>`     | AI prefix          | File status/info     |
| `<C-d>`     | noice scroll       | Half-page down       |
| `<C-u>`     | noice scroll       | Half-page up         |
| `<C-h>`     | tmux-nav left      | Like backspace       |
| `<C-j>`     | tmux-nav down      | Like `<CR>`          |
| `<C-k>`     | tmux-nav up        | Digraph entry        |
| `<C-l>`     | tmux-nav right     | Redraw               |
| `<C-m>`     | Reserved           | Same as `<CR>`       |
| `<C-v>`     | Reserved           | Visual block         |
| `<C-w>`     | Reserved           | Window prefix        |
| `<C-z>`     | Reserved           | Suspend              |
| `<C-]>`     | Reserved           | Tag jump             |

### Alt (Meta)

| Key     | Status                             |
| ------- | ---------------------------------- |
| `<M-a>` | Free                               |
| `<M-b>` | Free (cmdline, c)                  |
| `<M-c>` | Free                               |
| `<M-e>` | Free                               |
| `<M-i>` | Free                               |
| `<M-l>` | Free (tmux-resizer disabled)       |
| `<M-m>` | Free                               |
| `<M-n>` | Free                               |
| `<M-t>` | Free                               |
| `<M-u>` | Free                               |
| `<M-v>` | Free                               |
| `<M-w>` | Free                               |
| `<M-z>` | Free                               |
| `<M-h>` | Free (tmux-resizer disabled)       |
| `<M-j>` | Taken (prev buffer; c: down)       |
| `<M-k>` | Taken (next buffer; c: up)         |
| `<M-x>` | Taken (delete buffer)              |
| `<M-y>` | Taken (yank EOL/selection)         |
| `<M-Y>` | Taken (yank whole file)            |
| `<M-p>` | Taken (paste, i)                   |
| `<M-d>` | Taken (command line)               |
| `<M-s>` | Taken (save; Avante input: submit) |
| `<M-q>` | Taken (quit)                       |
| `<M-Q>` | Taken (exit all)                   |
| `<M-g>` | Taken (grep cwd)                   |
| `<M-r>` | Taken (CONFLICT: resume vs recent) |
| `<M-o>` | Taken (old files)                  |
| `<M-f>` | Taken (fff find files)             |

Uppercase Alt: all free except `<M-Y>` and `<M-Q>`.

## Conflicts found

| Key     | Defined in                 | Action 1              | Action 2                             | Winner                                     |
| ------- | -------------------------- | --------------------- | ------------------------------------ | ------------------------------------------ |
| `<M-r>` | keymaps.lua + snacks.lua   | Resume last picker    | Recent files                         | snacks.lua (loads after keymaps.lua)       |
| `<M-s>` | keymaps.lua + llm.lua      | Save file (global, n) | Avante submit (buffer-local, i)      | No real conflict (different modes)         |
| `<C-e>` | keymaps.lua + blink/snacks | Nop (global, n)       | blink hide docs (i), picker maximize | No real conflict (different modes/windows) |
| `<C-a>` | dial + octo submit_win     | Increment (global, n) | Approve review (octo buffer)         | No real conflict (octo buffer-local only)  |

## Native keys overridden (normal mode, global)

What the stock Vim behavior was, and what replaced it.

| Key       | Native behavior         | Now bound to                   | Lost?                     |
| --------- | ----------------------- | ------------------------------ | ------------------------- |
| `<C-a>`   | Inc number              | dial increment                 | No (dial is a superset)   |
| `<C-x>`   | Dec number              | dial decrement                 | No (dial is a superset)   |
| `<C-p>`   | Cursor up               | fff find files                 | Yes (use `k` instead)     |
| `<C-e>`   | Scroll down 1 line      | Nop                            | Yes (scroll down removed) |
| `<C-y>`   | Scroll up 1 line        | Scroll up 3 lines + cedit      | Partial (now 3 lines)     |
| `<C-g>`   | Show file status/info   | AI prefix (`<C-g>a/e/t/p/…`)   | Yes                       |
| `<C-d>`   | Half-page down          | noice scroll (fallback 10j+zz) | Yes (different scroll)    |
| `<C-u>`   | Half-page up            | noice scroll (fallback 10k+zz) | Yes (different scroll)    |
| `<C-h>`   | Like backspace          | tmux-navigator left pane       | Yes                       |
| `<C-j>`   | Like `<CR>` (move down) | tmux-navigator down pane       | Yes                       |
| `<C-k>`   | Digraph entry           | tmux-navigator up pane         | Yes                       |
| `<C-l>`   | Redraw screen           | tmux-navigator right pane      | Yes                       |
| `<C-M-*>` | (no native default)     | tmux resize (hjkl + HJKL)      | —                         |
