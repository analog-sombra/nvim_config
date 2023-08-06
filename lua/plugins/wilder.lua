return {
    'gelguy/wilder.nvim',
    config = function()
        local wilder = require("wilder")
        wilder.setup({modes = {":","/","?"}})
        wilder.set_option('renderer', wilder.popupmenu_renderer(
            wilder.popupmenu_palette_theme({
                max_height = "65%",
                min_hight = 0,
                max_width = "55%",
                prompt_position = 'top',
                reverse = 0,
                highlights = {
                    border = 'Normal', -- highlight to use for the border
                },
                -- 'single', 'double', 'rounded' or 'solid'
                -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
                border = 'rounded',
            })
        ))
    end,
}
