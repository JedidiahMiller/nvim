return {
    -- Generic highlighting support
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        ensure_installed = "all",
        highlight = { enable = true },
        indent = { enable = true },
    },

    -- Handles standalone stuff
    {
        "mason-org/mason.nvim",
        opts = {
        ensure_installed = {
            "rust_analyzer",
            "tsserver",
            "html",
            "cssls",
            "tailwindcss",
            "clangd",
            "phpactor",
            "pyright",
        },
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {"prettier", "eslint", "phpcs"},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        },
        config = function()
        local cmp = require("cmp")
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
            },
        })
        end,
    },
}