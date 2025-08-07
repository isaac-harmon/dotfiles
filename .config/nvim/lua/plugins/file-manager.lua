-- Yazi file manager
return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>fe",
			"<cmd>Yazi<cr>",
			desc = "[E]xplorer",
		},
		{
			"<leader>fE",
			"<cmd>Yazi<cr>",
			desc = "[E]xplorer (cwd)",
		},
	},
	opts = {
		open_for_directories = true,
		floating_window_scaling_factor = 0.88
	},
	init = function() vim.g.loaded_netrwPlugin = 1 end,
}
