return {
  -- { "ellisonleao/gruvbox.nvim" },
  { "f-person/git-blame.nvim" },
  { "hashivim/vim-terraform" },
  { "norcalli/nvim-colorizer.lua" },
  { "numToStr/Navigator.nvim" },
  { "vimwiki/vimwiki", cmd = { "VimwikiDiaryIndex", "VimwikiIndex" } },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  -- { "niuiic/divider.nvim" },
  -- { "s1n7ax/nvim-search-and-replace" },
}
