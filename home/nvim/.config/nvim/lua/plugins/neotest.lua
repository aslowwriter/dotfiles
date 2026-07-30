return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-neotest/neotest-python',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
      },
      'nvim-neotest/neotest-python',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python',
          require 'rustaceanvim.neotest',
        },

        vim.keymap.set('n', '<leader>ta', function()
          require('neotest').run.run(vim.fn.getcwd())
        end, { desc = 'Rerun all tests' }),

        vim.keymap.set('n', '<leader>tl', function()
          require('neotest').run.run_last()
        end, { desc = 'Rerun last test' }),

        vim.keymap.set('n', '<leader>tr', function()
          require('neotest').run.run()
        end, { desc = 'Run current Test' }),
      }
    end,
  },
}
