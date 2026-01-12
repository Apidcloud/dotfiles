return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					show_hidden_count = false,
					hide_dotfiles = false,
					hide_gitignored = false,
					never_show = {
						".git",
						".DS_Store",
						"thumbs.db",
						".gitlab",
						".vscode",
						".idea",
						".github",
						".husky",
					},
				},
				follow_current_file = {
					enabled = true,
				},
				find_command = "fd",
				find_args = {
					fd = {
						"--exclude",
						".git",
						"--exclude",
						"dist",
						"--exclude",
						"build",
						"--exclude",
						"node_modules",
						"--exclude",
						"coverage",
					},
				},
				commands = {
					open_in_finder = function(state)
						local path = state.tree:get_node().path
						-- macOS command to open in Finder
						vim.fn.jobstart({ "open", "-R", path }, { detach = true })
					end,
				},
				window = {
					mappings = {
						["of"] = "open_in_finder",
					},
				},
			},
		})

		local refresh_group = vim.api.nvim_create_augroup("NeoTreeGitRefresh", { clear = true })
		vim.api.nvim_create_autocmd("FocusGained", {
			group = refresh_group,
			callback = function()
				if package.loaded["neo-tree.sources.git_status"] then
					require("neo-tree.sources.git_status").refresh()
				end
			end,
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
