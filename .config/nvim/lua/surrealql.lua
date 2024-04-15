local M = {}

local find_rust_bin = function()
  return '/Users/cellanhall/developer/surrealql-lsp/target/debug/surrealql-lsp-server'
end

M.start = function()
  vim.lsp.set_log_level 'debug'
  require('vim.lsp.log').set_format_func(vim.inspect)

  local client = vim.lsp.start {
    name = 'surrealql-lsp-server',
    cmd = { find_rust_bin() },
  }

  if not client then
    vim.notify('Failed to start surrealql-lsp-server', vim.log.levels.ERROR)
    return
  end

  vim.lsp.buf_attach_client(0, client)
end

local group = vim.api.nvim_create_namespace 'surrealql-lsp-server'

M.setup = function()
  vim.api.nvim_clear_autocmds { group = group }

  vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = 'surql',
    callback = M.start,
  })
end

return M
