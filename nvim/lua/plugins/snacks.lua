return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
 ██████╗  █████╗  ██████╗ 
██╔═══██╗██╔══██╗██╔═══██╗
██║   ██║███████║██║   ██║
██║▄▄ ██║██╔══██║██║▄▄ ██║
╚██████╔╝██║  ██║╚██████╔╝
 ╚══▀▀═╝ ╚═╝  ╚═╝ ╚══▀▀═╝ 
      ]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = vim.fn.isdirectory(".git") == 1,
          cmd = "hub status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },
}
