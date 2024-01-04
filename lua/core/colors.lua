-- Color overrides (optional)

-- If you are using a colorscheme that does not incluse a way to remove the
-- background, you can just use this function to override every setting.

function transparent_override() 
  local highlights = { 
    "Normal",
    "NormalNC",
    "NormalFloat",
    "LineNr", 
    "Folded", 
    "NonText", 
    "SpecialKey", 
    "VertSplit", 
    "SignColumn", 
    "EndOfBuffer", 
    "TablineFill" 
  } 
  for _, name in pairs(highlights) do 
    vim.cmd.highlight(name .. ' guibg=none ctermbg=none') 
  end 
end
