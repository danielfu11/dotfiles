return {
  {
    "Mofiqul/dracula.nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
      })
      vim.cmd.colorscheme("catppuccin")
      vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#a5adcb", bg = "#1e2030" })
    end,
  },
}
