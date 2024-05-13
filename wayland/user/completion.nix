{
  completion_config = ''
    -- Completion config --------------------------------------------------
     -- Set up nvim-cmp.
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = {
                ["<Tab>"] = cmp.mapping({
                    c = function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            cmp.complete()
                        end
                    end,
                    i = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                        elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                            vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
                        else
                            fallback()
                        end
                    end,
                    s = function(fallback)
                        if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                            vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
                        else
                            fallback()
                        end
                    end
                }),
                ["<S-Tab>"] = cmp.mapping({
                    c = function()
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            cmp.complete()
                        end
                    end,
                    i = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                        elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                            return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                        else
                            fallback()
                        end
                    end,
                    s = function(fallback)
                        if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                            return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                        else
                            fallback()
                        end
                    end
                }),
                ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
                ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
                ['<C-n>'] = cmp.mapping({
                    c = function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
                        end
                    end,
                    i = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            fallback()
                        end
                    end
                }),
                ['<C-p>'] = cmp.mapping({
                    c = function()
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
                        end
                    end,
                    i = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            fallback()
                        end
                    end
                }),
                ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
                ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
                ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
                ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
                ['<CR>'] = cmp.mapping({
                    i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                    c = function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        else
                            fallback()
                        end
                    end
                }),
            },

        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          -- { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
      --  capabilities = capabilities
      -- }
    -- End of Completion config --------------------------------------------------
  '';
}
