# User neovim config
{ pkgs, ... }:

let
  lualine_config = (import ./lualine.nix).lualine_config;
  formatter_config = (import ./formatter.nix).formatter_config;
  completion_config = (import ./completion.nix).completion_config;
  mappings = (import ./mappings.nix).mappings;
  tokyonight_config = (import ./tokyonight.nix).tokyonight_config;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      # Treesitter plugin with all grammars
      nvim-treesitter
      nvim-treesitter.withAllGrammars

      # Theme customised with stylix colors
      tokyonight-nvim

      # Rainbow brackets plugin for better visualisation
      rainbow-delimiters-nvim

      # lualine - a replacement for airline
      lualine-nvim

      # NERDTree and it's plugins
      nerdtree
      nerdtree-git-plugin
      vim-devicons
      vim-nerdtree-syntax-highlight

      # A group of popular language packs with features for them
      polyglot

      # telescope related plugins
      telescope-nvim
      plenary-nvim
      telescope-fzf-native-nvim

      # Commenter plugin
      nerdcommenter

      # Plugin to remember the last place the cursor was
      nvim-lastplace

      # Package manager to install and manage LSP and DAP servers, linters and formatters
      mason-nvim

      # Third party plugins managed by mason:
      mason-tool-installer-nvim # Tool for automatic install of every Mason package
      nvim-lspconfig # Configs for Nvim LSPs
      mason-lspconfig-nvim # Bridge between mason and lspconfig # Bridge between mason and lspconfig
      nvim-dap # Debug client
      nvim-dap-ui # UI for the debugger
      nvim-lint # Lightweigth linter using the LSPs
      formatter-nvim # Formatter plugin
      # End of the plugins managed by mason

      # Plugin for hover/definitions/symbol search
      lspsaga-nvim

      # Completion and snippets plugins
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      UltiSnips
      cmp-nvim-ultisnips
    ];

    extraLuaConfig = ''
      vim.g.mapleader = ";"

      vim.opt.number = true;
      vim.opt.relativenumber = true;
      vim.opt.autoindent = true;

      vim.opt.tabstop = 4;
      vim.opt.smarttab = false;
      vim.opt.shiftwidth = 4;
      vim.opt.softtabstop = 0;
      vim.opt.expandtab = true;

      vim.opt.termguicolors = true;
      vim.opt.background = dark

      vim.opt.ttimeout = true;
      vim.opt.ttimeoutlen = 50;
      vim.opt.wildmode = 'list:longest,full';
      vim.opt.splitbelow = true;
      vim.opt.splitright = true;

      vim.opt.foldmethod = 'indent';
      vim.opt.foldlevel = 99;

      vim.opt.undofile = true;
      vim.opt.undodir = vim.fn.expand('~/.config/nvim/undodir')

      -- Open NERDTree on the right
      vim.g.NERDTreeWinPos = "right"

      require'nvim-lastplace'.setup {
          lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
          lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
          lastplace_open_folds = true
      }

    '' + mappings
    + lualine_config
    + formatter_config
    + completion_config
    + tokyonight_config +
    ''
      -- Additional settings

      -- Setting colorscheme
      vim.cmd[[colorscheme tokyonight]]

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
          "sqlls",
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
      -- After setting up mason-lspconfig servers via lspconfig may be set
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require'lspconfig'.lua_ls.setup{
        capabilities = capabilities
      }
      require'lspconfig'.ltex.setup{
        capabilities = capabilities
      }
      require'lspconfig'.clangd.setup{
        capabilities = capabilities
      }
      require'lspconfig'.cmake.setup{
        capabilities = capabilities
      }
      require'lspconfig'.nil_ls.setup{
        capabilities = capabilities
      }
      require'lspconfig'.pyright.setup{
        capabilities = capabilities
      }
      require'lspconfig'.bashls.setup{
        capabilities = capabilities
      }

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
  };
}
