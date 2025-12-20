local M = {}

-- Yank to tmux and set Neovim's "t register
function M.setup_yank_to_tmux()
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      if vim.v.event.regname == 't' then
        local content = table.concat(vim.v.event.regcontents, '\n')
        vim.fn.setreg('t', content) -- make "t available to Neovim
        vim.fn.system('tmux load-buffer -', content) -- send to tmux
      end
    end,
  })
end

-- Keymaps to paste from tmux buffer (not Neovim register)
function M.setup_tmux_paste_keymaps()
  vim.keymap.set('n', '"tp', function()
    local tmux_content = vim.fn.system 'tmux save-buffer -'
    tmux_content = tmux_content:gsub('\r?\n$', '')
    vim.api.nvim_put({ tmux_content }, 'c', true, true)
  end, { noremap = true, silent = true })

  vim.keymap.set('v', '"tp', function()
    local tmux_content = vim.fn.system 'tmux save-buffer -'
    tmux_content = tmux_content:gsub('\r?\n$', '')
    vim.api.nvim_feedkeys('"_d', 'n', false)
    vim.api.nvim_put({ tmux_content }, 'c', true, true)
  end, { noremap = true, silent = true })
end

-- Optional command to pull tmux buffer into Neovim register "t
function M.setup_tmux_to_register_command()
  vim.api.nvim_create_user_command('TmuxToRegisterT', function()
    local content = vim.fn.system 'tmux save-buffer -'
    content = content:gsub('\r?\n$', '')
    vim.fn.setreg('t', content)
  end, {})
end

-- Master setup function
function M.setup()
  M.setup_yank_to_tmux()
  M.setup_tmux_paste_keymaps()
  M.setup_tmux_to_register_command()
end

return M
