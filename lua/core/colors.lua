-- Color overrides (optional)

function Transparent_override()
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
