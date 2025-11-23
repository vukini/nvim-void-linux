return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
	mapping = cmp.mapping.preset.insert({
	['<CR>'] = cmp.mapping.confirm({ select = false }), -- Enter to confirm/insert
    	['<Tab>'] = cmp.mapping(function(fallback)
      		if cmp.visible() then
        		cmp.select_next_item()
      		else
        		fallback()
      		end
    		end, { 'i', 's' }),
    	['<C-n>'] = cmp.mapping.select_next_item(),
    	['<C-p>'] = cmp.mapping.select_prev_item(),
  	}),
      })
    end,
  },
}

