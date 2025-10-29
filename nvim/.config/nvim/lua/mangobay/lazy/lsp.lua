return {
  "neovim/nvim-lspconfig",
  config = function()
    -- specific overrides for configs
    vim.lsp.config.clangd = {
      cmd = {
        "clangd",
        "--query-driver=**",
        "--header-insertion=never",
      }
    }
    vim.lsp.enable({
      'clangd',
      'rust_analyzer',
      'basedpyright',
    })
  end
}
