return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = { enabled = true },
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = {
            ".DS_STORE",
            "node_modules",
            "thumbs.db",
          },
          never_show = {
            ".git",
            "site-packages",
          },
        },
      },
    },
  },
}
