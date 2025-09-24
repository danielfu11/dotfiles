return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false, -- Show hidden files (dotfiles)
      },
      view = {
        adaptive_size = true,
      },
      renderer = {
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = true,
            git = true,
          },
        },
      },
    })
  end,
}
