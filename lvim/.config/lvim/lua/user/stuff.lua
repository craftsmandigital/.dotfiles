vim.api.nvim_set_keymap("i", "<C-j>", "<Cmd>call codeium#CycleCompletions(1)<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Cmd>call codeium#CycleCompletions(-1)<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("i", "<C-c>", "<Cmd>call codeium#Clear()<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("i", "<C-cr>", "<Cmd>call codeium#Complete()<CR>", { noremap = true })
-- lvim.builtin.which_key.mappings["a"] = {
--   name = "+AI Codeium",

--   j = {"<Cmd>call codeium#CycleCompletions(1)<CR>", "Next suggestion" },
--   k = {"<Cmd>call codeium#CycleCompletions(-1)<CR>", "Previous suggestion" },
--   c = {"<Cmd>call codeium#Clear()<CR>", "Clear current suggestion" },
--   m = {"<Cmd>call codeium#Complete()<CR>", "Manually trigger suggestion" },
-- }


lvim.builtin.which_key.mappings["t"] = {
  name = "+MyStuff",

  f = {"<cmd>Telescope find_files cwd=.<cr>", "Files in current folder" },
  t = {"<cmd>Telescope zoxide list<cr>", "Change folder with zoxide" },
}






