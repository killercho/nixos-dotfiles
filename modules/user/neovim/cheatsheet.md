# Cheat sheet for my configuration

**Leader is `;`.**

## Movement

 - `J`/`K` - moves up/down with 5 lines instead of 1;
 - `Ctrl + j` - moves the current line with one up
 - `Ctrl + k` - moves the current line with one down

## Registers

 - `Ctrl + y` - yank the selected text in the `+` register
 - `zj` - copy and paste the text on the line under the cursor
 - `zk` - copy and paste the text on the line over the cursor
 - `Ctrl + p` - paste the default buffer while in `Insert` mode
 - `Ctrl + p` - paste the `+` buffer while in `Normal` mode, after the cursor

## Window

 - `Ctrl + w` - save the current buffer (equivalent to `:w`)
 - `Ctrl + q` - exit the current buffer (equivalent to `:q`)
 - `Ctrl + l` - go to the tab on the right (equivalent to `gt`)
 - `Ctrl + h` - go to the tab on the left (equivalent to `gT`)
 - `Ctrl + n` - go to the tab on the right (equivalent to `:tabnew<CR>`)
 - `Up arrow` - move cursor to the tab on top
 - `Down arrow` - move cursor to the tab down
 - `Right arrow` - move cursor to the tab on the right
 - `Left arrow` - move cursor to the tab on the left
 - `Ctrl + Up arrow` - resize when the split is horizontal
 - `Ctrl + Down arrow` - resize when the split is horizontal
 - `Ctrl + Right arrow` - resize when the split is vertical
 - `Ctrl + Left arrow` - resize when the split is vertical
 - `Ctrl + t` - open _NERDTree_
 - `Ctrl + f` - focus _NERDTree_

## Telescope

 - `<leader>ff` - open `Telescope` to search for files in the current directory
 - `<leader>fg` - open `Telescope` to search for strings in the files in the current directory
 - `<leader>fb` - open `Telescope` to search for open buffers in neovim
 - `<leader>fn` - open `Telescope` to search for available help tags

## Mason

 - `:Mason` - open the Mason package manager window
 - `i` - install packages when in the package manager window
 - `X` - uninstall packages when in the package manager window
 - `g?` - help when inside the package manager window

## LSPsaga

 - ` ` - when inside the preview windows to toggle between them
 - `<leader>fi` - open _LSPsaga_ finder to search for definitions, references and implementations of the cursor position
 - `<leader>dn` - open _LSPsaga_ diagnostic jump next window to see where the lsp is crying for something wrong
 - `<leader>gd` - go to definition with the help of _LSPsaga_
 - `<leader>rn` - rename all occurences of this symbol in the buffer with _LSPsaga_
 - `<leader>tt` - open a terminal
 - `Ctrl + d` - open hover documentation window for current cursor position
 - `Ctrl + a` - open code action window from _LSPsaga_

## Completion

 - `Ctrl + p`/`Up arrow` - scroll up when the completion window is open
 - `Down arrow` - scroll down when the completion window is open
 - `Ctrl + e` - cancel completion if the window is open

## Others

 - `<leader>//` - open this file as a vsplit
 - `Ctrl + c` - comment the current line or a selection of lines
