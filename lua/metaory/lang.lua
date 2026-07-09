local M = {}

local stacks = {
  prettier = { "typescript", "typescriptreact", "javascript", "javascriptreact", "html", "css", "postcss", "markdown", "astro", "mdx", "json", "yaml" },
  vtsls = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  emmet = { "html", "css", "javascriptreact", "typescriptreact" },
}

local langs = {
  lua = { parser = "lua", lsp = "lua_ls", format = { "stylua" }, lsp_format = false },
  go = { parser = "go", lsp = "gopls", format = { "golangci-lint" } },
  python = { parser = "python", lsp = "pyright", format = { "black" } },
  nix = { parser = "nix", format = { "nixfmt" } },
  dockerfile = { parser = "dockerfile", lsp = "dockerls" },
  http = { parser = "http", lsp = "kulala_ls" },
  astro = { parser = "astro", lsp = "astro" },
  bash = { parser = "bash", lsp = "bashls" },
  typescriptreact = { parser = "tsx" },
  javascriptreact = { parser = "javascript" },
  mdx = { parser = "markdown" },
  postcss = { parser = "css" },
  jsonc = { parser = "jsonc" },
  c = { parser = "c" },
  java = { parser = "java" },
  graphql = { parser = "graphql" },
  ruby = { parser = "ruby" },
  scss = { parser = "scss" },
  regex = { parser = "regex" },
  ninja = { parser = "ninja" },
  rst = { parser = "rst" },
  toml = { parser = "toml" },
}

local servers = {
  { name = "harper_ls", config = { filetypes = { "markdown" } } },
  { name = "tailwindcss" },
  { name = "oxlint", on_save = "LspOxlintFixAll" },
  { name = "jsonls" },
  { name = "yamlls" },
  { name = "html" },
  { name = "gopls", on_save = "go_organize_imports" },
  { name = "prismals", enabled = false },
  { name = "helm_ls", enabled = false },
  { name = "denols", enabled = false },
}

local essentials = { "vim", "vimdoc", "query" }

local function merge(ft, patch)
  langs[ft] = vim.tbl_deep_extend("force", langs[ft] or {}, patch)
end

for _, ft in ipairs(stacks.prettier) do
  merge(ft, { format = { "prettier" }, parser = langs[ft] and langs[ft].parser or ft })
end

for _, ft in ipairs(stacks.vtsls) do
  merge(ft, { lsp = "vtsls" })
end

local function go_organize_imports(_, bufnr)
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      local params = vim.lsp.util.make_range_params(nil, "utf-16")
      ---@diagnostic disable-next-line: inject-field
      params.context = { only = { "source.organizeImports" } }
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
      for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
          elseif r.command then
            vim.lsp.buf.execute_command(r.command)
          end
        end
      end
    end,
  })
end

local on_save = {
  LspOxlintFixAll = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspOxlintFixAll",
    })
  end,
  go_organize_imports = go_organize_imports,
}

function M.formatters_by_ft()
  local map = {}
  for ft, lang in pairs(langs) do
    if lang.format then
      map[ft] = lang.format
    end
  end
  return map
end

function M.fts_with_format()
  return vim.tbl_keys(M.formatters_by_ft())
end

function M.fts_with_lsp()
  local fts = {}
  for ft, lang in pairs(langs) do
    if lang.lsp then
      table.insert(fts, ft)
    end
  end
  return fts
end

function M.fts_emmet()
  return stacks.emmet
end

function M.treesitter_parsers()
  local seen, list = {}, {}
  local function add(parser)
    if parser and not seen[parser] then
      seen[parser] = true
      list[#list + 1] = parser
    end
  end
  for _, parser in ipairs(essentials) do
    add(parser)
  end
  for _, lang in pairs(langs) do
    add(lang.parser)
  end
  table.sort(list)
  return list
end

function M.lsp_servers()
  local by_name = {}
  for _, server in ipairs(servers) do
    if server.enabled ~= false then
      by_name[server.name] = vim.deepcopy(server)
    end
  end
  for _, lang in pairs(langs) do
    if lang.lsp then
      by_name[lang.lsp] = by_name[lang.lsp] or { name = lang.lsp }
    end
  end
  local list = vim.tbl_values(by_name)
  table.sort(list, function(a, b)
    return a.name < b.name
  end)
  return list
end

function M.lsp_no_format()
  local map = {}
  for _, lang in pairs(langs) do
    if lang.lsp and lang.lsp_format == false then
      map[lang.lsp] = true
    end
  end
  return map
end

function M.server_hooks()
  local hooks = {}
  for _, server in ipairs(servers) do
    if server.on_save and on_save[server.on_save] then
      hooks[server.name] = on_save[server.on_save]
    end
  end
  return hooks
end

return M
