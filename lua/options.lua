local options = {

	-- number settings
	number = true,
	relativenumber = true,
    ruler = true,
    numberwidth = 2,

	-- tab settings
	expandtab = true,
	showtabline = 4,
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,

	-- indent settings
	smartindent = true,
    autoindent = true,


    -- search settings
    hlsearch = true,
    incsearch = true,


    


	showmode = true,
	cmdheight = 1,
    signcolumn = "yes",
    wrap = true,
    linebreak = true,
    scrolloff = 8,
    undofile = true,
    smartcase = true,
    
    swapfile = false,
    backup = false,
    writebackup = false,
    termguicolors = true,



    -- split window
    splitbelow = true,
    splitright = true,


    -- highlights
    cursorline = true,
    cursorcolumn = true,

}


for k, v in pairs(options) do
	vim.opt[k] = v
end
