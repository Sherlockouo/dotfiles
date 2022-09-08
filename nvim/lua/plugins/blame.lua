return {
  {
    "f-person/git-blame.nvim",
    config = function()
      require("blame").setup()
    end,
  },
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup({
        date_format = "%Y.%m.%d %H:%M:%S",
      })
    end,
  },
}
