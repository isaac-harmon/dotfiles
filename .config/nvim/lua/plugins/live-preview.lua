-- Live Preview for HTML/CSS/Javascript, Markdown, and other filetypes
return {
	'brianhuster/live-preview.nvim',
	dependencies = { 'folke/snacks.nvim' },
	ft = {
		"htm", "html",
		"md", "markdown",
	},
	config = function()
		vim.keymap.set('n', '<leader>cp', function ()
			require('live-preview').pick()
		end, { desc = 'Live [P]review'})

		vim.keymap.set('n', '<leader>cP', function ()
			require('live-preview').close()
		end, { desc = 'Stop [P]review'})
	end
}
