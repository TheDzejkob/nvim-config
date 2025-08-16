return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Lua LSP
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    -- C/C++ LSP
    lspconfig.clangd.setup({
      capabilities = capabilities,
    })

    -- Omnisharp LSP
    lspconfig.omnisharp.setup({
      cmd = { "/home/dzejkob/Documents" },
      enable_editorconfig_support = true,
      enable_ms_build_load_projects_on_demand = false,
      enable_roslyn_analyzers = false,
      organize_imports_on_format = false,
      enable_import_completion = false,
      sdk_include_prereleases = true,
      analyze_open_documents_only = false,
    })

    -- Autocmds for all LSPs
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
      end,
    })
  end
}

