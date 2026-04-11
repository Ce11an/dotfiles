return {
  settings = {
    yaml = {
      schemaStore = { enable = false, url = '' },
      schemas = function()
        return require('schemastore').yaml.schemas()
      end,
      validate = { enable = true },
    },
  },
}
