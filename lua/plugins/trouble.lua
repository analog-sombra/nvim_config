local prefix = "<leader>x"
return {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
        { prefix, desc = "Trouble"},
    },
    opts = {
        use_diagnostic_signs = true,
        action_keys = {
            close = { "q", "<esc>" },
            cancel = "<c-e>"
        }
    }
}
