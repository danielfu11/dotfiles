return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>ff", function() require("fzf-lua").files() end,     desc = "Find files" },
      { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live grep" },
      { "<leader>fb", function() require("fzf-lua").buffers() end,   desc = "Buffers" },
      { "<leader>fr", function() require("fzf-lua").resume() end,    desc = "Resume last picker" },
    },
    opts = {},
    config = function()
      require('fzf-lua').setup {
        grep = {
          hidden = true,
        }
      }
    end
  },
}
