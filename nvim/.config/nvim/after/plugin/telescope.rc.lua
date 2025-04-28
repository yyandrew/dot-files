local state, telescope = pcall(require, 'telescope')
if not state then
  return
end

local _, lga_actions = pcall(require, 'telescope-live-grep-args.actions')

telescope.setup {
  previewers = {

  },
  pickers = {
    diagnostics = {
      sort_by = "severity",
      no_unlisted = true,
      line_width = 20,
    },
    live_grep = {
      line_width = 20,
    },
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer", --- Delete buffer
        }
      }
    }
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true,
      mappings = {
        i = {
          ['<C-k>'] = lga_actions.quote_prompt(),
          ['<C-i>'] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
    },
  },
}

vim.cmd [[autocmd User TelescopePreviewerLoaded setlocal wrap]]
local keymap = vim.keymap
-- telescope
keymap.set('n', ',p', '<cmd>Telescope git_files<CR>')
keymap.set('', ',i', '<cmd>Telescope Snippets<CR>')
keymap.set('n', ',g', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
keymap.set('n', ',e', "<cmd>Telescope buffers<CR>")
keymap.set('n', ',G', "<cmd>Telescope grep_string<CR>")
keymap.set('n', ',h', "<cmd>Telescope help_tags<CR>")
keymap.set('n', ',d', "<cmd>Telescope diagnostics<CR>")
keymap.set('n', ',qfh', "<cmd>Telescope quickfixhistory<CR>")

telescope.load_extension("live_grep_args")
