local prefix = "<Leader>D"
return {
	"tst-038/dodona.nvim",
	requires = {
		"rcarriga/nvim-notify",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("dodona").setup({
			base_url = "https://dodona.be",
			go_cmd = "open",
			use_folders = true,
		})
	end,

	cmd = { "DodonaSetToken", "DodonaSubmit", "DodonaInit", "DodonaSearch", "DodonaDownload", "DodonaGo" },
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
						[prefix .. "f"] = { ":DodonaSearch<CR>", desc = "Initialize Series Activities" },
						[prefix .. "i"] = { ":DodonaInit<CR>", desc = "Initialize Course / Serie / Activity" },
						[prefix .. "t"] = { ":DodonaSetToken<CR>", desc = "Sets the dodona API token" },
					},
				},
			},
		},
	},
}
