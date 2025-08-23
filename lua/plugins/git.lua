return {
    -- Git status in files
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add          = { text = "+" },
                change       = { text = "~" },
                delete       = { text = "_" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
            },
            current_line_blame = false, -- inline blame
        },
    },
}