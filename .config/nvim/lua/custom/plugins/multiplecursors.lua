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

-- return {
--   "mg979/vim-visual-multi",
--   branch = "master",
--   init = function()
--     vim.g.VM_leader = "<space>"
--   end,
--   keys = {
--     { "<C-n>", mode = { "n", "v" } },
--     { "<space><space>", mode = { "n", "v" } },
--     "<C-Down>",
--     "<C-Up>",
--   },
-- }

return {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {}, -- This causes the plugin setup function to be called
    keys = {
      {
        "<C-Up>",
        "<Cmd>MultipleCursorsAddUp<CR>",
        mode = { "n", "i", "x" },
        desc = "Add cursor and move up",
      },
      {
        "<C-Down>",
        "<Cmd>MultipleCursorsAddDown<CR>",
        mode = { "n", "i", "x" },
        desc = "Add cursor and move down",
      },
      {
        "<C-LeftMouse>",
        "<Cmd>MultipleCursorsMouseAddDelete<CR>",
        mode = { "n", "i" },
        desc = "Add or remove cursor",
      },

      {
        "<C-n>",
        "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
        mode = { "n", "x" },
        desc = "Add cursor and jump to next cword",
      },
      {
        "<C-x>",
        "<Cmd>MultipleCursorsJumpNextMatch<CR>",
        mode = { "n", "x" },
        desc = "Jump to next cword",
      },
    },
  }
