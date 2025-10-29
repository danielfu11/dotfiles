return {
  "neovim/nvim-lspconfig",
  config = function()
    -- specific overrides for configs
    vim.lsp.config.clangd = {
      cmd = {
        "clangd",
        "--query-driver=**"
      }
    }
    vim.lsp.enable({
      'clangd',
      'rust_analyzer',
      'basedpyright',
    })
  end
}
