{
  mappings = ''
    -- Open cheatsheet in vsplit
    vim.keymap.set('n', '<leader>??', '<cmd>vsplit ~/nixos-dotfiles/modules/neovim/cheatsheet.md<CR>')

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

    -- NERDTree bindings
    vim.keymap.set('n', '<C-f>', ':NERDTreeFocus<CR>')
    vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')

    -- Comenter binds
    vim.keymap.set({'n', 'x'}, '<C-c>', ':call nerdcommenter#Comment(0, "toggle")<CR>')

    -- Telescope bindings
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    -- Lspsaga bindings
    vim.keymap.set('n', '<leader>fi', '<cmd>Lspsaga finder def+ref+imp<CR>')   -- Show references in a window
    vim.keymap.set('n', '<leader>dn', '<cmd>Lspsaga diagnostic_jump_next<CR>') -- Show the error messages with actions for them
    vim.keymap.set('n', '<leader>gd', '<cmd>Lspsaga goto_definition<CR>')      -- Jump to the definition
    vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>')               -- Rename a symbol in the file
    vim.keymap.set('n', '<leader>tt', '<cmd>Lspsaga term_toggle<CR>')          -- Toggle a terminal
    vim.keymap.set('n', '<C-d>', '<cmd>Lspsaga hover_doc<CR>')                 -- Hover documentation for cursor location
    vim.keymap.set('n', '<C-a>', '<cmd>Lspsaga code_action<CR>')               -- Invoke code action window
  '';
}
