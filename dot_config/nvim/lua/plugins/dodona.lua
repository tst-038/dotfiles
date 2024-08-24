local prefix = "<Leader>D"
return {
	"tst-038/dodona.nvim",
	requires = {
		"rcarriga/nvim-notify",
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("dodona").setup({
			base_url = "https://dodona.be",
			go_cmd = "open",
			use_folders = true,
		})
	end,

	cmd = { "DodonaSubmit", "DodonaInitActivities", "DodonaInitCourseActivities", "DodonaDownload", "DodonaGo" },
	dependencies = {
		{
			"AstroNvim/astrocore",
			opts = {
				mappings = {
					n = {
						[prefix] = { desc = "󰘦 Dodona" },
						[prefix .. "g"] = { ":DodonaGo<CR>", desc = "Go to Dodona" },
						[prefix .. "s"] = { ":DodonaSubmit<CR>", desc = "Submit buffer" },
						[prefix .. "d"] = { ":DodonaDownload<CR>", desc = "Download exercise files" },
						[prefix .. "a"] = { ":DodonaInitActivities<CR>", desc = "Initialize Series Activities" },
						[prefix .. "c"] = { ":DodonaInitCourseActivities<CR>", desc = "Initialize Course Activities" },
					},
				},
			},
		},
	},
}
