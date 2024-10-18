return {
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					set_env = { ["COLORTERM"] = "truecolor" },
				},
				pickers = {
					find_files = {
						cwd = vim.fn.expand("%:p:h"),
					},
				},
				extensions = {
					file_browser = {
						theme = "ivy",
						hijack_netrw = true,
						hidden = true,
						cwd = vim.fn.expand("%:p:h"),
					},
				},
			})
			telescope.load_extension("file_browser")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
}
