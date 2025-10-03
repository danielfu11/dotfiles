return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config("*", {})
    vim.lsp.enable({
      'clangd',
      'rust_analyzer',
      'basedpyright',
    })
  end
}
