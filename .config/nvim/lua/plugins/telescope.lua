return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Telescope previously open files" })
			vim.keymap.set("n", "<C-e>", builtin.diagnostics, { desc = "List Diagnostics" })
      vim.keymap.set("n", "<C-b>", builtin.git_status, { desc = "Telescope git status" })
      vim.keymap.set("n", "<leader>gS", builtin.git_stash, { desc = "Telescope git stash list" })

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
		end,
	},
}
