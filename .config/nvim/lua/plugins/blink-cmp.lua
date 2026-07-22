return { -- Autocompletion
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    -- Snippet Engine
    'folke/lazydev.nvim',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      nerd_font_variant = 'mono',
    },

    completion = {
      -- By default, you may press `<c-space>` to show the documentation.
      -- Optionally, set `auto_show = true` to show the documentation after a delay.
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
      ghost_text = { enabled = true },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev', 'zola_content', 'zola_shortcodes' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        zola_content = { module = 'zola.sources.content_paths', min_keyword_length = 1 },
        zola_shortcodes = { module = 'zola.sources.shortcodes' }
      },
    },

    fuzzy = { implementation = 'rust' },

    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
  },
}
