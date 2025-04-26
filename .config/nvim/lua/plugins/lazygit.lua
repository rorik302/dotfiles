return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile"
  },
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  keys = {
    { "<leader>gl", ":LazyGit<CR>", desc = "Git: LazyGit" }
  }
}
