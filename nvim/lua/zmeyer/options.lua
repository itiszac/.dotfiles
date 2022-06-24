-- :help options
local options = {
  backup = false, 						                          -- creates a backup file
  clipboard = "unnamedplus",   				                  -- allows neovim to access the system clipboard
  cmdheight = 2,   						                          -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect", "noinsert" },  -- mostly just for cmp
  conceallevel = 0, 					                          -- `` is visible in markdown files
  fileencoding = "utf-8", 					                    -- encoding written to file
  hlsearch = true,						                          -- highlight all matches on previous search pattern
  incsearch = true, 					                          -- show matches for partial searches
  ignorecase = true,					                          -- ignore case in search patterns
  mouse = "a",						                              -- allows mouse to be used
  pumheight = 10, 						                          -- pop-up menu height
  showmode = true,						                          -- shows the various modes -- INSERT -- VISUAL -- etc
  showtabline = 2,						                          -- always show tabs
  smartcase = true, 					                          -- smart case
  smartindent = true, 					                        -- indenting
  splitbelow = true,					                          -- force all horizontal splits to go below current window
  splitright = true,					                          -- force all vertical splits to go to the right of current window
  swapfile = false, 					                          -- create a swapfile
  timeoutlen = 1000,   					                        -- time to wait for a mapped sequence to complete (ms)
  undofile = true,						                          -- enables persistent undo
  updatetime = 300, 					                          -- faster completion (default: 4000ms)
  writebackup = false,   					                      -- if a file is being edited by another program (or was written to file while editing with another program), it is not saved
  expandtab = true, 					                          -- convert tabs to spaces
  shiftwidth = 2, 						                          -- the number of spaces inserted for each indentation
  tabstop = 2,   						                            -- 2 spaces for tab
  cursorline = false, 				                          -- highlight current line
  number = true,						                            -- set numbered lines
  relativenumber = true,					                      -- set relative numbered lines
  numberwidth = 4,   					                          -- set number column width to 2 (default: 4)
  signcolumn = "yes", 					                        -- always show the sign column, otherwise it will shift the text
  wrap = false, 						                            -- display lines as one long time
  scrolloff = 8,						                            -- 
  sidescrolloff = 8,					                          -- 
  hidden = true,						                            -- 
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
