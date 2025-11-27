return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      }
    }
  },
  config = function()
    -- specific overrides for configs
    vim.lsp.config.clangd = {
      cmd = {
        "clangd",
        "--query-driver=**",
        "--header-insertion=never",
      }
    }
    vim.lsp.config('rust_analyzer', {})
    vim.lsp.config('basedpyright', {})
    vim.lsp.config('lua_ls', {})
    vim.lsp.enable({
      'clangd',
      'rust_analyzer',
      'basedpyright',
      'lua_ls',
    })
  end
}
