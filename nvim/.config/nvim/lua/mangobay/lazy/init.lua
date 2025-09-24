-- For now, having all plugins defined here
-- Hopefully I won't use too many plugins but if that ever becomes the case I'll split them up
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
}
