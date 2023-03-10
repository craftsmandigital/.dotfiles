
lvim.builtin.which_key.mappings["t"] = {
  name = "+MyStuff",

  f = {"<cmd>Telescope find_files cwd=.<cr>", "Files in current folder" },
  t = {"<cmd>Telescope zoxide list<cr>", "Change folder with zoxide" },
}
