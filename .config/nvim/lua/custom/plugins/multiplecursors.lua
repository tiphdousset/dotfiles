-- return { "mg979/vim-visual-multi" }

-- return
--   {
--     "terryma/vim-multiple-cursors",
--     keys = {
--       { "<c-n>", desc = "multiple cursors on current word" },
--     },
--     config = function()
--       vim.g.multi_cursor_exit_from_visual_mode = 0
--       vim.g.multi_cursor_exit_from_insert_mode = 0
--     end,
--   }

return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    vim.g.VM_leader = "<space>"
  end,
  keys = {
    { "<C-n>", mode = { "n", "v" } },
    { "<space><space>", mode = { "n", "v" } },
    "<C-Down>",
    "<C-Up>",
  },
}
