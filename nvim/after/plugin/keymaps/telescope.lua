local k = require("zmeyer.keymap")
local nnoremap = k.nnoremap

nnoremap("<C-p>", ":Telescope<CR>")

nnoremap("<leader>f", function()
  require("telescope.builtin").find_files()
end)

nnoremap("<leader>ps", function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For >")})
end)

nnoremap("<leader>pw", function()
  require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }
end)

nnoremap("<leader>pb", function()
  require("telescope.builtin").buffers()
end)
-- nnoremap("<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<cr>")
