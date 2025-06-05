
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
    {{
	"Olical/aniseed",
    },
	{
	    'tpope/vim-sleuth',
	}, -- Detect tabstop and shiftwidth automatically
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
	    'lewis6991/gitsigns.nvim',
	    opts = {
		signs = {
		    add = { text = '+' },
		    change = { text = '~' },
		    delete = { text = '_' },
		    topdelete = { text = '‾' },
		    changedelete = { text = '~' },
		},
	    },
	},
	{ 
	    'folke/which-key.nvim',
	    event = 'VimEnter', 
	    opts = {
		delay = 0,
		icons = {
		    mappings = vim.g.have_nerd_font,
		    keys = vim.g.have_nerd_font and {} or {
			Up = '<Up> ',
			Down = '<Down> ',
			Left = '<Left> ',
			Right = '<Right> ',
			C = '<C-…> ',
			M = '<M-…> ',
			D = '<D-…> ',
			S = '<S-…> ',
			CR = '<CR> ',
			Esc = '<Esc> ',
			ScrollWheelDown = '<ScrollWheelDown> ',
			ScrollWheelUp = '<ScrollWheelUp> ',
			NL = '<NL> ',
			BS = '<BS> ',
			Space = '<Space> ',
			Tab = '<Tab> ',
			F1 = '<F1>',
			F2 = '<F2>',
			F3 = '<F3>',
			F4 = '<F4>',
			F5 = '<F5>',
			F6 = '<F6>',
			F7 = '<F7>',
			F8 = '<F8>',
			F9 = '<F9>',
			F10 = '<F10>',
			F11 = '<F11>',
			F12 = '<F12>',
		    },
		},

		spec = {
		    { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
		    { '<leader>d', group = '[D]ocument' },
		    { '<leader>r', group = '[R]ename' },
		    { '<leader>s', group = '[S]earch' },
		    { '<leader>w', group = '[W]orkspace' },
		    { '<leader>t', group = '[T]oggle' },
		    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
		},
	    },
	},
	{ 
	    'nvim-telescope/telescope.nvim',
	    event = 'VimEnter',
	    branch = '0.1.x',
	    dependencies = {
		'nvim-lua/plenary.nvim',
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
		    'nvim-telescope/telescope-fzf-native.nvim',

		    -- `build` is used to run some command when the plugin is installed/updated.
		    -- This is only run then, not every time Neovim starts up.
		    build = 'make',

		    -- `cond` is a condition used to determine whether this plugin should be
		    -- installed and loaded.
		    cond = function()
			return vim.fn.executable 'make' == 1
		    end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	    },
	    config = function()
		require('telescope').setup {
		    defaults = {
			mappings = {
			    i = { ['<c-enter>'] = 'to_fuzzy_refine' },
			},
		    },
		    pickers = {}
		    extensions = {
			['ui-select'] = {
			    require('telescope.themes').get_dropdown(),
			},
		    },
		}

		-- Enable Telescope extensions if they are installed
		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')

		-- See `:help telescope.builtin`
		local builtin = require 'telescope.builtin'
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
		vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
		vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
		vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
		vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set('n', '<leader>/', function()
		    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
						     builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
							 winblend = 10,
							 previewer = false,
						     })
						 end, { desc = '[/] Fuzzily search in current buffer' })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set('n', '<leader>s/', function()
						      builtin.live_grep {
							  grep_open_files = true,
							  prompt_title = 'Live Grep in Open Files',
						      }
						  end, { desc = '[S]earch [/] in Open Files' })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set('n', '<leader>sn', function()
						      builtin.find_files { cwd = vim.fn.stdpath 'config' }
						  end, { desc = '[S]earch [N]eovim files' })
	    end,
	},

     -- LSP Plugins
	{
	    'folke/lazydev.nvim',
	    ft = 'lua',
	    opts = {
		library = {
		    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
		},
	    },
	},
	{
	    'neovim/nvim-lspconfig',
	    dependencies = {
		{ 'williamboman/mason.nvim', opts = {} },
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',

		-- Useful status updates for LSP.
		{ 'j-hui/fidget.nvim', opts = {} },

		-- Allows extra capabilities provided by nvim-cmp
		'hrsh7th/cmp-nvim-lsp',
	    },
	    config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
		    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
		    callback = function(event)
			local map = function(keys, func, desc, mode)
			    mode = mode or 'n'
			    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
			end

			map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

			map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

			map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

			map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

			map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

			map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

			map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

			map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

			map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

			local function client_supports_method(client, method, bufnr)
			    if vim.fn.has 'nvim-0.11' == 1 then
				return client:supports_method(method, bufnr)
			    else
				return client.supports_method(method, { bufnr = bufnr })
			    end
			end

			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			    local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
			    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			    })

			    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			    })

			    vim.api.nvim_create_autocmd('LspDetach', {
				group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
				callback = function(event2)
				    vim.lsp.buf.clear_references()
				    vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
				end,
			    })
			end

			if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			    map('<leader>th', function()
						  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
					      end, '[T]oggle Inlay [H]ints')
			end
		    end,
		})

		-- Diagnostic Config
		-- See :help vim.diagnostic.Opts
		vim.diagnostic.config {
		    severity_sort = true,
		    float = { border = 'rounded', source = 'if_many' },
		    underline = { severity = vim.diagnostic.severity.ERROR },
		    signs = vim.g.have_nerd_font and {
			text = {
			    [vim.diagnostic.severity.ERROR] = '󰅚 ',
			    [vim.diagnostic.severity.WARN] = '󰀪 ',
			    [vim.diagnostic.severity.INFO] = '󰋽 ',
			    [vim.diagnostic.severity.HINT] = '󰌶 ',
			},
		    } or {},
		    virtual_text = {
			source = 'if_many',
			spacing = 2,
			format = function(diagnostic)
			    local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			    }
			    return diagnostic_message[diagnostic.severity]
			end,
		    },
		}

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

		local servers = {
		    lua_ls = {
			-- cmd = { ... },
			-- filetypes = { ... },
          -- capabilities = {},
          settings = {
              Lua = {
		  completion = {
                      callSnippet = 'Replace',
		  },
		  -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
		  -- diagnostics = { disable = { 'missing-fields' } },
              },
          },
		    },
		}
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
		    'stylua', -- Used to format Lua code
		})
		require('mason-tool-installer').setup { ensure_installed = ensure_installed }

		require('mason-lspconfig').setup {
		    ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
		    automatic_installation = false,
		    handlers = {
			function(server_name)
			    local server = servers[server_name] or {}
			    -- This handles overriding only values explicitly passed
			    -- by the server configuration above. Useful when disabling
			    -- certain features of an LSP (for example, turning off formatting for ts_ls)
			    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
			    require('lspconfig')[server_name].setup(server)
			end,
		    },
		}
	    end,
	},

	{ -- Autoformat
	    'stevearc/conform.nvim',
	    event = { 'BufWritePre' },
	    cmd = { 'ConformInfo' },
	    keys = {
		{
		    '<leader>f',
		    function()
			require('conform').format { async = true, lsp_format = 'fallback' }
		    end,
		    mode = '',
		    desc = '[F]ormat buffer',
		},
	    },
	    opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
		    local disable_filetypes = { c = true, cpp = true }
		    local lsp_format_opt
		    if disable_filetypes[vim.bo[bufnr].filetype] then
			lsp_format_opt = 'never'
		    else
			lsp_format_opt = 'fallback'
		    end
		    return {
			timeout_ms = 500,
			lsp_format = lsp_format_opt,
		    }
		end,
		formatters_by_ft = {
		    lua = { 'stylua' },
		    -- Conform can also run multiple formatters sequentially
		    -- python = { "isort", "black" },
		    --
		    -- You can use 'stop_after_first' to run the first available formatter from the list
		    -- javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	    },
	},

	{ -- Autocompletion
	    'hrsh7th/nvim-cmp',
	    event = 'InsertEnter',
	    dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		{
		    'L3MON4D3/LuaSnip',
		    build = (function()
			-- Build Step is needed for regex support in snippets.
			-- This step is not supported in many windows environments.
			-- Remove the below condition to re-enable on windows.
			if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
			    return
			end
			return 'make install_jsregexp'
			     end)(),
		    dependencies = {
			{
			    'rafamadriz/friendly-snippets',
			    config = function()
				require('luasnip.loaders.from_vscode').lazy_load()
			    end,
			},
		    },
		},
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lsp-signature-help',
	    },
	    config = function()
		-- See `:help cmp`
		local cmp = require 'cmp'
		local luasnip = require 'luasnip'
		luasnip.config.setup {}

		cmp.setup {
		    snippet = {
			expand = function(args)
			    luasnip.lsp_expand(args.body)
			end,
		    },
		    completion = { completeopt = 'menu,menuone,noinsert' },

		    mapping = cmp.mapping.preset.insert {
			-- Select the [n]ext item
			['<C-n>'] = cmp.mapping.select_next_item(),
			-- Select the [p]revious item
			['<C-p>'] = cmp.mapping.select_prev_item(),

			-- Scroll the documentation window [b]ack / [f]orward
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),

			-- Accept ([y]es) the completion.
			--  This will auto-import if your LSP supports it.
			--  This will expand snippets if the LSP sent a snippet.
			['<C-y>'] = cmp.mapping.confirm { select = true },

			-- If you prefer more traditional completion keymaps,
			-- you can uncomment the following lines
			--['<CR>'] = cmp.mapping.confirm { select = true },
			--['<Tab>'] = cmp.mapping.select_next_item(),
			--['<S-Tab>'] = cmp.mapping.select_prev_item(),

			-- Manually trigger a completion from nvim-cmp.
			--  Generally you don't need this, because nvim-cmp will display
			--  completions whenever it has completion options available.
			['<C-Space>'] = cmp.mapping.complete {},

			-- Think of <c-l> as moving to the right of your snippet expansion.
			--  So if you have a snippet that's like:
			--  function $name($args)
			--    $body
			--  end
			--
			-- <c-l> will move you to the right of each of the expansion locations.
			-- <c-h> is similar, except moving you backwards.
			['<C-l>'] = cmp.mapping(function()
						    if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						    end
						end, { 'i', 's' }),
			['<C-h>'] = cmp.mapping(function()
						    if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						    end
						end, { 'i', 's' }),

			-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
			--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
		    },
		    sources = {
			{
			    name = 'lazydev',
			    group_index = 0,
			},
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'path' },
			{ name = 'nvim_lsp_signature_help' },
		    },
		}
	    end,
	},

	{ -- You can easily change to a different colorscheme.
	    'folke/tokyonight.nvim',
	    priority = 1000, -- Make sure to load this before all the other start plugins.
	    config = function()
		---@diagnostic disable-next-line: missing-fields
		require('tokyonight').setup {
		    styles = {
			comments = { italic = false }, -- Disable italics in comments
		    },
		}

		-- Load the colorscheme here.
		-- Like many other themes, this one has different styles, and you could load
		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		vim.cmd.colorscheme 'tokyonight-night'
	    end,
	},

	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

	{ 
	    'echasnovski/mini.nvim',
	    config = function()
		require('mini.ai').setup { n_lines = 500 }
		require('mini.surround').setup()

		local statusline = require 'mini.statusline'
		statusline.setup { use_icons = vim.g.have_nerd_font }

		statusline.section_location = function()
		    return '%2l:%-2v'
		end
	    end,
	},
	{ -- Highlight, edit, and navigate code
	    'nvim-treesitter/nvim-treesitter',
	    build = ':TSUpdate',
	    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
	    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	    opts = {
		ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
		    enable = true,
		    additional_vim_regex_highlighting = { 'ruby' },
		},
		indent = { enable = true, disable = { 'ruby' } },
	    },
	    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
	    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
	    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	},
     -- require 'kickstart.plugins.debug',
     -- require 'kickstart.plugins.indent_line',
     -- require 'kickstart.plugins.lint',
     -- require 'kickstart.plugins.autopairs',
     -- require 'kickstart.plugins.neo-tree',
     -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
    }, {
    ui = {
	-- If you are using a Nerd Font: set icons to an empty table which will use the
	-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
	cmd = '⌘',
	config = '🛠',
	event = '📅',
	ft = '📂',
	init = '⚙',
	keys = '🗝',
	plugin = '🔌',
	runtime = '💻',
	require = '🌙',
	source = '📄',
	start = '🚀',
	task = '📌',
	lazy = '💤 ',
    },
    },
})
