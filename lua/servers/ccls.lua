-- ================================================================================================
-- TITLE : ccls (C/C++ Language Server) LSP Setup
-- LINKS :
--   > website: https://github.com/MaskRay/ccls
-- ================================================================================================

--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
return function(capabilities)
	require('lspconfig').ccls.setup{
		capabilities = capabilities,
		cmd = { "ccls" },
		filetypes = { "c", "cpp", "objc", "objcpp" },
		-- You can provide root_dir for more control (optional)
		-- root_dir = require('lspconfig').util.root_pattern('compile_commands.json', '.git'),
		-- Additional settings for ccls can go here:
		-- init_options = {
		--   highlight = { lsRanges = true },
		-- },
	}
end

