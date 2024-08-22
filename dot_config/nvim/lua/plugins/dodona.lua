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
}
