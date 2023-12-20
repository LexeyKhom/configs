local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "windwp/nvim-autopairs",
    "L3MON4D3/LuaSnip",

    -- cmp sources plugins
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "kdheepak/cmp-latex-symbols",
    "roobert/tailwindcss-colorizer-cmp.nvim",
  },
  event = "InsertEnter",
  opts = function()
    local KEYS = require "core.mappings"
    local cmp = require "cmp"
    return {
      completion = {
        completeopt = "menu,menuone",
      },
      window = {
        completion = {
          border = border "CmpBorder",
          side_padding = 0,
          winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
          scrollbar = true,
        },
        documentation = {
          border = border "CmpDocBorder",
          winhighlight = "Normal:CmpDoc",
        },
      },
      formatting = {
        format = require "plugins.cmp.formatter",
      },
      mapping = {
        [KEYS.ENTER] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        [KEYS.UP] = cmp.mapping.select_prev_item(),
        [KEYS.DOWN] = cmp.mapping.select_next_item(),
        [KEYS.SCROLL_DOWN] = cmp.mapping.scroll_docs(4),
        [KEYS.SCROLL_UP] = cmp.mapping.scroll_docs(-4),

        ["<Enter>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<A-w>"] = cmp.mapping.complete(),
        [KEYS.CLOSE] = cmp.mapping.close(),
        [KEYS.CANCEL] = cmp.mapping.abort(),
      },
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
        { name = "latex_symbols" },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    }
  end,
  config = function(_, opts)
    require("cmp").setup(opts)
  end,
}
