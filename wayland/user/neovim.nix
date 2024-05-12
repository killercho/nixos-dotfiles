# User neovim config
{ config, pkgs, ... }:

let
  lualine_config = (import ./lualine.nix).lualine_config;
  formatter_config = (import ./formatter.nix).formatter_config;
  completion_config = (import ./completion.nix).completion_config;
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

      # Customise this theme with better colors from stylix and blur and transparency
      # Use the site https://github.com/roobert/palette.nvim to finish the setup for the custom theme
      # Use the commands in https://blog.chaitanyashahare.com/posts/how-to-make-nvim-backround-transparent/ to make the background transparent
      #{ plugin = palette-nvim;
      #lazy = false;
      #priority = 1000;
      #config = ''function()
      #require("palette").setup({
      #palettes = {
      #main = "stylix_main"
      #},
      #})
      #vim.cmd([[colorscheme palette]])
      #end
      #'';
      #}

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

      # telescope - check if thats the fuzzy search neovim app
      telescope-nvim
      plenary-nvim
      telescope-fzf-native-nvim

      # Commenter plugin
      nerdcommenter

      # Plugin to remember the last place the cursor was
      nvim-lastplace

      # Package manager to install and manage LSP and DAP servers, linters and formatters
      # TODO: Check the settings and commands for all things mason related
      mason-nvim

      # Third party plugins managed by mason:
      nvim-lspconfig # Configs for Nvim LSPs
      mason-lspconfig-nvim # Bridge between mason and lspconfig # Bridge between mason and lspconfig
      nvim-dap # Debug client
      nvim-dap-ui # UI for the debugger
      nvim-lint # Lightweigth linter using the LSPs
      formatter-nvim # Formatter plugin
      # End of the plugins managed by mason

      # Plugin for hover/definitions/symbol search
      # TODO: Check the plugin modules and how to map them (https://nvimdev.github.io/lspsaga/)
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

      -- Movement binds
      vim.keymap.set({'n', 'x'}, 'j', 'gj')
      vim.keymap.set({'n', 'x'}, 'k', 'gk')

      vim.keymap.set({'n', 'x'}, 'J', '5j')
      vim.keymap.set({'n', 'x'}, 'K', '5k')

      -- Yank in '+' register
      vim.keymap.set('v', '<C-y>', '"+y')

      -- Copy and paste text under or over the cursor
      vim.keymap.set('n', 'zj', 'mayyp`aj')
      vim.keymap.set('n', 'zk', 'mayyP`ak')

      -- Paste in different modes
      vim.keymap.set('i', '<C-p>', '<Esc>pa')
      vim.keymap.set('c', '<C-p>', '<C-r>')
      vim.keymap.set('n', '<C-p>', '"+p')

      -- Save/Exit bindings
      vim.keymap.set('n', '<C-w>', ':w<CR>')
      vim.keymap.set('n', '<C-q>', ':q<CR>')

      -- Tab bindings
      vim.keymap.set('n', '<C-l>', 'gt<CR>')
      vim.keymap.set('n', '<C-h>', 'gT<CR>')
      vim.keymap.set('n', '<C-n>', ':tabnew<CR>')

      -- Moving text around bindings
      vim.keymap.set('n', '<C-j>', ':m +1<CR>')
      vim.keymap.set('n', '<C-k>', ':m -2<CR>')

      -- Arrows moving splitted windows
      vim.keymap.set('n', '<up>', '<c-w>k')
      vim.keymap.set('n', '<down>', '<c-w>j')
      vim.keymap.set('n', '<right>', '<c-w>l')
      vim.keymap.set('n', '<left>', '<c-w>h')

      -- Arrows with <C> to resize splits
      vim.keymap.set('n', '<c-up>', '5<c-w>+')
      vim.keymap.set('n', '<c-down>', '5<c-w>-')
      vim.keymap.set('n', '<c-right>', '5<c-w>>')
      vim.keymap.set('n', '<c-left>', '5<c-w><')

      -- Open NERDTree on the right
      vim.g.NERDTreeWinPos = "right"

      -- NERDTree bindings
      vim.keymap.set('n', '<C-f>', ':NERDTreeFocus<CR>')
      vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')

      -- Comenter binds
      vim.keymap.set({'n', 'x'}, '<C-c>', ':call nerdcommenter#Comment(0, "toggle")<CR>')

      require'nvim-lastplace'.setup {
          lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
          lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
          lastplace_open_folds = true
      }

      -- Telescope configuration
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    '' + lualine_config
    + formatter_config
    + completion_config +
    ''
      -- Additional settings

      -- Mason settings
      require("mason").setup({
          ui = {
              icons = {
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗"
              }
          }
      })
      require("mason-lspconfig").setup {
          -- Automatic install
          ensure_installed = { "lua_ls" },
          -- TODO: Check how to make the hooks to the LSPs through mason (from git)
      }
      -- After setting up mason-lspconfig servers via lspconfig may be set

      -- DAP and its UI setup
      require("dapui").setup()

      -- Linter setup
      require('lint').linters_by_ft = {
        -- Setup linters by filetype
        markdown = {'vale',}
      }
      -- Setup to trigger linting automatically
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()

          -- try_lint without arguments runs the linters defined in `linters_by_ft`
          -- for the current filetype
          require("lint").try_lint()

          -- You can call `try_lint` with a linter name or a list of names to always
          -- run specific linters, independent of the `linters_by_ft` configuration
          require("lint").try_lint("cspell")
        end,
      })

      -- Lspsaga configuration
      require('lspsaga').setup({})
    '';
  };
}
