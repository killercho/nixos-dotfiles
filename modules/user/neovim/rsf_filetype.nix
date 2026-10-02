{
  rsf_filetype = ''
    vim.filetype.add({
      extension = {
        rsf = 'rsf',
      },
    })

    vim.treesitter.language.register("rsf", "rsf")

    vim.api.nvim_set_hl(42, "@variable_section", { fg = "#ff5f00" })
    vim.api.nvim_set_hl(42, "@matrix_section", { fg = "#ff5f00" })
    vim.api.nvim_set_hl(42, "@include_section", { fg = "#ff5f00" })
    vim.api.nvim_set_hl(42, "@required_section", { fg = "#afffff" })
    vim.api.nvim_set_hl(42, "@normal_section_name", { fg = "#ffff87" })
    vim.api.nvim_set_hl(42, "@key_with_delimiter", { fg = "#5fafff", bold = true })
    vim.api.nvim_set_hl(42, "@include_file", { fg = "#008700", underline = true })
    vim.api.nvim_set_hl(42, "@variable", { fg = "#af5fd7", italic = true })
    vim.api.nvim_set_hl(42, "@comment", { fg = "#8a8a8a", italic = true })
    vim.api.nvim_set_hl(42, "@error", { bg = "#d70000", fg = "#eeeeee", bold = true })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'rsf' },
      callback = function()
        -- Set the current buffer to the one that is used for the rsf format.
        vim.api.nvim_win_set_hl_ns(vim.api.nvim_get_current_win(), 42)

        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()

        -- folds, provided by Neovim
        vim.wo[0][0].foldmethod = 'expr'
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'

        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  '';
}
