# Neovim keymaps reference

All keymaps from `lua/metaory/keymaps.lua` and plugin specs. **Default** = plugin default when different from ours; **—** = same as ours or N/A.

| Plugin | Keymap | Default | Description |
|--------|--------|---------|-------------|
| **Core (keymaps.lua)** | | | |
| Core | `j` / `k` | — | Move by display line (with count: add mark) |
| Core | `<Esc>` | — | Clear hlsearch and escape (n, i) |
| Core | `<leader><Tab>d` | — | Close tab |
| Core | `<leader><Tab>n` | — | Next tab |
| Core | `<leader><Tab>p` | — | Previous tab |
| Core | `x` (visual) | — | Delete without yank |
| Core | `dd` | — | Smart dd: blank line → blackhole, else normal dd |
| Core | `Y` | `y$` | Yank to end of line |
| Core | `n` / `N` | — | Next/prev search with zzzv |
| Core | `gj` | — | Join line below |
| Core | `<` / `>` (v) | — | Indent less/more (stay in visual) |
| Core | `<C-e>` / `<C-y>` | — | Scroll down / 3 lines up |
| Core | `Q` | — | Disabled |
| Core | `<leader><leader>` | — | Last buffer |
| Core | `<leader>bn` | — | New file |
| Core | `<leader>bq` | — | Quit file |
| Core | `<leader>bo` | — | Close other buffers |
| Core | `<leader>bw` / `bW` | — | Write / write all |
| Core | `<leader>bQ` | — | Quit nvim |
| Core | `<leader>fn` | — | Noice (notification history) |
| Core | `<leader>1`/`2`/`3` (diff) | — | Diffget LOCAL/BASE/REMOTE |
| Core | `<leader>lj` / `lJ` | — | JSON format / compact |
| Core | `<leader>lf` | — | LSP format |
| Core | `<F10>` / `<F11>` | — | Toggle conceallevel / concealcursor |
| Core | `<C-M-k>` / `j` / `h` / `l` | TmuxResize* | Tmux resize panes |
| Core | `<leader>c,` / `c;` | — | Add `,` / `;` to end of line |
| Core | `<leader>cn` / `cN` | — | Replace next occurrence / backwards |
| Core | `<leader>oc` | — | Open Chrome DevTools + open file:line |
| Core | `cedit` | — | Set to `<C-y>` |
| Core | `<leader>l` | (del) | Removed (was LSP) |
| Core | `<C-a>` / `<C-e>` / `<C-f>` / `<C-b>` (i) | — | Home / End / Right / Left |
| Core | `<M-k>` / `<M-j>` (c) | — | Up / Down in cmdline |
| Core | `<C-f>` / `<C-a>` / `<C-b>` / `<M-b>` (c) | — | Cmdline motion |
| Core | `w!!` (c) | — | sudo tee % |
| Core | `<C-M-J>` / `K` / `H` / `L` | — | Resize window |
| Core | `<M-Y>` / `<M-y>` / `<M-p>` | — | Yank whole/line to system, Paste (n,i,v) |
| Core | `<M-d>` / `<M-s>` / `<M-Q>` / `<M-q>` | — | Command / Save / Exit all / Quit |
| Core | `q` (t) | — | Quit gracefully in terminal |
| Core | `<M-j>` / `<M-k>` / `<M-x>` | — | Prev/next buffer, delete buffer |
| Core | `<M-g>` / `<M-r>` | — | Grep (cwd), Resume last picker |
| Core | `<leader>fM` | — | Man pages (snacks picker) |
| Core | `<RightMouse>` | — | Right-click: go to pos + yank inner quote to + |
| Core | `\ct` | — | Trim trailing whitespace |
| Core | `\G` / `\O` / `\X` / `\h` / `\H` | — | Glyph / CursorLine / TSContext / TSHighlight / Hipatterns |
| Core | `\m` / `\Z` / `\T` / `\C` / `\w` | — | MiniMap / Zoom / Trailspace / CursorWord / Wrap |
| Core | `\c` / `\f` / `\V` / `\d` / `\L` / `\l` | — | Conceal / cmdheight / verbose / diagnostic / LSP / numbers |
| **blink.cmp** | | | |
| blink.cmp | `<C-y>` | ✓ | Select and accept completion |
| blink.cmp | `<Tab>` / `<S-Tab>` | snippet_forward/backward | Accept, snippet, or fallback |
| blink.cmp | `<CR>` | — | Accept or fallback |
| blink.cmp | `<C-l>` / `<C-h>` | — | Snippet forward/backward |
| blink.cmp | `<Up>` / `<Down>` / `<C-p>` / `<C-n>` | — | Select prev/next |
| blink.cmp | `<C-b>` / `<C-f>` | — | Scroll documentation |
| blink.cmp | `<C-space>` / `<C-e>` | — | Show/cycle docs, hide |
| **snacks.nvim** | | | |
| snacks.nvim | `<leader>fg` | — | Grep (with toggles) |
| snacks.nvim | `<leader>*` | — | Grep word under cursor |
| snacks.nvim | `<leader>fc` | — | Command history |
| snacks.nvim | `<leader>n` | — | Notification history |
| snacks.nvim | `<M-o>` / `<M-r>` | — | Old files / Recent files |
| snacks.nvim | `<leader>fb` | — | Buffers |
| snacks.nvim | `<leader>fs` | — | Git status |
| snacks.nvim | `<leader>fh` / `fH` / `fi` | — | Help / Highlights / Icons |
| snacks.nvim | `<leader>fr` / `fu` | — | Resume / Undo history |
| snacks.nvim | `<leader>ff` | — | LSP symbols (Function, Method, Field) |
| snacks.nvim | `<leader>.` / `<leader>S` | — | Scratch buffer / Select scratch |
| snacks.nvim | `<leader>bd` / `<leader>fR` | — | Bufdelete / Rename file |
| snacks.nvim | `]]` / `[[` | — | Next/prev reference (n,t) |
| **fff.nvim** | | | |
| fff.nvim | `<C-p>` | — | Project files |
| fff.nvim | `<M-f>` | — | Find files (fff picker) |
| **trouble.nvim** | | | |
| trouble.nvim | `<leader>xd` | — | Document diagnostics |
| trouble.nvim | `<leader>xl` | — | Loclist |
| trouble.nvim | `<leader>xq` | — | Quickfix |
| trouble.nvim | `<leader>xr` | — | LSP references |
| trouble.nvim | `<c-t>` (in snacks picker) | — | Open Trouble from picker |
| **gitsigns.nvim** | | | |
| gitsigns.nvim | `]h` / `[h` | — | Next/prev git hunk |
| gitsigns.nvim | `<leader>hs` / `hr` | — | Stage / Reset hunk (n,v) |
| gitsigns.nvim | `<leader>hS` / `hu` / `hR` | — | Stage buffer / Undo stage / Reset buffer |
| gitsigns.nvim | `<leader>hp` / `hb` / `hg` | — | Preview hunk / Blame line / Toggle line blame |
| gitsigns.nvim | `<leader>hd` / `hD` / `ht` | — | Diff this / Diff ~ / Toggle deleted |
| gitsigns.nvim | `ih` (o,x) | — | Text object: hunk |
| **diffview.nvim** | | | |
| diffview.nvim | `<leader>gdo` | — | Diffview open |
| diffview.nvim | `<leader>gdf` | — | File history |
| diffview.nvim | `<leader>gdm` / `gdM` | — | Diff master / main |
| **nvim-dap** | | | |
| nvim-dap | `<leader>dB` / `db` | — | Breakpoint condition / Toggle breakpoint |
| nvim-dap | `<leader>dc` / `da` / `dC` | — | Continue / Run with args / Run to cursor |
| nvim-dap | `<leader>dg` / `di` / `dj` / `dk` | — | Go to line / Step into / Down / Up |
| nvim-dap | `<leader>dl` / `do` / `dO` / `dp` | — | Run last / Step over / Step out / Pause |
| nvim-dap | `<leader>dr` / `ds` / `dT` / `dw` | — | REPL / Session / Terminate / Widgets |
| nvim-dap-ui | `<leader>du` / `de` | — | Toggle DAP UI / Eval (n,v) |
| dap-go | `<leader>dt` | — | Debug test |
| **nvim-lspconfig** | | | |
| lspconfig | `<leader>lr` | — | LspRestart all |
| lspconfig | `<leader>le` | — | Restart eslint_d |
| **glance.nvim** | | | |
| glance.nvim | `gd` | LSP | Glance definitions |
| glance.nvim | `gr` | LSP | Glance references |
| glance.nvim | `gY` | — | Glance type definitions |
| glance.nvim | `gi` | — | Glance implementations |
| **LSP (handlers)** | | | |
| LSP | `gD` | — | Declaration |
| LSP | `gh` / `gH` | — | Hover / Signature help |
| LSP | `ge` | — | Diagnostic float |
| LSP | `[d` / `]d` / `[e` / `]e` | — | Next/prev diagnostic / error |
| LSP | `<leader>lh` | — | Toggle inlay hints |
| **which-key.nvim** | — | — | Groups only (no keymaps) |
| **grapple.nvim** | | | |
| grapple.nvim | `<leader>fm` | — | Toggle tag |
| grapple.nvim | `<leader>fo` | — | Open tags |
| **neotest** | — | (enabled=false) | — |
| **noice.nvim** | | | |
| noice.nvim | `<Esc>` | — | RemoveNotiAndHl (nohl + dismiss) |
| noice.nvim | `<C-d>` / `<C-u>` (i,n) | — | Scroll LSP doc forward/back (expr) |
| **ssr.nvim** | | | |
| ssr.nvim | `<leader>cr` | — | Find and replace with treesitter (n,x) |
| **octo.nvim** | | | |
| octo.nvim | (many) | — | Issue/PR/Review mappings (see plugin; `<leader>o*`, `<space>o*`) |
| **smart-open.nvim** | (enabled=false) | `<C-p>` | Project files |
| **inc-rename.nvim** | | | |
| inc-rename.nvim | `gR` | — | IncRename (expr) |
| **genghis** | | | |
| genghis | `<leader>yp` / `yn` / `yx` | — | Copy path / filename / Move selection to new file |
| **gitlinker.nvim** | | | |
| gitlinker.nvim | `<leader>gym` / `gyb` / `gyc` | — | Copy line URL (main/current/commit) (n,v) |
| gitlinker.nvim | `<leader>gB` | — | GitHub blame (main) (n,v) |
| **gh-blame.nvim** | | | |
| gh-blame.nvim | `<leader>gg` | — | GhBlameCurrentLine |
| **gh-addressed.nvim** | | | |
| gh-addressed.nvim | `<leader>gc` | — | GhReviewComments |
| **grug-far.nvim** | | | |
| grug-far.nvim | `<leader>cR` | — | Find and replace globally (n,x) |
| **conform.nvim** | | | |
| conform.nvim | `<leader>lF` | — | Toggle auto formatting |
| **blame.nvim** | | | |
| blame.nvim | `<leader>gb` | — | BlameToggle |
| **treewalker.nvim** | | | |
| treewalker.nvim | `H` / `J` / `K` / `L` | — | Treewalker Up/Right/Left/Down (n,o) |
| **tree-climber.nvim** | (enabled=false) | K/L/H/J | Goto parent/next/prev/child |
| **treesj** | | | |
| treesj | `<space>cb` | — | Split/join block |
| **substitute.nvim** | | | |
| substitute.nvim | `<CR>` (n) | — | Substitute iw |
| substitute.nvim | `<leader>p` / `pp` / `P` | — | Substitute op/line/eol (n,x) |
| substitute.nvim | `<CR>` (x) | — | Substitute (visual) |
| **maximize.nvim** | | | |
| maximize.nvim | `<leader>bz` | — | Maximize buffer |
| **nvim-recorder** | | | |
| nvim-recorder | `qq` / `Q` / `!!` / `cq` | — | Start/stop recording, Play, Breakpoint, Edit |
| **vim-test** | | | |
| vim-test | `<leader>tn` / `tt` / `tf` / `tr` | — | Test nearest / suite / file / last |
| **tmux-resizer** | | | |
| tmux-resizer | (from keymaps.lua) | — | <C-M-j/k/h/l> resize |
| **mini.files** | | | |
| mini.files | `<leader>e` | — | Toggle mini.files at current file |
| mini.files | `<leader>bw` (in mini.files) | — | Synchronize |
| **visual-surround.nvim** | | | |
| visual-surround | `sc` / `sp` / `sb` / `st` / `sq` / `ss` (v) | — | Surround with {} / () / [] / ` / " / ' |
| **toggle.nvim** | | | |
| toggle.nvim | `<leader>u*` | — | Toggle option prefix; `<leader>us` status dashboard |
| **venv-selector** | | | |
| venv-selector | `<leader>cv` | — | VenvSelect |
| **kulala.nvim** | | | |
| kulala.nvim | `<leader>Rs` / `Ra` / `Rb` / `Ro` | — | Send request / all / Scratchpad / Open Kulala |
| **gx.nvim** | | | |
| gx.nvim | `gx` | netrw gx | Browse URL (n,x) |
| **qmk.nvim** | — | — | No keymaps (ft=keymap, layout only) |

## Leader and prefix

- Leader: `<space>` (from options)
- Second prefix: `\` (backslash) for toggles and utilities

## Modes

- **n** = normal, **i** = insert, **v** = visual, **x** = visual line/block, **c** = command-line, **t** = terminal
- Unlisted mode = normal unless stated in plugin.
