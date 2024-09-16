{
  formatter_config = ''
    -- Formatter configuration --------------------------------------------------

    -- Utilities for creating configurations
    local util = require "formatter.util"

    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require("formatter").setup {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
          -- "formatter.filetypes.lua" defines default configurations for the
          -- "lua" filetype
          require("formatter.filetypes.lua").stylua,

          function()
            if util.get_current_buffer_file_name() == "special.lua" then
              return nil
            end

            -- Full specification of configurations is down below and in Vim help
            -- files
            return {
              exe = "stylua",
              args = {
                "--search-parent-directories",
                "--stdin-filepath",
                util.escape_path(util.get_current_buffer_file_path()),
                "--",
                "-",
              },
              stdin = true,
            }
          end
        },

        markdown = {
          require("formatter.filetypes.markdown").doctoc,
        },

        c = {
          require("formatter.filetypes.c").clangformat,
        },

        cpp = {
          require("formatter.filetypes.cpp").clangformat,
          function()
            if util.get_current_buffer_file_name() == "special.cpp" then
              return nil
            end
           return {
              exe = "clang-format",
              args = {"-style='{IndentWidth: 4, PointerAlignment: Left, ColumnLimit: 80}'"},
              stdin = true,
            }
          end

        },

        python = {
          require("formatter.filetypes.python").black,
          function()
            if util.get_current_buffer_file_name() == "special.python" then
              return nil
            end
           return {
              exe = "black",
              args = { "-q", "--stdin-filename", util.escape_path(util.get_current_buffer_file_name()), "-" },
              stdin = true,
            }
          end
        },

        sh = {
          require("formatter.filetypes.sh").shfmt,

          function()
            local shiftwidth = vim.opt.shiftwidth:get()

            return {
              exe = "shfmt",
              args = { "-i", shiftwidth },
              stdin = true,
            }
          end
        },

        nix = {
          require("formatter.filetypes.nix").nixpkgs_fmt,
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
      }
    }

    -- Format on save
    -- local augroup = vim.api.nvim_create_augroup
    -- local autocmd = vim.api.nvim_create_autocmd
    -- augroup("__formatter__", { clear = true })
    -- autocmd("BufWritePost", {
    --     group = "__formatter__",
    --     command = ":FormatWrite",
    })
    -- End of Formatter configuration --------------------------------------------------
  '';
}
