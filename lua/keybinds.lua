local M = {}
function M.setup()
  vim.keymap.set('i', 'kj', '<Esc>')
  vim.keymap.set('n', 'J', '<c-e>')
  vim.keymap.set('n', 'K', '<c-y>')

  vim.keymap.set('n', 'j', 'gj')
  vim.keymap.set('n', 'k', 'gk')

  vim.keymap.set('n', 'F3', '<cmd>set wrap!<CR>')

  vim.keymap.set('n', 'ä', '<cmd>nohlsearch<CR>')
  vim.keymap.set('n', '<leader>K', '<cmd>list!<CR>')
  vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')
  vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')
  vim.keymap.set('n', '<leader>Q', '<cmd>x<CR>')

  vim.keymap.set('n', '<leader>b', '<cmd>bn<CR>')
  vim.keymap.set('n', '<leader>B', '<cmd>bp<CR>')
  vim.keymap.set('n', '<leader>d', '<cmd>bd<CR>')

  vim.keymap.set('n', '<leader>v', '<cmd>sp<CR>')
  vim.keymap.set('n', '<leader>g', '<cmd>vs<CR>')

  vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>')

  vim.cmd 'digraph bp 8226 "•'
  vim.cmd 'digraph <3 10084 "❤️'
  vim.cmd 'digraph :) 128516 "😄'
  vim.cmd 'digraph ;) 128521 "😉'
  vim.cmd 'digraph :D 128517 "😅'
  vim.cmd 'digraph ;P 128540 "😜'
  vim.cmd 'digraph :x 128584 "🙈'
  vim.cmd 'digraph :] 129302 "🤖'
  vim.cmd 'digraph :o 128559 "😯'
  vim.cmd 'digraph 0: 128519 "😇'
  vim.cmd 'digraph : 129300 "🤔'
  vim.cmd 'digraph :( 128577 "🙁'
  vim.cmd 'digraph :} 128524 "😌'
  vim.cmd 'digraph :> 128514 "😂'
  vim.cmd 'digraph fs 9733 "★'
  vim.cmd 'digraph es 9734 "☆'
  vim.cmd 'digraph ?! 8253 "‽'
  vim.cmd 'digraph !? 11800 "⸘'
end
return M
