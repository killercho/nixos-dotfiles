# User neovim config
{ pkgs, ... }:

let
  lualine_config = (import ./lualine.nix).lualine_config;
  formatter_config = (import ./formatter.nix).formatter_config;
  completion_config = (import ./completion.nix).completion_config;
  mappings = (import ./mappings.nix).mappings;
  mason_config = (import ./mason_lsp.nix).mason_config;
  lsps_and_saga_config = (import ./mason_lsp.nix).lsps_and_saga_config;
  tokyonight_config = (import ./tokyonight.nix).tokyonight_config;
in
{
  imports = [
    ./clangd.nix
  ];
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
      #nvim-dap # Debug client
      #nvim-dap-ui # UI for the debugger
      nvim-gdb # Debug client for an older gdb
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

      # Time tracking
      vim-wakatime
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
      vim.opt.timeout = true;
      vim.opt.ttimeoutlen = 50;
      vim.opt.timeoutlen = 250;
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

    '' + lualine_config
    + formatter_config
    + completion_config
    + mason_config
    + lsps_and_saga_config
    + tokyonight_config +
    ''
      -- Additional settings

      -- Setting colorscheme
      vim.cmd[[colorscheme tokyonight]]

    '' + mappings;
  };
}
