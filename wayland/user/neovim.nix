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

      # Commenter plugin
      nerdcommenter

      # Coc lpss
      coc-clangd
    ];

    extraConfig = ''
      	  let mapLeader = "'"

            set number relativenumber
            set tabstop=4
            set shiftwidth=4
            set expandtab
            set termguicolors
            set background=dark

            " colorscheme <colorscheme>

            set ttimeout
            set ttimeoutlen=50
            set wildmode=list:longest,full
            set splitbelow
            set splitright

            set foldmethod=indent
            set foldlevel=99

            "Movement binds
            nnoremap j gj
            nnoremap k gk
            xnoremap j gj
            xnoremap k gk

            nnoremap J 5j
            nnoremap K 5k
            xnoremap J 5j
            xnoremap K 5k

            "Yank in '+' register
            vnoremap <C-y> "+y

            "Copy and paste text under or over the cursor
            nnoremap zj mayyp`aj
            nnoremap zk mayyP`ak

            "Paste in different modes
            inoremap <C-p> <Esc>pa
            cnoremap <C-p> <C-r>"
            nnoremap <C-p> "+p

            "Save/Exit bindings
            nnoremap <C-w> :w<CR>
            nnoremap <C-q> :q<CR>

            "Tab bindings
            nnoremap <C-l> gt<CR>
            nnoremap <C-h> gT<CR>
            nnoremap <C-n> :tabnew<CR>

            "Moving text around bindings
            nnoremap <C-j> :m +1<CR>
            nnoremap <C-k> :m -2<CR>

            "Arrows moving splitted windows
            nnoremap <up> <c-w>k
            nnoremap <down> <c-w>j
            nnoremap <right> <c-w>l
            nnoremap <left> <c-w>h

            "Arrows with <C> to resize splits
            nnoremap <c-up> 5<c-w>+
            nnoremap <c-down> 5<c-w>-
            nnoremap <c-left> 5<c-w><
            nnoremap <c-right> 5<c-w>>

            "Filetype options
            let g:filetype_pl="prolog"

            " Open NERDTree on the right
            let g:NERDTreeWinPos = "right"

            "NERDTree bindings
            nnoremap <C-f> :NERDTreeFocus<CR>
            nnoremap <C-t> :NERDTreeToggle<CR>

            "Comenter binds
            nnoremap <C-c> :call nerdcommenter#Comment(0, 'toggle')<CR>
            xnoremap <C-c> :call nerdcommenter#Comment(0, 'toggle')<CR>

            "Coc binds and functions
            nnoremap <silent> gd <Plug>(coc-definition)
            nnoremap <silent> gy <Plug>(coc-type-definition)
            nnoremap <silent> gi <Plug>(coc-implementation)
            nnoremap <silent> gr <Plug>(coc-reference)
            nnoremap <silent> <C-d> :call ShowDocumentation()<CR>

            inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
        
            function! ShowDocumentation()
              if CocAction('hasProvider', 'hover')
                call CocActionAsync('doHover')
              else
                call feedkeys('K', 'in')
              endif
            endfunction

            " Highlight the symbol and its references when holding the cursor
            autocmd CursorHold * silent call CocActionAsync('highlight')

            " Formatting selected code
            xmap <Leader>f  <Plug>(coc-format-selected)
            nmap <Leader>f  <Plug>(coc-format-selected)

            " Symbol renaming
            nmap <Leader>rn <Plug>(coc-rename)
    '';

    extraLuaConfig = "";
  };
}
