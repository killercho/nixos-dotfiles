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
        "cmake",
        "nil_ls",
        "pyright",
        "bashls",
        "ltex-ls",

        -- Linters
        "cpplint",
        "pylint",
        "shellcheck",

        -- Formatters
        "clang-format",
        "doctoc",
        "black",
        "shfmt",
        "nixpkgs-fmt",
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
    vim.lsp.config('lua_ls', {
      capabilities = capabilities
    })
    vim.lsp.enable('lua_ls')

    vim.lsp.config('ltex', {
      capabilities = capabilities
    })
    vim.lsp.enable('ltex')

    vim.lsp.config('clangd' ,{
      capabilities = capabilities,
      cmd = { "clangd", "--query-driver=/nix/store/*gcc-wrapper*/bin/g++" },
      on_attach = on_attach,
    })
    vim.lsp.enable('clangd')

    vim.lsp.config('cmake', {
      capabilities = capabilities
    })
    vim.lsp.enable('cmake')

    vim.lsp.config('nil_ls', {
      capabilities = capabilities
    })
    vim.lsp.enable('nil_ls')

    vim.lsp.config('pyright', {
      capabilities = capabilities
    })
    vim.lsp.enable('pyright')

    vim.lsp.config('bashls', {
      capabilities = capabilities
    })
    vim.lsp.enable('bashls')

    -- DAP and its UI setup
    require("dapui").setup()

    -- Linter setup
    require('lint').linters_by_ft = {
      -- Setup linters by filetype
      cpp = {'cpplint',},
      c = {'cpplint',},
      -- nix = {'nix',},
      py = {'pylint',},
      sh = {'shellcheck',},
    }
    -- Setup to trigger linting automatically
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()

        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()

        -- You can call `try_lint` with a linter name or a list of names to always
        -- run specific linters, independent of the `linters_by_ft` configuration
        -- require("lint").try_lint("cspell")
      end,
    })

    -- Lspsaga configuration
    require('lspsaga').setup({
      finder = {
        keys = {
          shuttle = ' ' -- Move bettween the preview and list windows
        }
      },
    })
  '';
}
