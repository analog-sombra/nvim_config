-- return {
--     "RRethy/vim-illuminate",
--     config = function()
--         require("illuminate").configure{}
--
--         -- change the highlight style
--         vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
--         vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
--         vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
--
--         --- auto update the highlight style on colorscheme change
--         vim.api.nvim_create_autocmd({ "ColorScheme" }, {
--             pattern = { "*" },
--             callback = function(ev)
--                 vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
--                 vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
--                 vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
--             end
--         })
--     end,
-- }
return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
            providers = { "lsp" },
        },
    },
    config = function(_, opts)
        require("illuminate").configure(opts)

        local function map(key, dir, buffer)
            vim.keymap.set("n", key, function()
                require("illuminate")["goto_" .. dir .. "_reference"](false)
            end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
        end

        map("]]", "next")
        map("[[", "prev")

        -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                local buffer = vim.api.nvim_get_current_buf()
                map("]]", "next", buffer)
                map("[[", "prev", buffer)
            end,
        })

        vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
    end,
    keys = {
        { "]]", desc = "Next Reference" },
        { "[[", desc = "Prev Reference" },
    },
}

