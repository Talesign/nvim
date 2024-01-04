local theme = {
  fill = { fg = '#ffffff', bg = '#232136', style = 'italic' },
  head = 'TabLine',
  current_tab = { fg = '#eb6f92', bg = '#232136', style = 'italic' },
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}

require('tabby.tabline').set(function(line)
  return {
    {
      { '', hl = theme.fill },
    },
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      local hl = win.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        win.buf_name(),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        tab.number(),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = '  ',
      }
    end),
    {
      -- line.sep('', theme.tail, theme.fill),
    },
    hl = theme.fill,
  }
end)
