return {
    -- Treesitter for syntax highlighting and code parsing
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
        },
    },

    -- Mason: Package manager for LSP servers, linters, and formatters
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                -- LSP Servers
                "rust_analyzer",              -- Rust
                "vue-language-server",        -- Vue
                "typescript-language-server", -- TypeScript/JavaScript
                "html",                       -- HTML
                "cssls",                      -- CSS
                "tailwindcss",                -- Tailwind CSS
                "clangd",                     -- C/C++
                "phpactor",                   -- PHP
                "pyright",                    -- Python
                
                -- Linters
                "eslint",                     -- JavaScript/TypeScript
                "phpcs",                      -- PHP
                
                -- Formatters
                "prettier",                   -- JavaScript/TypeScript/CSS/HTML
                "rustfmt",                    -- Rust
                "black",                      -- Python
            },
        }
    },

    -- LSP Configuration (sets up the language servers)
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            
            -- Only install LSP servers here, not linters/formatters
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "rust_analyzer",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "clangd",
                    "phpactor",
                    "pyright",
                },
                automatic_installation = true,
            })
            
            -- Basic LSP keymaps
            local lsp = vim.lsp
            local opts = { buffer = 0, silent = true }
            
            vim.keymap.set('n', 'gd', lsp.buf.definition, opts)
            vim.keymap.set('n', 'gr', lsp.buf.references, opts)
            vim.keymap.set('n', 'K', lsp.buf.hover, opts)
            vim.keymap.set('n', '<leader>rn', lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', lsp.buf.code_action, opts)
        end,
    },

    -- Completion engine
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