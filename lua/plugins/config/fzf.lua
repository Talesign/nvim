vim.api.nvim_set_keymap("n", "<Leader>ff", "<cmd>:FZF<cr>", {})

vim.cmd([[
  let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'relative': v:true, 'yoffset': 1.0 } }
]])

vim.cmd([[
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
]])

vim.cmd([[let g:fzf_commands_override = {
\ 'Files': 'find . -type f -not -path ''./.git/*'' -not -path ''./node_modules/*'''
\ }
]])
