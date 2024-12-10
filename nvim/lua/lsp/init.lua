-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
	"nginx_language_server",
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
-- lp.yamlls.setup{}
lp.yamlls.setup{
	settings = {
		yaml = {
			schemas = {
				kubernetes = "k8s.yaml/**",
				["https://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["https://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/inventory.json"] = "ansible*/**/inv*/**",
				["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "ansible*/**/playbooks*/**",
				["https://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
				["https://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
				-- ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
				-- ["https://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
				-- ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
				-- ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
				-- ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*{docker-,}compose*.{yml,yaml}",
				-- ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
			}
		}
	},
}
