return {
	"someone-stole-my-name/yaml-companion.nvim",
	ft = { 'yml', 'yaml' },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim"
	},
	config = function()
    	require("telescope").load_extension("yaml_schema")
	end,
}
