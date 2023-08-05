-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])


-- use a protected call so we don't error out on first use 
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)


    -- recommanded plugins
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- colorscheme
    use { "catppuccin/nvim", as = "catppuccin" }


    -- auto pair plugin
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }

    use { 'nvim-treesitter/nvim-treesitter'}


    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)