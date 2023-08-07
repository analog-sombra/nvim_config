return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
        local icons = require("lazyvim.config").icons
        local Util = require("lazyvim.util")

        return {
            options = {
                theme = "auto",
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
                always_divide_middle = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = {
                    {
                        "diagnostics",
                        symbols = {
                            error = icons.diagnostics.Error,
                            warn = icons.diagnostics.Warn,
                            info = icons.diagnostics.Info,
                            hint = icons.diagnostics.Hint,
                        },
                    },
                    { "filetype", padding = { left = 1, right = 1 } },
                    { "encoding", padding = { left = 1, right = 1 } },
                    { "fileformat", padding = { left = 1, right = 1 } },
                    { "filename", },
                },
                lualine_x = {
                    -- stylua: ignore
                    {
                        function() return require("noice").api.status.command.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                        color = Util.fg("Statement"),
                    },
                    -- stylua: ignore
                    {
                        function() return require("noice").api.status.mode.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                        color = Util.fg("Constant"),
                    },
                    -- stylua: ignore
                    {
                        function() return "  " .. require("dap").status() end,
                        cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
                        color = Util.fg("Debug"),
                    },
                    { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = Util.fg("Special") },
                    {
                        "diff",
                        symbols = {
                            added = icons.git.added,
                            modified = icons.git.modified,
                            removed = icons.git.removed,
                        },
                    },
                },
                lualine_y = {
                    { "progress", separator = " ", padding = { left = 1, right = 0 } },
                    { "location", padding = { left = 0, right = 1 } },
                },
                lualine_z = {
                    function()
                        return " " .. os.date("%R")
                    end,
                },
            },
            extensions = { "neo-tree", "lazy" },
        }
    end,
}

