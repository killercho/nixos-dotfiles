# User neovim config
{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    coc.enable = true;
    coc.settings = {
      languageserver = {
        nixd = {
          command = "nixd";
          rootPatterns = [ ".nixd.json" ];
          filetypes = [ "nix" ];
        };
      };
      "coc.preferences.formatOnType" = true;
      "coc.preferences.formatOnSaveFiletypes" = [ "*" ];
      "prettier.tabwidth" = "4";
    };
    coc.pluginConfig = ''
      let g:coc_global_extensions = ['coc-prettier', 'coc-clangd']
    '';

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

      # lualine - a replacement for airline, check the docs and mynixos on how to install

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

      # Coc lpss
      coc-clangd
    ];

    extraLuaConfig = ''
      vim.g.mapleader = ";"

      vim.opt.number = true;
      vim.opt.relativenumber = true;
      vim.opt.autoindent = true;
      vim.opt.tabstop = 4;
      vim.opt.shiftwidth = 4;
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

      -- Coc binds and functions
      vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
      vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
      vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
      vim.keymap.set('n', 'gr', '<Plug>(coc-reference)', { silent = true })

      function _G.show_docs()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
            vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
            vim.fn.CocActionAsync('doHover')
        else
            vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
      end
      vim.keymap.set('n', '<C-d>', '<CMD>lua _G.show_docs()<CR>', { silent = true })

      vim.keymap.set('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)     

      -- Highlight the symbol and its references when holding the cursor
      vim.api.nvim_create_augroup("CocGroup", {})
      vim.api.nvim_create_autocmd("CursorHold", {
          group = "CocGroup",
          command = "silent call CocActionAsync('highlight')",
          desc = "Highlight symbol under cursor on CursorHold"
      })

      -- Formatting selected code
      vim.keymap.set({'x', 'n'}, '<leader>f', '<Plug>(coc-format-selected)', {silent = true})

      -- Symbol renaming
      vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', {silent = true})

      -- Telescope configuration
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    '';
  };
}
