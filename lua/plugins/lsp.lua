return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",        -- LSP server installer
      "williamboman/mason-lspconfig.nvim", -- Bridges mason to lspconfig
      "hrsh7th/nvim-cmp",               -- Completion engine
      "hrsh7th/cmp-nvim-lsp",           -- LSP source for nvim-cmp
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      --lspconfig.lua_ls.setup({ capabilities = capabilities }) -- Example: Lua language server
      for _, server in ipairs({ "lua_ls", "pylsp", "ccls", "tsserver", "hls" }) do
        vim.lsp.config(server, { capabilities = capabilities })
      end

      -- Enable all servers
      vim.lsp.enable({ "lua_ls", "pylsp", "ccls", "tsserver", "hls" })
    end,
  }
}

