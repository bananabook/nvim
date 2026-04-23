-- must come first
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Settings ]]

require("config.settings")

require("config.keybinds")

-- [[ Basic Autocommands ]]

require("config.autocommands")

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
  { 'NMAC427/guess-indent.nvim', opts = {} },


  require("plugins.gitsigns"),
  require("plugins.which-key"),
  require("plugins.neo-tree"),

  require("plugins.telescope"),

  -- LSP Plugins
  require("plugins.nvim-lspconfig"),

  -- format
  require("plugins.conform"),

  -- require("plugins.blink"),

  require("plugins.tokyonight"),

  -- Highlight todo, notes, etc in comments
  require("plugins.todo-comments"),

  -- different plugins combined
  -- require("plugins.mini"),

  require("plugins.nvim-treesitter"),

  --  Recommended plugins
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommended keymaps
}, { ---@diagnostic disable-line: missing-fields
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

require("config.sane")
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
