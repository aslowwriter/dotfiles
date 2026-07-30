return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  init = function()
    -- Configure rustaceanvim here

    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {},
      -- LSP configuration
      server = {
        on_attach = function(client, bufnr)
          vim.keymap.set('n', '<leader>k', function()
            vim.cmd.RustLsp { 'hover', 'actions' }
          end, { buffer = bufnr, desc = 'Render next diagnostic' })
          vim.keymap.set('n', 'gD', function()
            vim.cmd.RustLsp { 'relatedDiagnostics' }
          end, { buffer = bufnr, desc = '[G]oto Related [D]iagnostic' })

          vim.keymap.set('n', '<leader>ld', function()
            vim.cmd.RustLsp { 'renderDiagnostic', 'cycle' }
          end, { buffer = bufnr, desc = 'Render next diagnostic' })

          vim.keymap.set('n', '<leader>lD', function()
            vim.cmd.RustLsp { 'renderDiagnostic', 'cycle_prev' }
          end, { buffer = bufnr, desc = 'Render previous diagnostic' })

          vim.keymap.set('n', 'J', function()
            vim.cmd.RustLsp 'joinLines'
          end, { buffer = bufnr, desc = 'Join lines' })
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {},
        },
      },
      -- DAP configuration
      dap = {},
    }
  end,
}
