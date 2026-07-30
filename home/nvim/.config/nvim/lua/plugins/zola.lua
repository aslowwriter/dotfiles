return {
  'aslowwriter/zola.nvim',
  version = '0.2.*',

  lazy = false,
  opts = { draft_by_default = true, page_is_dir = true },

  dependencies = {
    'nvim-lua/plenary.nvim',
    'saghen/blink.cmp',
  },

  keys = {
    {
      '<leader>zs',

      function()
        require('zola').create_interactive {
          kind = 'section',
          prefix = 'blog',
        }
      end,
      desc = 'Create a new blog section',
    },
    {
      '<leader>zz',
      function()
        require 'zola'
      end,
    },

    {
      '<leader>zp',
      function()
        require('zola').create_interactive {
          kind = 'page',
          prefix = 'blog',
        }
      end,

      desc = 'Create a new blog post',
    },
  },
}
