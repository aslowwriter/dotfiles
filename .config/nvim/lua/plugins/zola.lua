return {
  dir = '~/projects/lua/zola.nvim',
  lazy = false,

  dependencies = {
    'nvim-lua/plenary.nvim',
    'saghen/blink.cmp',
  },

  opts = {},

  keys = {
    {
      '<leader>zbd',
      function()
        require('zola').build { drafts = true }
      end,
      desc = 'Build version of site including drafts',
    },

    {
      '<leader>zbp',
      function()
        require('zola').build {}
      end,
      desc = 'Build release version of site',
    },

    {
      '<leader>zc',
      function()
        require('zola').check {}
      end,
      desc = 'Check the site',
    },

    {
      '<leader>zsp',
      function()
        require('zola').serve {}
      end,
      desc = 'Serve the release version of the site',
    },

    {
      '<leader>zsd',
      function()
        require('zola').serve { drafts = true }
      end,
      desc = 'Serve the site with drafts',
    },

    {
      '<leader>zns',
      function()
        vim.ui.input({ prompt = 'Enter section slug: ' }, function(result)
          if not result then
            return
          end

          require('zola').create_section {
            slug = 'blog/' .. result,
            draft = true,
            open = true,
          }
        end)
      end,
      desc = 'Create a new blog section',
    },

    {
      '<leader>znp',
      function()
        vim.ui.input({ prompt = 'Enter page slug: ' }, function(result)
          if not result then
            return
          end

          require('zola').create_page {
            slug = 'blog/' .. result,
            page_is_dir = true,
            draft = true,
            open = true,
          }
        end)
      end,
      desc = 'Create a new blog post',
    },
  },
}
