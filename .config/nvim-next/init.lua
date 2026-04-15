-- ========================================================================== --
--                             PROF: ENABLE WITH SNACKS                       --
-- ========================================================================== --
-- if vim.env.PROF then
--   local appname = vim.env.NVIM_APPNAME or 'nvim'
--   local snacks = os.getenv('HOME') .. '/.local/share/' .. appname .. '/site/pack/core/opt/snacks.nvim'
--   vim.opt.rtp:append(snacks)
--   require('snacks.profiler').startup({
--     startup = {
--       event = 'VimEnter',
--     },
--   })
-- end

-- ========================================================================== --
--                             GENERAL SETTINGS                               --
-- ========================================================================== --
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.colorcolumn = "80"
vim.o.spelllang = "en_gb"
vim.o.spell = true

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- ========================================================================== --
--                              BASIC KEYMAPS                                 --
-- ========================================================================== --
local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Floating diagnostic" })

-- Window navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })

-- Centered scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Netrw (built-in file explorer — no plugin needed)
map("n", "<leader>x", "<cmd>Explore<CR>", { desc = "File [Ex]plorer" })

-- ========================================================================== --
--                                AUTOCMDS                                    --
-- ========================================================================== --
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- ========================================================================== --
--                             USER COMMANDS                                  --
-- ========================================================================== --
vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local vt = vim.diagnostic.config().virtual_text
	vim.diagnostic.config({ virtual_text = not vt })
end, { desc = "Toggle diagnostic virtual text" })

-- ========================================================================== --
--                                PLUGINS                                     --
-- ========================================================================== --
local gh = function(x)
	return "https://github.com/" .. x
end

-- -------------------------------------------------------------------------- --
-- THEME: tokyonight.nvim
-- -------------------------------------------------------------------------- --
vim.pack.add({ { src = gh("folke/tokyonight.nvim") } })
vim.cmd.colorscheme("tokyonight-storm")
vim.cmd.hi("Comment gui=none")

vim.cmd.hi("LineNr guifg=#828bb8") -- Current/Absolute line number
vim.cmd.hi("LineNrAbove guifg=#828bb8") -- Relative numbers above the cursor
vim.cmd.hi("LineNrBelow guifg=#828bb8") -- Relative numbers below the cursor
-- -------------------------------------------------------------------------- --
-- ICONS: nvim-web-devicons
-- -------------------------------------------------------------------------- --
vim.pack.add({ { src = gh("nvim-tree/nvim-web-devicons") } })

-- -------------------------------------------------------------------------- --
-- WHICH-KEY: folke/which-key.nvim
-- -------------------------------------------------------------------------- --
vim.pack.add({ { src = gh("folke/which-key.nvim") } })
require("which-key").setup({
	icons = { mappings = vim.g.have_nerd_font },
	spec = {
		{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
		{ "<leader>d", group = "[D]ocument" },
		{ "<leader>g", group = "[G]it" },
		{ "<leader>r", group = "[R]ename" },
		{ "<leader>s", group = "[S]earch" },
		{ "<leader>t", group = "[T]oggle" },
		{ "<leader>w", group = "[W]orkspace" },
	},
})

-- -------------------------------------------------------------------------- --
-- MINI.NVIM: mini-nvim/mini.nvim
-- -------------------------------------------------------------------------- --
vim.pack.add({ { src = gh("nvim-mini/mini.nvim") } })
require("mini.ai").setup({ n_lines = 500 })
require("mini.surround").setup()
local statusline = require("mini.statusline")
statusline.setup({ use_icons = vim.g.have_nerd_font })
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
	return "%2l:%-2v"
end

-- -------------------------------------------------------------------------- --
-- SNACKS.NVIM: folke/snacks.nvim
-- -------------------------------------------------------------------------- --
vim.pack.add({ { src = gh("folke/snacks.nvim") } })
require("snacks").setup({
	animate = { enabled = false },
	bigfile = { enabled = false },
	bufdelete = { enabled = true },
	dashboard = { enabled = false },
	debug = { enabled = false },
	dim = { enabled = false },
	explorer = { enabled = false },
	gh = { enabled = false },
	git = { enabled = true },
	gitbrowse = { enabled = true },
	image = { enabled = false },
	indent = { enabled = true },
	input = { enabled = false },
	keymap = { enabled = true },
	layout = { enabled = false },
	lazygit = { enabled = true },
	notifier = { enabled = false },
	notify = { enabled = false },
	picker = { enabled = true },
	profiler = { enabled = false },
	quickfile = { enabled = false },
	rename = { enabled = false },
	scope = { enabled = false },
	scratch = { enabled = false },
	scroll = { enabled = false },
	statuscolumn = { enabled = false },
	terminal = { enabled = false },
	toggle = { enabled = true },
	util = { enabled = true },
	win = { enabled = false },
	words = { enabled = false },
	zen = { enabled = false },

	styles = {
		blame_line = {
			width = 0.6,
			height = 0.6,
			border = true,
			title = " Git Blame ",
			title_pos = "center",
			ft = "git",
		},
	},
})

-- Snacks picker keymaps
local sp = require("snacks").picker

map("n", "<leader>sf", function()
	sp.files({ hidden = true, exclude = { ".git" } })
end, { desc = "[S]earch [F]iles" })
map("n", "<leader>sg", function()
	sp.grep()
end, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sw", function()
	sp.grep_word()
end, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sh", function()
	sp.help()
end, { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", function()
	sp.keymaps()
end, { desc = "[S]earch [K]eymaps" })
map("n", "<leader>sd", function()
	sp.diagnostics()
end, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", function()
	sp.resume()
end, { desc = "[S]earch [R]esume" })
map("n", "<leader>s.", function()
	sp.recent()
end, { desc = "[S]earch Recent Files" })
map("n", "<leader><leader>", function()
	sp.buffers()
end, { desc = "[ ] Find existing buffers" })
map("n", "<leader>/", function()
	sp.lines()
end, { desc = "[/] Search current buffer" })
map("n", "<leader>s/", function()
	sp.grep({ grep_open_files = true })
end, { desc = "[S]earch [/] in Open Files" })
map("n", "<leader>sn", function()
	sp.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })
map("n", "<leader>gb", function()
	require("snacks").git.blame_line()
end, { desc = "[G]it [B]lame line" })

-- LSP navigation via Snacks picker
map("n", "grd", function()
	sp.lsp_definitions()
end, { desc = "LSP: [G]oto [D]efinition" })
map("n", "grr", function()
	sp.lsp_references()
end, { desc = "LSP: [G]oto [R]eferences" })
map("n", "gri", function()
	sp.lsp_implementations()
end, { desc = "LSP: [G]oto [I]mplementation" })
map("n", "grt", function()
	sp.lsp_type_definitions()
end, { desc = "LSP: [G]oto [T]ype Definition" })
map("n", "gO", function()
	sp.lsp_symbols()
end, { desc = "LSP: Document Symbols" })
map("n", "gW", function()
	sp.lsp_workspace_symbols()
end, { desc = "LSP: Workspace Symbols" })

-- Copy the GitHub URL to clipboard instead of opening a remote browser
map({ "n", "v" }, "<leader>go", function()
	require("snacks").gitbrowse({
		open = function(url)
			vim.fn.setreg("+", url)
			vim.notify("Copied to clipboard:\n" .. url, vim.log.levels.INFO, { title = "Gitbrowse" })
		end,
	})
end, { desc = "[G]it [O]pen (Copy URL)" })

-- -------------------------------------------------------------------------- --
-- TREESITTER: nvim-treesitter/nvim-treesitter
-- -------------------------------------------------------------------------- --
vim.pack.add({ { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" } })

local parsers = {
	"bash",
	"c",
	"diff",
	"html",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"query",
	"vim",
	"vimdoc",
	"go",
	"python",
	"rust",
	"yaml",
}

require("nvim-treesitter").install(parsers)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldenable = false

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter-attach", { clear = true }),
	callback = function(event)
		pcall(vim.treesitter.start, event.buf)
	end,
})

vim.pack.add({ { src = gh("neovim/nvim-lspconfig") } })
vim.pack.add({ { src = gh("b0o/schemastore.nvim") } })
vim.pack.add({ { src = gh("mason-org/mason.nvim") } })
require("mason").setup()

vim.o.winborder = "rounded"

-- -------------------------------------------------------------------------- --
-- LAZYDEV: folke/lazydev.nvim
-- -------------------------------------------------------------------------- --
vim.pack.add({ { src = gh("folke/lazydev.nvim") } })
require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})

-- -------------------------------------------------------------------------- --
-- FIDGET: j-hui/fidget.nvim
-- -------------------------------------------------------------------------- --
vim.pack.add({ { src = gh("j-hui/fidget.nvim") } })
require("fidget").setup()

-- -------------------------------------------------------------------------- --
-- BLINK.CMP: saghen/blink.cmp
-- -------------------------------------------------------------------------- --
vim.pack.add({ { src = gh("Saghen/blink.cmp"), tags = "v1.*" } })
require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = { nerd_font_variant = "mono" },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
	},
	sources = {
		default = { "lsp", "path", "snippets", "lazydev" },
		providers = {
			lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
		},
	},
	fuzzy = { implementation = "lua" },
	signature = { enabled = true },
})

-- Auto-install servers and tools via Mason
local mason_packages = {
	-- LSP servers
	"basedpyright",
	"ruff",
	-- "rust-analyzer",
	-- "gopls",
	"bash-language-server",
	"terraform-ls",
	"yaml-language-server",
	-- "zls",
	"lua-language-server",
	-- Formatters
	"stylua",
	"shfmt",
	-- "golines",
}

-- Implemented to decrease start up time
vim.defer_fn(function()
	local mr = require("mason-registry")
	mr.refresh(function()
		for _, pkg_name in ipairs(mason_packages) do
			local ok, pkg = pcall(mr.get_package, pkg_name)
			if ok and not pkg:is_installed() then
				pkg:install()
			end
		end
	end)
end, 100)

-- -------------------------------------------------------------------------- --
-- LSP
-- -------------------------------------------------------------------------- --
vim.diagnostic.config({

	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = { source = "if_many", spacing = 2 },
})

vim.lsp.config("*", {
	on_attach = function(client, bufnr)
		local lmap = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
		end

		lmap("grn", vim.lsp.buf.rename, "[R]e[n]ame")
		lmap("gra", vim.lsp.buf.code_action, "Code [A]ction", { "n", "x" })
		lmap("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		if vim.lsp.inlay_hint then
			lmap("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
			end, "[T]oggle Inlay [H]ints")
		end

		if client:supports_method("textDocument/documentHighlight") then
			local hl_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = bufnr,
				group = hl_group,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = bufnr,
				group = hl_group,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

local servers = {
	"lua_ls",
	"basedpyright",
	"ruff",
	"bashls",
	"terraformls",
	"yamlls",
}

for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end

-- -------------------------------------------------------------------------- --
-- CONFORM: stevearc/conform.nvim
-- -------------------------------------------------------------------------- --
vim.pack.add({ { src = gh("stevearc/conform.nvim") } })
require("conform").setup({
	notify_on_error = false,
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		sh = { "shfmt" },
		go = { "golines" },
		python = { "ruff_format", "ruff_fix", "ruff_organize_imports", lsp_format = "first" },
	},
})
