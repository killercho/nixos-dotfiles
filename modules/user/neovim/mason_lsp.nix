{
  mason_config = ''
    -- Mason settings
    require("mason").setup({
        PATH = "append",
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
    })
    require("mason-lspconfig").setup()
    require("mason-tool-installer").setup {
      ensure_installed = {
        -- LSPs
        "lua_ls",
        "clangd",
        -- "cmake", -- Disabled because python3 fails to install it
        -- "nil_ls",
        "pyright",
        -- "bashls",
        -- "ltex-ls", -- Disabled because the text files are sometimes too big and its not worth it

        -- Linters
        "cpplint",
        "pylint",
        -- "shellcheck",

        -- Formatters
        -- "clang-format",
        -- "doctoc",
        "black",
        -- "shfmt",
        -- "nixpkgs-fmt",
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 0,
      debounce_hours = 0, -- at least 0 hours between attempts to install/update
      integrations = {
        ["mason-lspconfig"] = true,
        ["mason-null-ls"] = false,
        ["mason-nvim-dap"] = false,
      }
    }
  '';

  lsps_and_saga_config = ''
    -- After setting up mason-lspconfig servers via lspconfig may be set
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require'lspconfig'.lua_ls.setup{
      capabilities = capabilities
    }
    -- require'lspconfig'.ltex.setup{
    --   capabilities = capabilities
    -- }
    require'lspconfig'.clangd.setup{
      capabilities = capabilities,
      cmd = { "clangd", "--compile-commands-dir=~/ --background-index" },
      on_attach = on_attach,
    }
    require'lspconfig'.cmake.setup{
      capabilities = capabilities
    }
    --require'lspconfig'.nil_ls.setup{
      --capabilities = capabilities
    --}
    --require'lspconfig'.pyright.setup{
      --capabilities = capabilities
    --}
    --require'lspconfig'.bashls.setup{
      --capabilities = capabilities
    --}

    -- DAP and its UI setup
    --require("dapui").setup()

    -- Linter setup
    require('lint').linters_by_ft = {
      -- Setup linters by filetype
      cpp = {'cpplint',},
      c = {'cpplint',},
      -- nix = {'nix',},
      --py = {'pylint',},
      --sh = {'shellcheck',},
    }
    -- Setup to trigger linting automatically
    -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    --   callback = function()

    --     -- try_lint without arguments runs the linters defined in `linters_by_ft`
    --     -- for the current filetype
    --     require("lint").try_lint()

    --     -- You can call `try_lint` with a linter name or a list of names to always
    --     -- run specific linters, independent of the `linters_by_ft` configuration
    --     -- require("lint").try_lint("cspell")
    --   end,
    -- })

    -- Lspsaga configuration
    require('lspsaga').setup({
      finder = {
        keys = {
          shuttle = ' ' -- Move bettween the preview and list windows
        }
      },
    })
    vim.lsp.set_log_level("off");
  '';
}
