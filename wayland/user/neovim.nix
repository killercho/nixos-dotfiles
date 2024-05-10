# User neovim config
{ config, pkgs, ... }:

{
  #home.packages = with pkgs; [
    #neovim
  #];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    coc.enable = true;
    coc.settings = {
      # JSON values
    };
    coc.pluginConfig = ''
    '';

    plugins = with pkgs.vimPlugins; [
      # Customise this theme with better colors from stylix and blur and transparancy

      # Apply the autoformat when saving feature

      # lualine - a replacement for airline, check the docs and mynixos on how to install
      # NERDTree
      # NERDTree git plugin
      # autoformat - check if neovim has it by default
      # vim-polyglot - check what even is this
      # telescope - check if thats the fuzzy search neovim app
      nerdcommenter

      # Coc lpss
      coc-clangd
    ];

    extraConfig = ''
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

      "NERDTree bindings
      nnoremap <C-f> :NERDTreeFocus<CR>
      nnoremap <C-t> :NERDTreeToggle<CR>

      "Comenter binds
      nnoremap <C-c> :call nerdcommenter#Comment(0, 'toggle')<CR>
      xnoremap <C-c> :call nerdcommenter#Comment(0, 'toggle')<CR>

      "Coc binds
      nnoremap <silent> gd <Plug>(coc-definition)
      nnoremap <silent> gy <Plug>(coc-type-definition)
      nnoremap <silent> gi <Plug>(coc-implementation)
      nnoremap <silent> gr <Plug>(coc-reference)
      nnoremap <silent> <C-d> :call cocconf#ShowDocumentation()<CR>

      inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    '';

    extraLuaConfig = ''
    '';
  };
}
