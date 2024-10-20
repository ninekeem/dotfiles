local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
	"ansiblels",
	"bashls",
	"docker_compose_language_service",
	"dockerls",
	-- "flux_lsp", i will use it in future
	"gopls",
	"helm_ls",
	"jsonls",
	"lua_ls",
	"pyright",
	"sqlls",
	"yamlls",
}

require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = servers
}

local lp = require('lspconfig')

lp.ansiblels.setup{}
lp.bashls.setup{}
lp.docker_compose_language_service.setup{}
lp.dockerls.setup{}
lp.gopls.setup{}
lp.helm_ls.setup{}
lp.jsonls.setup{}
lp.lua_ls.setup{}
lp.pyright.setup{}
lp.sqlls.setup{}

-- TODO: get schemas from https://github.com/yannh/kubernetes-json-schema
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#yamlls
--
-- TODO: setup ansiblels
lp.yamlls.setup{}
