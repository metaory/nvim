-- Install with: `brew install vscode-langservers-extracted`
return {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      -- schemas = {
      --   {
      --     fileMatch = { "omo.json", "omo.jsonc" },
      --     url = "https://raw.githubusercontent.com/code-yeongyu/oh-my-openagent/dev/assets/omo.schema.json",
      --   },
      --   unpack(require("schemastore").json.schemas()),
      -- },
      format = {
        enable = true,
      },
      validate = { enable = true },
    },
  },
}
