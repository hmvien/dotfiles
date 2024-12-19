return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- Default search from cwd is more intuitive
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>fF", LazyVim.pick("files", { root = true }), desc = "Find Files (root)" },
    },
  },
}
