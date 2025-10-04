return {
  "neovim/nvim-lspconfig",
  config = function()
    -- specific overrides for configs
    vim.lsp.config.clangd = {
      cmd = {
        "clangd",
        "--query-driver=" .. vim.env.HOME .. "/gcc-arm-none-eabi/bin/arm-none-eabi-*",
      }
    }
    vim.lsp.enable({
      'clangd',
      'rust_analyzer',
      'basedpyright',
    })
  end
}
