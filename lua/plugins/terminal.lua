return {
    -- amongst your other plugins
    {'akinsho/toggleterm.nvim',
        config = function ()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<c-\>]],
                hide_number = false,
                shade_filetype = {},
                shade_terminals = true,
                direction = "float",
                autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
                highlights = {
                    NormalFloat = {
                        link = 'Normal'
                    },
                },
                start_in_insert = true,
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
                terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
                persist_size = true,
                persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
                close_on_exit = true, -- close the terminal window when the process exits
                -- Change the default shell. Can be a string or a function returning a string
                shell = vim.o.shell,
                auto_scroll = true, -- automatically scroll to the bottom on terminal output
                -- This field is only relevant if direction is set to 'float'
                float_opts = {
                    border = "curved",
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
                winbar = {
                    enabled = false,
                    name_formatter = function(term) --  term: Terminal
                        return term.name
                    end
                },
            })
            function _G.set_terminal_keymaps()
                local opts = {buffer = 0}
                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            end

        end
    }
}
